import React, { useState, useEffect, useRef } from 'react';
import { apiClient } from '../../core/api';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import { formatPrice } from '../../components/format/formats';
import { Typography, Button, Skeleton, TextField, Select, MenuItem, FormControl, InputLabel, Chip } from '@mui/material';
import useDebounce from '../../components/hooks/useDebounce';
import EnhancedPagination from '../../components/pagination/EnhancedPagination';

const DashboardStockTransactions = () => {
    // State management
    const [transactions, setTransactions] = useState([]);
    const [loading, setLoading] = useState(true);
    const [currentPage, setCurrentPage] = useState(1);
    const [totalPages, setTotalPages] = useState(1);
    const [searchTerm, setSearchTerm] = useState('');
    const [dateFilter, setDateFilter] = useState('all');
    const [sortOrder, setSortOrder] = useState('newest_first');
    const debouncedSearchTerm = useDebounce(searchTerm, 500);
    const varToken = useAuthHeader();
    const isInitialMount = useRef(true);

    // Effect to reset to page 1 when filters change
    useEffect(() => {
        if (isInitialMount.current) {
            isInitialMount.current = false;
        } else {
            setCurrentPage(1);
        }
    }, [debouncedSearchTerm, dateFilter, sortOrder]);

    // Effect to fetch data when any filter or page changes
    useEffect(() => {
        fetchTransactions();
    }, [currentPage, debouncedSearchTerm, dateFilter, sortOrder]);

    const fetchTransactions = () => {
        setLoading(true);
        apiClient
            .get("/api/stock-transactions", {
                headers: { Authorization: varToken },
                params: {
                    page: currentPage - 1,
                    size: 15,
                    search: debouncedSearchTerm,
                    dateFilter,
                    sort: sortOrder,
                },
            })
            .then((response) => {
                setTransactions(response.data.transactions);
                setTotalPages(response.data.totalPages);
            })
            .catch((error) => console.error("Error fetching stock transactions:", error))
            .finally(() => setLoading(false));
    };

    const getTypeChip = (type) => {
        const isOut = type.toUpperCase() === 'OUT';
        return <Chip label={type} color={isOut ? 'success' : 'info'} size="small" />;
    };

    const TableSkeleton = () => (
        [...Array(10)].map((_, index) => (
            <tr key={index}>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
                <td className='px-4 py-2'><Skeleton variant="text" /></td>
            </tr>
        ))
    );

    return (
        <div className="p-4">
            <Typography variant='h4' className='text-3xl font-bold mb-4'>
                Stock Transaction History
            </Typography>

            {/* Filter and Search Bar */}
            <div className='flex flex-col md:flex-row justify-between items-center mb-4 bg-white p-3 rounded-lg shadow gap-4'>
                <TextField
                    label="Search by Product, Staff, etc..."
                    variant="outlined"
                    size="small"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="w-full md:w-1/3"
                />
                <div className="flex w-full md:w-auto gap-4">
                    <FormControl variant="outlined" size="small" className="flex-grow">
                        <InputLabel>Date Range</InputLabel>
                        <Select
                            value={dateFilter}
                            onChange={(e) => setDateFilter(e.target.value)}
                            label="Date Range"
                        >
                            <MenuItem value="all">All Time</MenuItem>
                            <MenuItem value="today">Today</MenuItem>
                            <MenuItem value="week">This Week</MenuItem>
                            <MenuItem value="month">This Month</MenuItem>
                            <MenuItem value="6months">Last 6 Months</MenuItem>
                        </Select>
                    </FormControl>
                    <FormControl variant="outlined" size="small" className="flex-grow">
                        <InputLabel>Sort By</InputLabel>
                        <Select
                            value={sortOrder}
                            onChange={(e) => setSortOrder(e.target.value)}
                            label="Sort By"
                        >
                            <MenuItem value="newest_first">Date: Newest First</MenuItem>
                            <MenuItem value="oldest_first">Date: Oldest First</MenuItem>
                        </Select>
                    </FormControl>
                </div>
            </div>

            {/* Transactions Table */}
            <div className='overflow-x-auto bg-white rounded-lg shadow'>
                <table className='min-w-full table-fixed'>
                    <thead className='bg-gray-100'>
                    <tr>
                        <th style={{ width: '25%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600'>Product</th>
                        <th style={{ width: '10%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600'>Type</th>
                        <th style={{ width: '10%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600 text-center'>Quantity</th>
                        <th style={{ width: '15%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600'>Price/Unit</th>
                        <th style={{ width: '15%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600'>Staff</th>
                        <th style={{ width: '15%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600'>Provider</th>
                        <th style={{ width: '10%' }} className='px-4 py-3 text-left text-sm font-semibold text-gray-600'>Date</th>
                    </tr>
                    </thead>
                    <tbody className='divide-y divide-gray-200'>
                    {loading ? (
                        <TableSkeleton />
                    ) : transactions.length > 0 ? (
                        transactions.map((t) => (
                            <tr key={t.id} className='hover:bg-gray-50 align-middle'>
                                <td className='px-4 py-2 text-sm text-gray-800'>
                                    <div className="flex items-center gap-3">
                                        <img src={t.variationImage || '/images/placeholder.png'} alt={t.productName} className="h-12 w-12 object-cover rounded-md" />
                                        <div>
                                            <div className="font-semibold">{t.productName || 'N/A'}</div>
                                            <div className="text-xs text-gray-500">{t.colorName || 'N/A'} / {t.sizeName || 'N/A'}</div>
                                        </div>
                                    </div>
                                </td>
                                <td className='px-4 py-2 text-sm'>{getTypeChip(t.transactionTypeName)}</td>
                                <td className='px-4 py-2 text-sm text-center font-semibold'>{t.transactionQuantity}</td>
                                <td className='px-4 py-2 text-sm'>{formatPrice(t.transactionProductPrice || 0)}</td>
                                <td className='px-4 py-2 text-sm'>{t.inchargeEmployeeUsername || 'N/A'}</td>
                                <td className='px-4 py-2 text-sm'>{t.providerName || 'N/A'}</td>
                                <td className='px-4 py-2 text-sm'>{new Date(t.transactionDate).toLocaleDateString()}</td>
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan="7" className="text-center py-10 text-gray-500">
                                No transactions found for the selected filters.
                            </td>
                        </tr>
                    )}
                    </tbody>
                </table>
            </div>

            <EnhancedPagination
                currentPage={currentPage}
                totalPages={totalPages}
                onPageChange={setCurrentPage}
                isLoading={loading}
            />
        </div>
    );
};

export default DashboardStockTransactions;