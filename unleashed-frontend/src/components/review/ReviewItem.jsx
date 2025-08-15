import React, { useState } from 'react';
import ReviewStars from '../reviewStars/ReviewStars';
import CommentItem from './CommentItem';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import useAuthUser from 'react-auth-kit/hooks/useAuthUser';
import { postReply, getReplies } from '../../service/CommentService';
import { Button, TextField, Box, CircularProgress, Typography } from '@mui/material';

const ReviewItem = ({ review, productId }) => {
    const authHeader = useAuthHeader();
    const authUser = useAuthUser();

    const [isReplying, setIsReplying] = useState(false);
    const [replyContent, setReplyContent] = useState('');

    const [replies, setReplies] = useState([]);
    const [repliesPage, setRepliesPage] = useState(0);
    const [hasMoreReplies, setHasMoreReplies] = useState(true);
    const [isLoadingReplies, setIsLoadingReplies] = useState(false);
    const [areRepliesVisible, setAreRepliesVisible] = useState(false);

    const fetchReplies = async (pageToFetch) => {
        if (!hasMoreReplies && pageToFetch > 0) return;
        setIsLoadingReplies(true);
        try {
            const data = await getReplies(review.commentId, pageToFetch, 5);
            setReplies(prev => pageToFetch === 0 ? data.content : [...prev, ...data.content]);
            setHasMoreReplies(!data.last);
            setRepliesPage(pageToFetch);
        } catch (error) {
            console.error("Failed to fetch replies.");
        } finally {
            setIsLoadingReplies(false);
        }
    };

    const handleToggleReplies = () => {
        const newVisibility = !areRepliesVisible;
        setAreRepliesVisible(newVisibility);
        if (newVisibility && replies.length === 0) {
            fetchReplies(0);
        }
    };

    const handleLoadMoreReplies = () => {
        fetchReplies(repliesPage + 1);
    };

    const handleSubmitReply = async () => {
        if (!replyContent.trim()) return;
        const newCommentData = {
            commentParentId: review.commentId,
            productId: productId,
            comment: { commentContent: replyContent },
        };
        try {
            await postReply(newCommentData, authHeader);
            setReplyContent('');
            setIsReplying(false);
            setReplies([]);
            setRepliesPage(0);
            setHasMoreReplies(true);
            if (areRepliesVisible) {
                fetchReplies(0);
            }
        } catch (error) {
            // Error is handled by the service
        }
    };

    return (
        <div className='py-6 border-b border-gray-200 last:border-b-0'>
            <div className='flex items-start space-x-4'>
                <img
                    src={review.userImage || 'https://placehold.co/48x48'}
                    alt={`${review.fullName}'s Profile`}
                    className='w-12 h-12 rounded-full object-cover'
                />
                <div className='flex-1'>
                    <div className="flex justify-between items-center">
                        <div>
                            <p className='font-semibold text-gray-800'>{review.fullName}</p>
                            <p className='text-xs text-gray-500'>
                                {new Date(review.createdAt).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })}
                            </p>
                        </div>
                        {review.reviewRating != null && review.reviewRating > 0 && (
                            <ReviewStars rating={review.reviewRating} />
                        )}
                    </div>
                    {review.reviewComment && (
                        <p className='text-gray-700 break-words mt-2 text-base'>{review.reviewComment}</p>
                    )}
                    <div className='mt-3 flex items-center gap-4 text-xs'>
                        {authUser && (
                            <button className="font-semibold text-gray-600 hover:underline" onClick={() => setIsReplying(!isReplying)}>
                                {isReplying ? 'Cancel' : 'Reply'}
                            </button>
                        )}
                        <button className="font-semibold text-gray-600 hover:underline" onClick={handleToggleReplies}>
                            {areRepliesVisible ? 'Hide Replies' : 'View Replies'}
                        </button>
                    </div>

                    {isReplying && (
                        <Box sx={{ mt: 2 }}>
                            <TextField fullWidth multiline rows={2} label="Write your reply..." value={replyContent} onChange={(e) => setReplyContent(e.target.value)} variant="outlined" size="small" />
                            <Button sx={{ mt: 1 }} variant="contained" size="small" onClick={handleSubmitReply}>Submit Reply</Button>
                        </Box>
                    )}

                    {areRepliesVisible && (
                        <div className='mt-4'>
                            {replies.map((reply) => (
                                <CommentItem key={reply.commentId} comment={reply} productId={productId} />
                            ))}
                            {isLoadingReplies && <CircularProgress size={24} sx={{ display: 'block', mx: 'auto', my: 2 }} />}
                            {hasMoreReplies && !isLoadingReplies && (
                                <Button size="small" sx={{ mt: 1 }} onClick={handleLoadMoreReplies}>
                                    Load More Replies
                                </Button>
                            )}
                            {!isLoadingReplies && replies.length === 0 && (
                                <Typography variant="caption" color="text.secondary">No replies yet.</Typography>
                            )}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default ReviewItem;