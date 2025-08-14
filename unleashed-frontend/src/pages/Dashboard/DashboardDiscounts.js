import React, { useState, useEffect, useRef } from "react";
import { Link } from "react-router-dom";
import { apiClient } from "../../core/api";
import useAuthUser from "react-auth-kit/hooks/useAuthUser";
import { toast, Zoom } from "react-toastify";
import useAuthHeader from "react-auth-kit/hooks/useAuthHeader";
import { formatPrice } from "../../components/format/formats";
import DeleteConfirmationModal from "../../components/modals/DeleteConfirmationModal";
import useDebounce from '../../components/hooks/useDebounce';
import {
    Typography, Paper, TextField, Select, MenuItem, FormControl, InputLabel,
    Table, TableBody, TableCell, TableContainer, TableHead, TableRow,
    Skeleton, Tooltip, IconButton, Button, Chip
} from "@mui/material";
import { Edit, Delete, Visibility, PersonAdd, Add } from "@mui/icons-material";
import EnhancedPagination from '../../components/pagination/EnhancedPagination';

const DashboardDiscounts = () => {
    const [discounts, setDiscounts] = useState([]);
    const [loading, setLoading] = useState(true);
    const [discountToDelete, setDiscountToDelete] = useState(null);
    const [isOpen, setIsOpen] = useState(false);
    const [statuses, setStatuses] = useState([]);
    const [types, setTypes] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedStatus, setSelectedStatus] = useState("");
    const [selectedType, setSelectedType] = useState("");
    const debouncedSearchTerm = useDebounce(searchTerm, 500);
    const authUser = useAuthUser();
    const varToken = useAuthHeader();
    const isInitialMount = useRef(true);

    useEffect(() => {
        apiClient.get('/api/discounts/discount-statuses', { headers: { Authorization: varToken } }).then(res => setStatuses(res.data));
        apiClient.get('/api/discounts/discount-types', { headers: { Authorization: varToken } }).then(res => setTypes(res.data));
    }, [varToken]);

    useEffect(() => {
        if (isInitialMount.current) {
            isInitialMount.current = false;
        } else {
            setCurrentPage(1);
        }
    }, [debouncedSearchTerm, selectedStatus, selectedType]);

    useEffect(() => {
        fetchDiscounts();
    }, [currentPage, debouncedSearchTerm, selectedStatus, selectedType]);

    const fetchDiscounts = () => {
        setLoading(true);
        apiClient.get('/api/discounts', {
            headers: { Authorization: varToken },
            params: {
                page: currentPage - 1,
                size: 10,
                search: debouncedSearchTerm,
                statusId: selectedStatus || null,
                typeId: selectedType || null
            }
        })
            .then((response) => {
                setDiscounts(response.data.content);
                setTotalPages(response.data.totalPages);
            })
            .catch((error) => console.error("Error fetching discounts:", error))
            .finally(() => setLoading(false));
    };

    const openDeleteModal = (discount) => {
        setDiscountToDelete(discount);
        setIsOpen(true);
    };

    const handleClose = () => setIsOpen(false);

    const handleDelete = () => {
        apiClient.delete(`/api/discounts/${discountToDelete.discountId}`, { headers: { Authorization: varToken } })
            .then(() => {
                fetchDiscounts();
                handleClose();
                toast.success("Discount deleted successfully", { position: "bottom-right", transition: Zoom });
            })
            .catch(() => toast.error("Failed to delete discount", { position: "bottom-right", transition: Zoom }));
    };

    const getStatusChipColor = (statusName) => {
        switch (statusName?.toUpperCase()) {
            case "ACTIVE": return "success";
            case "EXPIRED": return "error";
            case "INACTIVE": return "default";
            case "USED": return "secondary";
            default: return "primary";
        }
    };

    const TableSkeleton = () => (
        [...Array(10)].map((_, index) => (
            <TableRow key={index}>
                {[...Array(7)].map((_, cellIndex) => <TableCell key={cellIndex}><Skeleton /></TableCell>)}
            </TableRow>
        ))
    );

    return (
        <div className="p-4">
            <div className="flex items-center justify-between mb-4">
                <Typography variant="h4" component="h1" className="font-bold">Discount Management</Typography>
                <Link to="/Dashboard/Discounts/Create">
                    <Button variant="contained" startIcon={<Add />}>Create Discount</Button>
                </Link>
            </div>

            <Paper elevation={2} className="p-4 mb-6 flex flex-col md:flex-row gap-4 items-center">
                <TextField label="Search by Code or Description..." value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} variant="outlined" size="small" className="flex-grow" />
                <FormControl size="small" sx={{ minWidth: 150 }}>
                    <InputLabel>Status</InputLabel>
                    <Select value={selectedStatus} label="Status" onChange={(e) => setSelectedStatus(e.target.value)}>
                        <MenuItem value=""><em>All Statuses</em></MenuItem>
                        {statuses.map((s) => <MenuItem key={s.id} value={s.id}>{s.discountStatusName}</MenuItem>)}
                    </Select>
                </FormControl>
                <FormControl size="small" sx={{ minWidth: 150 }}>
                    <InputLabel>Type</InputLabel>
                    <Select value={selectedType} label="Type" onChange={(e) => setSelectedType(e.target.value)}>
                        <MenuItem value=""><em>All Types</em></MenuItem>
                        {types.map((t) => <MenuItem key={t.id} value={t.id}>{t.discountTypeName}</MenuItem>)}
                    </Select>
                </FormControl>
            </Paper>

            <TableContainer component={Paper} elevation={3}>
                <Table sx={{ minWidth: 650 }}>
                    <TableHead sx={{ backgroundColor: '#f5f5f5' }}>
                        <TableRow>
                            <TableCell sx={{ fontWeight: 'bold' }}>Code</TableCell>
                            <TableCell sx={{ fontWeight: 'bold' }}>Type</TableCell>
                            <TableCell sx={{ fontWeight: 'bold' }}>Rank Req.</TableCell>
                            <TableCell sx={{ fontWeight: 'bold' }}>Value</TableCell>
                            <TableCell sx={{ fontWeight: 'bold' }}>Status</TableCell>
                            <TableCell sx={{ fontWeight: 'bold' }}>Usage</TableCell>
                            <TableCell sx={{ fontWeight: 'bold', textAlign: 'right' }}>Actions</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {loading ? <TableSkeleton /> : discounts.map((d) => (
                            <TableRow key={d.discountId} hover>
                                <TableCell sx={{ fontWeight: 'medium' }}>{d.discountCode}</TableCell>
                                <TableCell>{d.discountType?.discountTypeName}</TableCell>
                                <TableCell>{d.rank?.rankName || 'Any'}</TableCell>
                                <TableCell>{d.discountType?.id === 1 ? `${d.discountValue}%` : formatPrice(d.discountValue)}</TableCell>
                                <TableCell>
                                    <Chip label={d.discountStatus?.discountStatusName} color={getStatusChipColor(d.discountStatus?.discountStatusName)} size="small" />
                                </TableCell>
                                <TableCell>{`${d.usageCount} / ${d.usageLimit}`}</TableCell>
                                <TableCell align="right">
                                    <Tooltip title="View Details"><Link to={`/Dashboard/Discounts/${d.discountId}`}><IconButton color="default"><Visibility /></IconButton></Link></Tooltip>
                                    <Tooltip title="Edit Discount"><Link to={`/Dashboard/Discounts/Edit/${d.discountId}`}><IconButton color="secondary"><Edit /></IconButton></Link></Tooltip>
                                    <Tooltip title="Assign to Users"><Link to={`/Dashboard/Discounts/${d.discountId}/AddAccount`}><IconButton color="primary"><PersonAdd /></IconButton></Link></Tooltip>
                                    <Tooltip title="Delete"><IconButton color="error" onClick={() => openDeleteModal(d)}><Delete /></IconButton></Tooltip>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>

            {totalPages > 1 && (
                <EnhancedPagination currentPage={currentPage} totalPages={totalPages} onPageChange={(page) => setCurrentPage(page)} isLoading={loading} />
            )}

            <DeleteConfirmationModal isOpen={isOpen} onClose={handleClose} onConfirm={handleDelete} name={discountToDelete?.discountCode || ""} />
        </div>
    );
};

export default DashboardDiscounts;