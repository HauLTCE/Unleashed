import React, { useState, useRef, useEffect, useCallback } from 'react';
import ProductList from '../../components/lists/ProductList';
import MainLayout from '../../layouts/MainLayout';
import bg from '../../assets/images/bg.svg';
import { Link } from 'react-router-dom';
import FilterComponent from '../../components/filters/MultipleFilter';
import { Pagination, CircularProgress, TextField, Box, Breadcrumbs, Typography } from '@mui/material';
import { getProductList } from '../../service/ShopService';
import useDebounce from '../../components/hooks/useDebounce';

const itemsPerPage = 12;

export function Shop() {
    const [page, setPage] = useState(1);

    const [filter, setFilter] = useState({
        brand: '',
        category: '',
        priceOrder: '',
        rating: 0,
        query: ''
    });

    const [searchTerm, setSearchTerm] = useState('');
    const debouncedSearchTerm = useDebounce(searchTerm, 500);

    const [products, setProducts] = useState([]);
    const [pageCount, setPageCount] = useState(0);
    const [totalProducts, setTotalProducts] = useState(0);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const productListRef = useRef(null);

    const handleFilterChange = useCallback((filterUpdate) => {
        setFilter(currentFilter => ({
            ...currentFilter,
            ...filterUpdate,
        }));
        setPage(1);
    }, []);

    useEffect(() => {
        handleFilterChange({ query: debouncedSearchTerm });
    }, [debouncedSearchTerm, handleFilterChange]);

    useEffect(() => {
        const fetchProductsFromServer = async () => {
            setLoading(true);
            setError(null);
            try {
                const data = await getProductList(page, itemsPerPage, filter, true);
                setProducts(data.content || []);
                setPageCount(data.totalPages || 0);
                setTotalProducts(data.totalElements || 0);
            } catch (e) {
                setError('Failed to fetch products. Please try again later.');
                console.error(e);
            } finally {
                setLoading(false);
            }
        };

        fetchProductsFromServer();
    }, [page, filter]);

    const handlePageChange = (event, value) => {
        setPage(value);
        window.scrollTo({ top: productListRef.current?.offsetTop || 0, behavior: 'smooth' });
    };

    return (
        <MainLayout>
            <div className='Shop pb-10'>
                <div className='headerPage relative text-center'>
                    <img className='w-screen h-40 object-cover' src={bg} alt='Background' />
                    <div className='headerName w-full absolute top-0 left-0 flex flex-col items-center justify-center h-full'>
                        <h1 className='font-poppins font-semibold text-2xl text-black'>Shop</h1>
                        <div className='breadcrumbs mt-4'>
                            <Breadcrumbs aria-label='breadcrumb' className='text-black'>
                                <Link to='/' className='font-semibold font-poppins text-black hover:text-blue-600'>
                                    Home
                                </Link>
                                <Typography color='textPrimary' className='font-poppins'>
                                    Shop
                                </Typography>
                            </Breadcrumbs>
                        </div>
                    </div>
                </div>

                <div className='bg-beluBlue h-28'></div>

                <div className='numberProducts pl-16 pt-10'>
                    <p className='font-montserrat font-semibold text-3xl'>
                        {filter.query ? `Found ${totalProducts} results` : `New (${totalProducts})`}
                    </p>
                </div>

                <div className='grid grid-cols-12 gap-4 pt-10'>
                    <div className='col-span-4 px-12'>
                        <FilterComponent onFilter={handleFilterChange} />
                    </div>
                    <div className='col-span-8' ref={productListRef}>
                        <Box sx={{ paddingRight: '2rem', marginBottom: '2rem' }}>
                            <TextField
                                fullWidth
                                label="Search by Product Name..."
                                variant="outlined"
                                value={searchTerm}
                                onChange={(e) => setSearchTerm(e.target.value)}
                            />
                        </Box>

                        {loading ? (
                            <div className='flex justify-center items-center h-96'>
                                <CircularProgress />
                            </div>
                        ) : error ? (
                            <div className='errorLoading text-center'>
                                <p className='font-poppins font-bold text-3xl text-red-500'>{error}</p>
                            </div>
                        ) : products.length > 0 ? (
                            <div className='flex flex-col items-center'>
                                <ProductList products={products} />
                                {pageCount > 1 && (
                                    <div className='paginate mt-6'>
                                        <Pagination
                                            count={pageCount}
                                            page={page}
                                            onChange={handlePageChange}
                                            color='primary'
                                            shape='rounded'
                                            showFirstButton
                                            showLastButton
                                        />
                                    </div>
                                )}
                            </div>
                        ) : (
                            <div className='errorLoading text-center'>
                                <p className='font-poppins font-bold text-3xl'>No products found matching your criteria</p>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </MainLayout>
    );
}

export default Shop;