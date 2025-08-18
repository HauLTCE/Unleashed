import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { Button, CircularProgress, Container, Grid, MenuItem, Paper, TextField, Typography } from "@mui/material";
import { Field, Form, Formik } from "formik";
import * as Yup from "yup";
import { apiClient } from "../../core/api";
import useAuthHeader from "react-auth-kit/hooks/useAuthHeader";
import { toast, Zoom } from "react-toastify";

const formatDateTimeForInput = (dateString) => {
    if (!dateString) return '';
    try {
        const date = new Date(dateString);
        return new Date(date.getTime() - (date.getTimezoneOffset() * 60000)).toISOString().slice(0, 16);
    } catch (error) {
        return '';
    }
};

const convertToOffsetDateTime = (localDateTime) => {
    if (!localDateTime) return null;
    return new Date(localDateTime).toISOString();
};

const validationSchema = Yup.object({
    discountCode: Yup.string().required("Required"),
    discountType: Yup.number().required("Discount type is required").oneOf([1, 2]),
    discountValue: Yup.number()
        .required("Discount value is required")
        .min(0, "Discount value cannot be negative")
        .when("discountType", {
            is: 1,
            then: (schema) => schema.max(100, "Percentage value cannot exceed 100"),
        }),
    startDate: Yup.date().required("Start date is required"),
    endDate: Yup.date().required("End date is required").min(Yup.ref("startDate"), "End date must be after start date"),
    discountDescription: Yup.string().nullable(),
    minimumOrderValue: Yup.number().min(0, "Cannot be negative").nullable(),
    maximumDiscountValue: Yup.number()
        .min(0, "Cannot be negative")
        .nullable()
        .when("discountType", {
            is: 2,
            then: (schema) => schema.test("is-null", "Max value must be null for Fixed Amount type", (v) => v === null || v === undefined || v === ''),
        }),
    usageLimit: Yup.number().required("Usage limit is required").min(1, "Usage limit must be at least 1"),
    discountRank: Yup.number().required("Discount rank is required").oneOf([1, 2, 3, 4, 5]),
});

const DashboardEditDiscount = () => {
    const [initialValues, setInitialValues] = useState(null);
    const [loading, setLoading] = useState(true);
    const navigate = useNavigate();
    const { discountId } = useParams();
    const varToken = useAuthHeader();

    useEffect(() => {
        if (discountId) {
            setLoading(true);
            apiClient.get(`/api/discounts/${discountId}`, { headers: { Authorization: varToken } })
                .then((response) => {
                    const discount = response.data;
                    setInitialValues({
                        discountCode: discount.discountCode || "",
                        discountType: discount.discountType?.id || 1,
                        discountValue: discount.discountValue || "",
                        startDate: formatDateTimeForInput(discount.startDate),
                        endDate: formatDateTimeForInput(discount.endDate),
                        discountStatusName: discount.discountStatus?.discountStatusName || "N/A",
                        discountDescription: discount.discountDescription || "",
                        minimumOrderValue: discount.minimumOrderValue || "",
                        maximumDiscountValue: discount.maximumDiscountValue || "",
                        usageLimit: discount.usageLimit || "",
                        discountRank: discount.rank?.id || 1,
                        usageCount: discount.usageCount || 0,
                    });
                })
                .catch(() => toast.error("Failed to load discount details.", { position: "bottom-right", transition: Zoom }))
                .finally(() => setLoading(false));
        }
    }, [discountId, varToken]);

    const handleSubmit = (values, { setSubmitting }) => {
        const requestBody = {
            discountCode: values.discountCode,
            discountType: { id: values.discountType },
            discountValue: values.discountValue,
            startDate: convertToOffsetDateTime(values.startDate),
            endDate: convertToOffsetDateTime(values.endDate),
            discountDescription: values.discountDescription,
            minimumOrderValue: values.minimumOrderValue || null,
            maximumDiscountValue: values.maximumDiscountValue || null,
            usageLimit: values.usageLimit,
            rank: { id: values.discountRank },
            usageCount: values.usageCount
        };

        apiClient.put(`/api/discounts/${discountId}`, requestBody, { headers: { Authorization: varToken } })
            .then(() => {
                toast.success("Discount updated successfully!", { position: "bottom-right", transition: Zoom });
                navigate("/Dashboard/Discounts");
            })
            .catch(() => toast.error("Failed to update discount.", { position: "bottom-right", transition: Zoom }))
            .finally(() => setSubmitting(false));
    };

    if (loading) {
        return (
            <Container maxWidth="md" sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '80vh' }}>
                <CircularProgress />
            </Container>
        );
    }

    return (
        <Container maxWidth="md" className="p-4">
            <Typography variant="h4" gutterBottom fontWeight="bold">Edit Discount #{discountId}</Typography>
            <Formik
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={handleSubmit}
                enableReinitialize
            >
                {({ errors, touched, values, isSubmitting }) => (
                    <Form>
                        <Paper elevation={3} sx={{ p: 3 }}>
                            <Grid container spacing={3}>
                                <Grid item xs={12}>
                                    <Field as={TextField} name="discountCode" label="Discount Code" fullWidth disabled />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="discountType" label="Discount Type" select fullWidth
                                           required error={touched.discountType && !!errors.discountType}
                                           helperText={touched.discountType && errors.discountType}>
                                        <MenuItem value={1}>Percentage</MenuItem>
                                        <MenuItem value={2}>Fixed Amount</MenuItem>
                                    </Field>
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="discountValue" label="Discount Value" type="number"
                                           fullWidth required error={touched.discountValue && !!errors.discountValue}
                                           helperText={touched.discountValue && errors.discountValue} />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="startDate" label="Start Date" type="datetime-local"
                                           fullWidth required InputLabelProps={{ shrink: true }}
                                           error={touched.startDate && !!errors.startDate}
                                           helperText={touched.startDate && errors.startDate} />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="endDate" label="End Date" type="datetime-local"
                                           fullWidth required InputLabelProps={{ shrink: true }}
                                           error={touched.endDate && !!errors.endDate}
                                           helperText={touched.endDate && errors.endDate} />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <TextField
                                        name="discountStatusName"
                                        label="Current Status"
                                        value={values.discountStatusName}
                                        fullWidth
                                        disabled
                                        InputLabelProps={{ shrink: true }}
                                    />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="usageLimit" label="Usage Limit" type="number" fullWidth
                                           required error={touched.usageLimit && !!errors.usageLimit}
                                           helperText={touched.usageLimit && errors.usageLimit} />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="minimumOrderValue" label="Minimum Order Value"
                                           type="number" fullWidth
                                           error={touched.minimumOrderValue && !!errors.minimumOrderValue}
                                           helperText={touched.minimumOrderValue && errors.minimumOrderValue} />
                                </Grid>
                                <Grid item xs={12} sm={6}>
                                    <Field as={TextField} name="maximumDiscountValue" label="Maximum Discount Value"
                                           type="number" fullWidth disabled={values.discountType === 2}
                                           error={touched.maximumDiscountValue && !!errors.maximumDiscountValue}
                                           helperText={touched.maximumDiscountValue && errors.maximumDiscountValue} />
                                </Grid>
                                <Field type="hidden" name="discountRank" />
                                <Grid item xs={12}>
                                    <Field as={TextField} name="discountDescription" label="Discount Description"
                                           multiline rows={3} fullWidth />
                                </Grid>
                                <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-end', gap: 2, mt: 2 }}>
                                    <Button variant="outlined" onClick={() => navigate('/Dashboard/Discounts')}>Cancel</Button>
                                    <Button type="submit" variant="contained" color="primary" disabled={isSubmitting}>Update Discount</Button>
                                </Grid>
                            </Grid>
                        </Paper>
                    </Form>
                )}
            </Formik>
        </Container>
    );
};

export default DashboardEditDiscount;