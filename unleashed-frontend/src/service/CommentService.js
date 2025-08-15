import { apiClient } from '../core/api';
import { toast } from 'react-toastify';

export const postReply = async (commentData, authHeader) => {
    try {
        const response = await apiClient.post('/api/comments', commentData, {
            headers: { Authorization: authHeader },
        });
        toast.success("Your reply has been posted!");
        return response.data;
    } catch (error) {
        toast.error(error.response?.data?.message || "Failed to post reply.");
        throw error;
    }
};

export const getReplies = async (commentId, page = 0, size = 5) => {
    try {
        const response = await apiClient.get(`/api/reviews/comments/${commentId}/replies`, {
            params: {
                page,
                size,
            },
        });
        return response.data;
    } catch (error) {
        console.error(`Error fetching replies for comment ${commentId}:`, error);
        throw error;
    }
};