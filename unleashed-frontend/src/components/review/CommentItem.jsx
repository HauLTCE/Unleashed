import React, { useState } from 'react';
import { Button, TextField, Box, CircularProgress, Typography } from '@mui/material';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import useAuthUser from 'react-auth-kit/hooks/useAuthUser';
import { postReply, getReplies } from '../../service/CommentService';

const CommentItem = ({ comment, productId }) => {
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
            const data = await getReplies(comment.commentId, pageToFetch, 5);
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
            commentParentId: comment.commentId,
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
            } else {
                setAreRepliesVisible(true);
                fetchReplies(0);
            }
        } catch (error) {
            // Error is handled by the service
        }
    };

    return (
        <div className='relative pt-4 pl-14'>
            {/* Threading Line */}
            <div className="absolute top-0 left-6 h-full w-0.5 bg-gray-200"></div>
            {/* Elbow connector for the line */}
            <div className="absolute top-8 left-6 w-8 h-0.5 bg-gray-200"></div>

            <div className='flex items-start space-x-4'>
                <img
                    src={comment.userImage || 'https://placehold.co/40x40'}
                    alt={`${comment.fullName}'s Profile`}
                    className='w-10 h-10 rounded-full object-cover z-10'
                />
                <div className='flex-1'>
                    <div>
                        <p className='font-semibold text-gray-800 text-sm'>{comment.fullName}</p>
                        <p className='text-xs text-gray-500'>
                            {new Date(comment.createdAt).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })}
                        </p>
                    </div>
                    <p className='text-gray-700 break-words mt-2 text-base'>{comment.reviewComment}</p>

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
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
};

export default CommentItem;