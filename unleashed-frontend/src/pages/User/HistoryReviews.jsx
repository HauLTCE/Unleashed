import {
    Avatar,
    Box,
    Button,
    Card,
    CircularProgress,
    Container,
    Divider,
    Grid,
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
import UserSideMenu from '../../components/menus/UserMenu';
import { getMyReviews } from '../../service/UserService';

// --- Helper Component: Skeleton Loader ---
// Shows a placeholder UI while data is being fetched
const ReviewTableSkeleton = () => (
    <>
        {[...Array(3)].map((_, index) => (
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

// --- Helper Component: Empty State ---
// Shows a friendly message when there are no reviews
const EmptyReviews = () => (
    <Card variant="outlined" sx={{ mt: 4, textAlign: 'center', p: 4, borderStyle: 'dashed' }}>
        <RateReviewOutlined sx={{ fontSize: 60, color: 'text.secondary', mb: 2 }} />
        <Typography variant="h6" gutterBottom>
            No Reviews Yet
        </Typography>
        <Typography color="text.secondary">
            You haven't reviewed any products. Your feedback helps others!
        </Typography>
    </Card>
);


const ReviewHistory = () => {
    const authHeader = useAuthHeader();
    const user = useAuthUser();
    const [reviews, setReviews] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchReviews = async () => {
            if (user?.username) {
                try {
                    const response = await getMyReviews(authHeader, user.username);
                    if (response?.data) {
                        setReviews(response.data);
                    }
                } catch (error) {
                    console.error('Error fetching reviews:', error);
                } finally {
                    setLoading(false);
                }
            } else {
                setLoading(false);
            }
        };
        fetchReviews();
    }, [authHeader, user]);

    return (
        <Container maxWidth="lg" sx={{ mt: 4 }}>
            <Grid container spacing={4}>
                {/* Side Menu */}
                <Grid item xs={12} md={3}>
                    <UserSideMenu />
                </Grid>

                {/* Main Content */}
                <Grid item xs={12} md={9}>
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
                                        <TableRow key={review.productId} hover>
                                            {/* Column 1: Product Info */}
                                            <TableCell sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
                                                <Avatar
                                                    variant="rounded"
                                                    src={review.product.imageUrl || '/default-product-image.jpg'} // Assuming an image URL exists
                                                    alt={review.product.productName}
                                                />
                                                <Box>
                                                    <Typography variant="subtitle2" fontWeight="bold" noWrap>
                                                        {review.product.productName}
                                                    </Typography>
                                                    {review.comments.length > 0 && (
                                                        <Typography variant="caption" color="text.secondary">
                                                            {new Date(review.comments[0].commentCreatedAt).toLocaleDateString()}
                                                        </Typography>
                                                    )}
                                                </Box>
                                            </TableCell>
                                            {/* Column 2: Rating & Comment */}
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
                                                    {review.comments.length > 0
                                                        ? review.comments[0].commentContent
                                                        : 'No comment provided.'}
                                                </Typography>
                                            </TableCell>
                                            {/* Column 3: Action Button */}
                                            <TableCell align="center">
                                                <Button
                                                    component={Link}
                                                    to={`/shop/product/${review.product.productId}`}
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
                </Grid>
            </Grid>
        </Container>
    );
};

export default ReviewHistory;