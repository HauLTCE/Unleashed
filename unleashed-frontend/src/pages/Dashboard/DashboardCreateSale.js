import React from 'react';
import { jwtDecode } from 'jwt-decode';
import { useNavigate } from 'react-router-dom';
import { Button, TextField, Typography, Select, MenuItem, FormControl, InputLabel, Box } from '@mui/material';
import { apiClient } from '../../core/api';
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader';
import { Formik, Form } from 'formik';
import * as Yup from 'yup';
import { toast, Zoom } from 'react-toastify';

const DashboardCreateSale = () => {
    const navigate = useNavigate();
    const varToken = useAuthHeader();

    const addOffset = (dateString) => {
        // Example: your server is in +07:00 timezone
        return dateString + ':00+07:00';
    };

    const saleTypes = [
        { id: 1, saleTypeName: 'PERCENTAGE' },
        { id: 2, saleTypeName: 'FIXED AMOUNT' },
    ];

    // Validation schema with Formik & Yup
    // --- CHANGE: Removed 'saleStatus' validation ---
    const validationSchema = Yup.object({
        saleType: Yup.number().required('Sale type is required'),
        saleValue: Yup.number()
            .required('Sale value is required')
            .min(0, 'Sale value cannot be negative')
            .max(99999999, 'Sale value cannot exceed 99999999')
            .test(
                'max-percentage',
                'Sale value cannot be greater than 100 for percentage',
                function (value) {
                    const { saleType } = this.parent;
                    if (saleType === 1 && value > 100) {
                        return false;
                    }
                    return true;
                }
            ),
        startDate: Yup.date().required('Start date is required'),
        endDate: Yup.date()
            .required('End date is required')
            .min(Yup.ref('startDate'), 'End date must be after start date'),
    });

    const handleSubmit = (values) => {
        // --- CHANGE: The backend now handles the status. We don't send it. ---
        // You might need to adjust the payload based on your backend DTO.
        // This example assumes the backend can accept a payload without a status.
        const payload = {
            saleType: { id: values.saleType },
            saleValue: values.saleValue,
            saleStartDate: addOffset(values.startDate),
            saleEndDate: addOffset(values.endDate),
            // The saleStatus field is intentionally omitted.
            // The backend's createSale method will set it to INACTIVE.
        };

        // --- CHANGE: Removed client-side status logic ---
        // The check for active sales with future dates is no longer needed.

        apiClient
            .post('/api/sales', payload, {
                headers: { Authorization: varToken },
            })
            .then((response) => {
                toast.success('Create sale successfully', {
                    position: 'bottom-right',
                    transition: Zoom,
                });
                navigate('/Dashboard/Sales');
            })
            .catch((error) => {
                toast.error('Create sale failed', {
                    position: 'bottom-right',
                    transition: Zoom,
                });
                console.error('Error creating sale:', error);
            });
    };

    return (
        <Box className='max-w-lg mx-auto' p={2}>
            <Typography variant='h4' gutterBottom>
                Create New Sale
            </Typography>

            <Formik
                // --- CHANGE: Removed 'saleStatus' from initial values ---
                initialValues={{
                    saleType: 1,
                    saleValue: '',
                    startDate: '',
                    endDate: '',
                }}
                validationSchema={validationSchema}
                onSubmit={handleSubmit}
            >
                {({ errors, touched, values, setFieldValue, handleBlur, handleChange }) => (
                    <Form className='space-y-6'>
                        {/* Sale Type */}
                        <FormControl
                            fullWidth
                            margin='normal'
                            error={Boolean(errors.saleType && touched.saleType)}
                        >
                            <InputLabel>Sale Type</InputLabel>
                            <Select
                                name='saleType'
                                label='Sale Type'
                                value={values.saleType}
                                onChange={(e) => setFieldValue('saleType', Number(e.target.value))}
                                onBlur={handleBlur}
                            >
                                {saleTypes.map((type) => (
                                    <MenuItem key={type.id} value={type.id}>
                                        {type.saleTypeName}
                                    </MenuItem>
                                ))}
                            </Select>
                            {errors.saleType && touched.saleType && (
                                <Typography color='error' variant='caption'>
                                    {errors.saleType}
                                </Typography>
                            )}
                        </FormControl>

                        {/* Sale Value */}
                        <TextField
                            name='saleValue'
                            label='Sale Value'
                            type='number'
                            fullWidth
                            margin='normal'
                            value={values.saleValue}
                            onChange={handleChange}
                            onBlur={handleBlur}
                            error={Boolean(errors.saleValue && touched.saleValue)}
                            helperText={touched.saleValue && errors.saleValue}
                        />

                        {/* Start Date */}
                        <TextField
                            name='startDate'
                            label='Start Date'
                            type='datetime-local'
                            fullWidth
                            margin='normal'
                            InputLabelProps={{ shrink: true }}
                            value={values.startDate}
                            onChange={handleChange}
                            onBlur={handleBlur}
                            error={Boolean(errors.startDate && touched.startDate)}
                            helperText={touched.startDate && errors.startDate}
                        />

                        {/* End Date */}
                        <TextField
                            name='endDate'
                            label='End Date'
                            type='datetime-local'
                            fullWidth
                            margin='normal'
                            InputLabelProps={{ shrink: true }}
                            value={values.endDate}
                            onChange={handleChange}
                            onBlur={handleBlur}
                            error={Boolean(errors.endDate && touched.endDate)}
                            helperText={touched.endDate && errors.endDate}
                        />

                        {/* --- CHANGE: Sale Status field completely removed --- */}

                        {/* Submit Button */}
                        <Button type='submit' variant='contained' color='primary' fullWidth>
                            Create Sale
                        </Button>
                    </Form>
                )}
            </Formik>
        </Box>
    );
};

export default DashboardCreateSale;