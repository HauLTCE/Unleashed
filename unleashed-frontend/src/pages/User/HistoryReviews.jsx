import {
    Avatar,
    Box,
    Button,
    Card,
    Divider,
    Paper,
    Rating,
    Skeleton,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableRow,
    Typography,
} from '@mui/material';
import { RateReviewOutlined } from '@mui/icons-material';
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import useAuthUser from 'react-auth-kit/hooks/useAuthUser';
import { getMyReviews } from '../../service/UserService';
import EnhancedPagination from '../../components/pagination/EnhancedPagination';
import useDebounce from '../../components/hooks/useDebounce';

const ReviewTableSkeleton = () => (
    <>
        {[...Array(5)].map((_, index) => (
            <TableRow key={index}>
                <TableCell sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
                    <Skeleton variant="circular" width={40} height={40} />
                    <Box>
                        <Skeleton variant="text" width={150} />
                        <Skeleton variant="text" width={100} />
                    </Box>
                </TableCell>
                <TableCell>
                    <Skeleton variant="text" width="80%" />
                    <Skeleton variant="text" width="60%" />
                </TableCell>
                <TableCell align="center">
                    <Skeleton variant="rectangular" width={110} height={36} />
                </TableCell>
            </TableRow>
        ))}
    </>
);

const EmptyReviews = () => (
    <Card variant="outlined" sx={{ mt: 4, textAlign: 'center', p: 4, borderStyle: 'dashed' }}>
        <RateReviewOutlined sx={{ fontSize: 60, color: 'text.secondary', mb: 2 }} />
        <Typography variant="h6" gutterBottom>
            No Reviews Yet
        </Typography>
        <Typography color="text.secondary">
            You haven't rated any products yet. Your feedback helps others!
        </Typography>
    </Card>
);

const ReviewHistory = () => {
    const authHeader = useAuthHeader();
    const user = useAuthUser();
    const [reviews, setReviews] = useState([]);
    const [loading, setLoading] = useState(true);

    const [page, setPage] = useState(0);
    const [totalPages, setTotalPages] = useState(0);
    const debouncedPage = useDebounce(page, 500);

    useEffect(() => {
        const fetchReviews = async () => {
            if (user?.username) {
                setLoading(true);
                try {
                    const response = await getMyReviews(authHeader, user.username, debouncedPage, 5);
                    if (response?.data) {
                        setReviews(response.data.content);
                        setTotalPages(response.data.totalPages);
                    }
                } catch (error) {
                    console.error('Error fetching reviews:', error);
                    setReviews([]);
                } finally {
                    setLoading(false);
                }
            } else {
                setLoading(false);
                setReviews([]);
            }
        };
        fetchReviews();
    }, [authHeader, user, debouncedPage]);

    const handlePageChange = (newPage) => {
        setPage(newPage);
    };

    return (
        <Box>
            <Typography variant="h4" fontWeight="bold" gutterBottom>
                Review History
            </Typography>
            <Divider sx={{ mb: 3 }} />

            <TableContainer component={Paper} variant="outlined">
                <Table sx={{ minWidth: 650 }}>
                    <TableHead sx={{ backgroundColor: 'action.hover' }}>
                        <TableRow>
                            <TableCell sx={{ fontWeight: 'bold' }}>Product</TableCell>
                            <TableCell sx={{ fontWeight: 'bold' }}>Your Review</TableCell>
                            <TableCell align="center" sx={{ fontWeight: 'bold' }}>Action</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {loading ? (
                            <ReviewTableSkeleton />
                        ) : reviews.length > 0 ? (
                            reviews.map((review) => (
                                <TableRow key={review.id} hover>
                                    <TableCell sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
                                        <Avatar
                                            variant="rounded"
                                            src={review.product?.imageUrl || '/default-product-image.jpg'}
                                            alt={review.product?.productName}
                                        />
                                        <Box>
                                            <Typography variant="subtitle2" fontWeight="bold" noWrap>
                                                {review.product?.productName}
                                            </Typography>
                                            {review.comments.find(c => c.commentParentId === null) && (
                                                <Typography variant="caption" color="text.secondary">
                                                    {new Date(review.comments.find(c => c.commentParentId === null)?.commentCreatedAt).toLocaleDateString()}
                                                </Typography>
                                            )}
                                        </Box>
                                    </TableCell>
                                    <TableCell>
                                        <Rating value={review.reviewRating} readOnly size="small" />
                                        <Typography
                                            variant="body2"
                                            color="text.secondary"
                                            sx={{
                                                mt: 0.5,
                                                display: '-webkit-box',
                                                WebkitLineClamp: 2,
                                                WebkitBoxOrient: 'vertical',
                                                overflow: 'hidden',
                                                textOverflow: 'ellipsis',
                                            }}
                                        >
                                            {review.comments.find(c => c.commentParentId === null)?.commentContent || 'No comment provided.'}
                                        </Typography>
                                    </TableCell>
                                    <TableCell align="center">
                                        <Button
                                            component={Link}
                                            to={`/shop/product/${review.product?.productId}`}
                                            variant="outlined"
                                            size="small"
                                        >
                                            View Product
                                        </Button>
                                    </TableCell>
                                </TableRow>
                            ))
                        ) : (
                            <TableRow>
                                <TableCell colSpan={3}>
                                    <EmptyReviews />
                                </TableCell>
                            </TableRow>
                        )}
                    </TableBody>
                </Table>
            </TableContainer>
            {totalPages > 1 && (
                <EnhancedPagination
                    currentPage={page}
                    totalPages={totalPages}
                    onPageChange={handlePageChange}
                    isLoading={loading}
                />
            )}
        </Box>
    );
};

export default ReviewHistory;