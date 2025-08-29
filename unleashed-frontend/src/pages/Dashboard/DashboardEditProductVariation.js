import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from 'react-router-dom';
import { apiClient } from '../../core/api';
import { toast } from 'react-toastify';
import {
    Typography,
    TextField,
    Button,
    Box,
    InputLabel,
    MenuItem,
    Select,
    FormControl,
    CircularProgress,
    Paper,
    Grid,
    Avatar,
    Skeleton,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';

const EditVariationSkeleton = () => (
    <div className="p-4">
        <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 4 }}>
            <Skeleton variant="text" width={300} height={50} />
            <Skeleton variant="rectangular" width={100} height={40} />
        </Box>
        <Paper sx={{ p: 4 }}>
            <Grid container spacing={3}>
                <Grid item xs={12} sm={6}><Skeleton variant="rectangular" height={56} /></Grid>
                <Grid item xs={12} sm={6}><Skeleton variant="rectangular" height={56} /></Grid>
                <Grid item xs={12}><Skeleton variant="rectangular" height={56} /></Grid>
                <Grid item xs={12}><Skeleton variant="rectangular" width={150} height={40} /></Grid>
                <Grid item xs={12}><Skeleton variant="circular" width={120} height={120} /></Grid>
                <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-end' }}>
                    <Skeleton variant="rectangular" width={180} height={40} />
                </Grid>
            </Grid>
        </Paper>
    </div>
);

const DashboardEditProductVariation = () => {
    const { productId, productVariationId } = useParams();
    const navigate = useNavigate();
    const varToken = useAuthHeader();
    const [sizeId, setSizeId] = useState('');
    const [colorId, setColorId] = useState('');
    const [variationPrice, setVariationPrice] = useState('');
    const [variationImageFile, setVariationImageFile] = useState(null);
    const [currentImageUrl, setCurrentImageUrl] = useState('');
    const [newImagePreview, setNewImagePreview] = useState(null);
    const [sizes, setSizes] = useState([]);
    const [colors, setColors] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchData = async () => {
            setLoading(true);
            try {
                const [variationRes, sizesRes, colorsRes] = await Promise.all([
                    apiClient.get(`/api/product-variations/${productVariationId}`, { headers: { Authorization: varToken } }),
                    apiClient.get('/api/sizes', { headers: { Authorization: varToken } }),
                    apiClient.get('/api/colors', { headers: { Authorization: varToken } })
                ]);
                const { size, color, variationPrice, variationImage } = variationRes.data;
                setSizeId(size.id);
                setColorId(color.id);
                setVariationPrice(variationPrice);
                setCurrentImageUrl(variationImage);
                setSizes(sizesRes.data);
                setColors(colorsRes.data);
            } catch (error) {
                toast.error("Failed to fetch variation data.");
            } finally {
                setLoading(false);
            }
        };
        fetchData();
    }, [productVariationId, varToken]);

    const handleImageChange = (e) => {
        const file = e.target.files[0];
        if (file) {
            setVariationImageFile(file);
            setNewImagePreview(URL.createObjectURL(file));
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        try {
            let imageUrl = currentImageUrl;
            if (variationImageFile) {
                const formData = new FormData();
                formData.append('image', variationImageFile);
                const uploadResponse = await fetch('https://api.imgbb.com/1/upload?key=37a8229aac308c0f3568b5163a7104f8', { method: 'POST', body: formData });
                const uploadData = await uploadResponse.json();
                if (uploadData.success) {
                    imageUrl = uploadData.data.display_url;
                } else {
                    throw new Error('Image upload failed');
                }
            }
            await apiClient.put(
                `/api/product-variations/${productVariationId}`,
                { sizeId, colorId, productPrice: variationPrice, productVariationImage: imageUrl },
                { headers: { Authorization: varToken } }
            );
            toast.success('Product Variation updated successfully');
            navigate(`/Dashboard/Products`);
        } catch (error) {
            toast.error('Update failed');
        } finally {
            setLoading(false);
        }
    };

    if (loading && !sizes.length) {
        return <EditVariationSkeleton />;
    }

    return (
        <div className="p-4">
            <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 4 }}>
                <Typography variant="h4" className="text-3xl font-bold">
                    Edit Product Variation
                </Typography>
                <Button startIcon={<ArrowBack />} onClick={() => navigate("/Dashboard/Products")} variant="outlined">
                    Back to Products
                </Button>
            </Box>

            <form onSubmit={handleSubmit}>
                <Paper sx={{ p: 4 }} className="bg-white rounded-lg shadow">
                    <Grid container spacing={3}>
                        <Grid item xs={12} sm={6}>
                            <FormControl fullWidth required>
                                <InputLabel>Size</InputLabel>
                                <Select value={sizeId} onChange={(e) => setSizeId(e.target.value)} label='Size'>
                                    {sizes.map((size) => <MenuItem key={size.id} value={size.id}>{size.sizeName}</MenuItem>)}
                                </Select>
                            </FormControl>
                        </Grid>
                        <Grid item xs={12} sm={6}>
                            <FormControl fullWidth required>
                                <InputLabel>Color</InputLabel>
                                <Select value={colorId} onChange={(e) => setColorId(e.target.value)} label='Color'>
                                    {colors.map((color) => <MenuItem key={color.id} value={color.id}>{color.colorName}</MenuItem>)}
                                </Select>
                            </FormControl>
                        </Grid>
                        <Grid item xs={12}>
                            <TextField label='Variation Price' type='number' fullWidth required value={variationPrice} onChange={(e) => setVariationPrice(e.target.value)} inputProps={{ min: 0 }}/>
                        </Grid>
                        <Grid item xs={12}>
                            <Button variant='outlined' component='label'>
                                Upload New Image
                                <input type='file' accept='image/*' onChange={handleImageChange} hidden />
                            </Button>
                        </Grid>
                        <Grid item xs={12} sx={{ display: 'flex', gap: 4, mt: 2 }}>
                            {currentImageUrl && (
                                <Box textAlign="center">
                                    <Typography variant="caption" display="block" gutterBottom>Current Image</Typography>
                                    <Avatar src={currentImageUrl} alt='Current' variant="rounded" sx={{ width: 120, height: 120 }} />
                                </Box>
                            )}
                            {newImagePreview && (
                                <Box textAlign="center">
                                    <Typography variant="caption" display="block" gutterBottom>New Preview</Typography>
                                    <Avatar src={newImagePreview} alt='New Preview' variant="rounded" sx={{ width: 120, height: 120 }} />
                                </Box>
                            )}
                        </Grid>
                        <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-end', mt: 2 }}>
                            <Button type='submit' variant='contained' color='primary' size="large" disabled={loading}>
                                {loading ? <CircularProgress size={24} color='inherit' /> : 'Update Variation'}
                            </Button>
                        </Grid>
                    </Grid>
                </Paper>
            </form>
        </div>
    );
};

export default DashboardEditProductVariation;