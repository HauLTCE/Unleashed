import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import { Button, TextField, Typography, Select, MenuItem, FormControl, InputLabel } from '@mui/material';
import { useFormik } from 'formik';
import * as Yup from 'yup';
import { apiClient } from '../../core/api';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import { toast, Zoom } from 'react-toastify';

const convertToOffsetDateTime = (value) => {
    if (!value) return '';
    if (value.length === 16) {
        return value + ':00Z'; // Or use the correct server offset
    }
    return value;
};

// --- CHANGE: Removed 'saleStatus' validation ---
const validationSchema = Yup.object({
    saleType: Yup.string()
        .required('Sale type is required')
        .oneOf(['PERCENTAGE', 'FIXED AMOUNT'], 'Invalid sale type'),
    saleValue: Yup.number()
        .required('Sale value is required')
        .min(0, 'Sale value cannot be negative')
        .when('saleType', {
            is: 'PERCENTAGE',
            then: (schema) => schema.max(100, 'Sale value cannot be greater than 100 for percentage'),
        })
        .max(999999999, 'Sale value cannot exceed 999999999999'),
    startDate: Yup.date().required('Start date is required'),
    endDate: Yup.date()
        .required('End date is required')
        .min(Yup.ref('startDate'), 'End date must be after start date'),
});

const DashboardEditSale = () => {
    const [initialValues, setInitialValues] = useState({
        saleType: '',
        saleValue: '',
        startDate: '',
        endDate: '',
        saleStatus: '', // We still need this to display the current status
    });

    const navigate = useNavigate();
    const { saleId } = useParams();
    const varToken = useAuthHeader();

    const formatDateTime = (dateString) => {
        if (!dateString) return '';
        const date = new Date(dateString);
        return date.toISOString().slice(0, 16);
    };

    useEffect(() => {
        apiClient
            .get(`/api/sales/${saleId}`, {
                headers: { Authorization: varToken },
            })
            .then((response) => {
                const sale = response.data;
                setInitialValues({
                    saleType: sale.saleType.saleTypeName,
                    saleValue: sale.saleValue,
                    startDate: formatDateTime(sale.saleStartDate),
                    endDate: formatDateTime(sale.saleEndDate),
                    saleStatus: sale.saleStatus.saleStatusName, // Set for display purposes
                });
            })
            .catch((error) => {
                console.error('Error fetching sale details:', error);
            });
    }, [saleId, varToken]);

    const formik = useFormik({
        initialValues,
        enableReinitialize: true,
        validationSchema,
        onSubmit: (values) => {
            // --- CHANGE: The payload no longer includes the saleStatus ---
            // The backend will manage the status via the scheduler.
            const payload = {
                // Find the saleType object based on its name
                saleType: { saleTypeName: values.saleType },
                saleValue: values.saleValue,
                saleStartDate: convertToOffsetDateTime(values.startDate),
                saleEndDate: convertToOffsetDateTime(values.endDate),
                // saleStatus is intentionally omitted from the payload
            };

            // --- CHANGE: Client-side status logic removed ---

            apiClient
                .put(`/api/sales/${saleId}`, payload, {
                    headers: { Authorization: varToken },
                })
                .then((response) => {
                    toast.success('Update sale successfully', {
                        position: 'bottom-right',
                        transition: Zoom,
                    });
                    navigate('/Dashboard/Sales');
                })
                .catch((error) => {
                    toast.error(error.response?.data?.message || 'Update sale failed', {
                        position: 'bottom-right',
                        transition: Zoom,
                    });
                    console.error('Error updating sale:', error);
                });
        },
    });

    return (
        <div className='max-w-lg mx-auto p-4'>
            <Typography variant='h4' gutterBottom>
                Edit Sale #{saleId}
            </Typography>
            <form onSubmit={formik.handleSubmit} className='space-y-6'>
                {/* Sale Type (read-only) */}
                <TextField
                    label="Sale Type"
                    value={formik.values.saleType}
                    fullWidth
                    margin="normal"
                    disabled // Cannot change the type of an existing sale
                />

                {/* Sale Value */}
                <TextField
                    label='Sale Value'
                    type='number'
                    name='saleValue'
                    value={formik.values.saleValue}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    fullWidth
                    margin='normal'
                    required
                    error={formik.touched.saleValue && Boolean(formik.errors.saleValue)}
                    helperText={formik.touched.saleValue && formik.errors.saleValue}
                />

                {/* Start Date */}
                <TextField
                    label='Start Date'
                    type='datetime-local'
                    name='startDate'
                    value={formik.values.startDate}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    fullWidth
                    margin='normal'
                    InputLabelProps={{ shrink: true }}
                    required
                    error={formik.touched.startDate && Boolean(formik.errors.startDate)}
                    helperText={formik.touched.startDate && formik.errors.startDate}
                />

                {/* End Date */}
                <TextField
                    label='End Date'
                    type='datetime-local'
                    name='endDate'
                    value={formik.values.endDate}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    fullWidth
                    margin='normal'
                    InputLabelProps={{ shrink: true }}
                    required
                    error={formik.touched.endDate && Boolean(formik.errors.endDate)}
                    helperText={formik.touched.endDate && formik.errors.endDate}
                />

                {/* --- CHANGE: Sale Status is now a disabled TextField for display only --- */}
                <TextField
                    name="saleStatus"
                    label="Current Status"
                    value={formik.values.saleStatus}
                    fullWidth
                    margin="normal"
                    disabled // User cannot change this
                    InputLabelProps={{ shrink: true }}
                />

                {/* Submit Button */}
                <Button type='submit' variant='contained' color='primary' fullWidth>
                    Update Sale
                </Button>
            </form>
        </div>
    );
};

export default DashboardEditSale;