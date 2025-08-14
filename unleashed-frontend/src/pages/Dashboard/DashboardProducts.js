import React, { useEffect, useState, useCallback } from 'react';
import { Link } from 'react-router-dom';
import {
    TextField,
    Pagination,
    CircularProgress,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableRow,
    Paper,
    IconButton,
    Box,
    Tooltip
} from '@mui/material';
import { FaEdit, FaPlus, FaTrash } from 'react-icons/fa';
import { toast } from 'react-toastify';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import { formatPrice } from '../../components/format/formats';
import useAuthUser from 'react-auth-kit/hooks/useAuthUser';
import DeleteConfirmationModal from '../../components/modals/DeleteConfirmationModal';
import { getProductList } from '../../service/ShopService';
import useDebounce from '../../components/hooks/useDebounce';
import { apiClient } from '../../core/api';

const DashboardProducts = () => {
    const [products, setProducts] = useState([]);
    const [page, setPage] = useState(1);
    const [pageCount, setPageCount] = useState(0);
    const [loading, setLoading] = useState(true);
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [selectedProduct, setSelectedProduct] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const debouncedSearchTerm = useDebounce(searchTerm, 500);

    const role = useAuthUser()?.role;
    const varToken = useAuthHeader();
    const itemsPerPage = 10;

    const fetchProducts = useCallback(async () => {
        setLoading(true);
        try {
            const filters = { query: debouncedSearchTerm };
            const data = await getProductList(page, itemsPerPage, filters);
            setProducts(data.content || []);
            setPageCount(data.totalPages || 0);
        } catch (error) {
            console.error('Error fetching products:', error);
            toast.error('Failed to fetch products.');
        } finally {
            setLoading(false);
        }
    }, [page, debouncedSearchTerm]);

    useEffect(() => {
        fetchProducts();
    }, [fetchProducts]);

    const handleSearchChange = (event) => {
        setSearchTerm(event.target.value);
        setPage(1);
    };

    const handlePageChange = (event, value) => {
        setPage(value);
    };

    const handleDeleteProduct = async (productId) => {
        try {
            await apiClient.delete(`/api/products/${productId}`, {
                headers: { Authorization: varToken },
            });
            toast.success('Product deleted successfully', { position: 'bottom-right' });
            if (products.length === 1 && page > 1) {
                setPage(page - 1);
            } else {
                fetchProducts();
            }
        } catch (error) {
            console.error('Error deleting product:', error);
            toast.error('Failed to delete product', { position: 'bottom-right' });
        } finally {
            setIsModalOpen(false);
            setSelectedProduct(null);
        }
    };

    const handleOpenModal = (product) => {
        setSelectedProduct(product);
        setIsModalOpen(true);
    };

    const handleCloseModal = () => {
        setIsModalOpen(false);
        setSelectedProduct(null);
    };

    return (
        <div>
            <div className='flex items-center justify-between mb-6'>
                <h1 className='text-4xl font-bold'>Products</h1>
                {role !== 'STAFF' && (
                    <Link to='/Dashboard/Products/Add'>
                        <button className='text-blue-600 border border-blue-500 px-4 py-2 rounded-lg flex items-center'>
                            <FaPlus className='mr-2' /> Add New Product
                        </button>
                    </Link>
                )}
            </div>

            <TextField
                label='Search Products by Name'
                variant='outlined'
                value={searchTerm}
                onChange={handleSearchChange}
                fullWidth
                margin='normal'
            />

            {loading ? (
                <div className="flex justify-center items-center h-64">
                    <CircularProgress />
                </div>
            ) : (
                <>
                    <TableContainer component={Paper}>
                        <Table sx={{ minWidth: 650 }} aria-label="products table">
                            <TableHead>
                                <TableRow sx={{ backgroundColor: '#f5f5f5' }}>
                                    <TableCell sx={{ fontWeight: 'bold' }}>Image</TableCell>
                                    <TableCell sx={{ fontWeight: 'bold' }}>Product Name</TableCell>
                                    <TableCell sx={{ fontWeight: 'bold' }}>Brand</TableCell>
                                    <TableCell sx={{ fontWeight: 'bold' }}>Price</TableCell>
                                    <TableCell sx={{ fontWeight: 'bold' }} align="center">Stock</TableCell>
                                    <TableCell sx={{ fontWeight: 'bold' }}>Rating</TableCell>
                                    <TableCell sx={{ fontWeight: 'bold' }} align="center">Actions</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {products.length > 0 ? (
                                    products.map((product) => (
                                        <TableRow key={product.productId} hover>
                                            <TableCell>
                                                <img
                                                    src={product.productVariationImage || 'https://placehold.co/60x60'}
                                                    alt={product.productName}
                                                    style={{ width: 60, height: 60, objectFit: 'cover', borderRadius: '4px' }}
                                                />
                                            </TableCell>
                                            <TableCell component="th" scope="row">
                                                <Link to={`/shop/product/${product.productId}`} className="hover:underline text-blue-600">
                                                    {product.productName}
                                                </Link>
                                            </TableCell>
                                            <TableCell>{product.brandName || 'N/A'}</TableCell>
                                            <TableCell>{product.productPrice ? formatPrice(product.productPrice) : 'N/A'}</TableCell>
                                            <TableCell align="center">{product.quantity ?? 0}</TableCell>
                                            <TableCell>
                                                {product.averageRating.toFixed(1)} ({product.totalRatings})
                                            </TableCell>
                                            <TableCell align="center">
                                                <Box sx={{ display: 'flex', justifyContent: 'center', gap: 0.5 }}>
                                                    {role !== 'STAFF' && (
                                                        <>
                                                            <Tooltip title="Edit">
                                                                <IconButton component={Link} to={`/Dashboard/Products/Edit/${product.productId}`} color="primary" size="small">
                                                                    <FaEdit />
                                                                </IconButton>
                                                            </Tooltip>
                                                            <Tooltip title="Delete">
                                                                <IconButton onClick={() => handleOpenModal(product)} color="error" size="small">
                                                                    <FaTrash />
                                                                </IconButton>
                                                            </Tooltip>
                                                        </>
                                                    )}
                                                </Box>
                                            </TableCell>
                                        </TableRow>
                                    ))
                                ) : (
                                    <TableRow>
                                        <TableCell colSpan={7} align="center">
                                            No products found.
                                        </TableCell>
                                    </TableRow>
                                )}
                            </TableBody>
                        </Table>
                    </TableContainer>

                    {pageCount > 1 && (
                        <div className='flex justify-center mt-8'>
                            <Pagination
                                count={pageCount}
                                page={page}
                                onChange={handlePageChange}
                                color="primary"
                                showFirstButton
                                showLastButton
                            />
                        </div>
                    )}
                </>
            )}

            <DeleteConfirmationModal
                isOpen={isModalOpen}
                onClose={handleCloseModal}
                onConfirm={() => handleDeleteProduct(selectedProduct.productId)}
                name={selectedProduct ? selectedProduct.productName : ''}
            />
        </div>
    );
};

export default DashboardProducts;