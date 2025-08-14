import React, { useState, useEffect } from "react";
import { toast, Zoom } from "react-toastify";
import { Formik, Field, Form } from "formik";
import * as Yup from "yup";
import { TextField, Button, Typography, Box, MenuItem, InputAdornment, CircularProgress } from "@mui/material";
import { CheckCircle, ErrorOutline } from "@mui/icons-material";
import "react-toastify/dist/ReactToastify.css";
import { apiClient } from "../../core/api";
import { useNavigate } from "react-router-dom";
import useAuthHeader from "react-auth-kit/hooks/useAuthHeader";
import useDebounce from "../../components/hooks/useDebounce";

const DashboardCreateDiscount = () => {
    const [codeToCheck, setCodeToCheck] = useState('');
    const [isCheckingCode, setIsCheckingCode] = useState(false);
    const [isCodeAvailable, setIsCodeAvailable] = useState(true);
    const debouncedCode = useDebounce(codeToCheck, 500);

    const varToken = useAuthHeader();
    const navigate = useNavigate();

    useEffect(() => {
        if (debouncedCode && debouncedCode.length >= 3) {
            setIsCheckingCode(true);
            setIsCodeAvailable(false);
            apiClient.get(`/api/discounts/check-code?code=${debouncedCode}`, { headers: { Authorization: varToken } })
                .then(response => {
                    setIsCodeAvailable(!response.data);
                })
                .catch(() => setIsCodeAvailable(false))
                .finally(() => setIsCheckingCode(false));
        } else {
            setIsCodeAvailable(true);
        }
    }, [debouncedCode, varToken]);

    const validationSchema = Yup.object({
        discountCode: Yup.string()
            .required("Discount code is required")
            .min(3, "Discount code must be at least 3 characters")
            .max(20, "Discount code cannot exceed 20 characters")
            .matches(/^[a-zA-Z0-9]*$/, "No special characters allowed"),
        discountType: Yup.number()
            .required("Discount type is required")
            .oneOf([1, 2], "Invalid discount type"),
        discountValue: Yup.number()
            .required("Discount value is required")
            .min(1, "Discount value cannot be negative")
            .max(99999999, "Maximum value cannot exceed 99999999")
            .when("discountType", {
                is: 1,
                then: (schema) =>
                    schema
                        .min(1, "Discount value cannot be negative")
                        .max(100, "Discount value cannot be greater than 100")
                        .required("Discount value is required"),
            }),
        startDate: Yup.date()
            .required("Start date is required")
            .min(new Date(), "Start date cannot be in the past"),
        endDate: Yup.date()
            .required("End date is required")
            .min(Yup.ref("startDate"), "End date must be after start date"),
        discountStatus: Yup.number()
            .required("Discount status is required")
            .oneOf([1, 2], "Invalid discount status"),
        discountDescription: Yup.string(),
        minimumOrderValue: Yup.number()
            .min(0, "Minimum order value cannot be negative")
            .max(99999999, "Maximum value cannot exceed 99999999")
            .nullable(),
        maximumDiscountValue: Yup.number()
            .min(0, "Maximum discount value cannot be negative")
            .max(99999999, "Maximum value cannot exceed 99999999")
            .nullable()
            .when("discountType", {
                is: 2,
                then: (schema) =>
                    schema.test(
                        "is-null",
                        "For fixed amount, Maximum discount value should be null",
                        (value) => value === null || value === undefined
                    ),
            }),
        usageLimit: Yup.number()
            .min(1, "Usage limit must be positive")
            .max(99999999, "Maximum value cannot exceed 99999999")
            .required("Usage limit cannot be null"),
        discountRank: Yup.number()
            .required("Discount rank is required")
            .oneOf([1, 2, 3, 4, 5], "Invalid discount rank"),
    });

    const handleSubmit = async (values, { setSubmitting }) => {
        if (!isCodeAvailable) {
            toast.error("This discount code is already taken.", { position: "bottom-right", transition: Zoom });
            setSubmitting(false);
            return;
        }

        const requestBody = {
            discountCode: values.discountCode,
            discountType: { id: values.discountType },
            discountValue: values.discountValue,
            startDate: new Date(values.startDate).toISOString(),
            endDate: new Date(values.endDate).toISOString(),
            discountStatus: { id: values.discountStatus },
            discountDescription: values.discountDescription,
            minimumOrderValue: values.minimumOrderValue || null,
            maximumDiscountValue: values.maximumDiscountValue || null,
            usageLimit: values.usageLimit,
            rank: { id: values.discountRank }
        };

        try {
            await apiClient.post("/api/discounts", requestBody, { headers: { Authorization: varToken } });
            toast.success("Discount created successfully!", { position: "bottom-right", transition: Zoom });
            navigate("/Dashboard/Discounts");
        } catch (error) {
            toast.error("Create discount failed", { position: "bottom-right", transition: Zoom });
        } finally {
            setSubmitting(false);
        }
    };

    const renderCodeFeedback = () => {
        if (isCheckingCode) return <InputAdornment position="end"><CircularProgress size={20} /></InputAdornment>;
        if (codeToCheck.length >= 3) {
            return isCodeAvailable ?
                <InputAdornment position="end"><CheckCircle color="success" /></InputAdornment> :
                <InputAdornment position="end"><ErrorOutline color="error" /></InputAdornment>;
        }
        return null;
    };

    return (
        <div className="container mx-auto p-4">
            <Typography variant="h4" gutterBottom>Create Discount</Typography>
            <Formik
                initialValues={{
                    discountCode: "",
                    discountType: 1,
                    discountValue: "",
                    startDate: "",
                    endDate: "",
                    discountStatus: 2,
                    discountDescription: "",
                    minimumOrderValue: "",
                    maximumDiscountValue: "",
                    usageLimit: "",
                    discountRank: 1,
                }}
                validationSchema={validationSchema}
                onSubmit={handleSubmit}
            >
                {({ isSubmitting, touched, errors, values, setFieldValue }) => (
                    <Form>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="discountCode"
                                as={TextField}
                                label="Discount Code"
                                variant="outlined"
                                fullWidth
                                required
                                error={(touched.discountCode && Boolean(errors.discountCode)) || !isCodeAvailable}
                                helperText={
                                    touched.discountCode && errors.discountCode ? errors.discountCode :
                                        !isCodeAvailable ? "This code is already in use." : ""
                                }
                                onChange={(e) => {
                                    const upperCaseCode = e.target.value.toUpperCase();
                                    setFieldValue('discountCode', upperCaseCode);
                                    setCodeToCheck(upperCaseCode);
                                }}
                                InputProps={{ endAdornment: renderCodeFeedback() }}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="discountType"
                                as={TextField}
                                label="Discount Type"
                                variant="outlined"
                                select
                                fullWidth
                                required
                                error={touched.discountType && Boolean(errors.discountType)}
                                helperText={touched.discountType && errors.discountType}
                            >
                                <MenuItem value={1}>Percentage</MenuItem>
                                <MenuItem value={2}>Fixed Amount</MenuItem>
                            </Field>
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="discountValue"
                                as={TextField}
                                label="Discount Value"
                                variant="outlined"
                                fullWidth
                                required
                                type="number"
                                error={touched.discountValue && Boolean(errors.discountValue)}
                                helperText={touched.discountValue && errors.discountValue}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="startDate"
                                as={TextField}
                                label="Start Date"
                                type="datetime-local"
                                variant="outlined"
                                fullWidth
                                required
                                InputLabelProps={{ shrink: true }}
                                error={touched.startDate && Boolean(errors.startDate)}
                                helperText={touched.startDate && errors.startDate}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="endDate"
                                as={TextField}
                                label="End Date"
                                type="datetime-local"
                                variant="outlined"
                                fullWidth
                                required
                                InputLabelProps={{ shrink: true }}
                                error={touched.endDate && Boolean(errors.endDate)}
                                helperText={touched.endDate && errors.endDate}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="discountStatus"
                                as={TextField}
                                label="Discount Status"
                                variant="outlined"
                                select
                                fullWidth
                                required
                                error={touched.discountStatus && Boolean(errors.discountStatus)}
                                helperText={touched.discountStatus && errors.discountStatus}
                            >
                                <MenuItem value={2}>Active</MenuItem>
                                <MenuItem value={1}>Inactive</MenuItem>
                            </Field>
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="discountDescription"
                                as={TextField}
                                label="Discount Description"
                                variant="outlined"
                                fullWidth
                                multiline
                                rows={3}
                                error={touched.discountDescription && Boolean(errors.discountDescription)}
                                helperText={touched.discountDescription && errors.discountDescription}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="minimumOrderValue"
                                as={TextField}
                                label="Minimum Order Value"
                                variant="outlined"
                                fullWidth
                                type="number"
                                error={touched.minimumOrderValue && Boolean(errors.minimumOrderValue)}
                                helperText={touched.minimumOrderValue && errors.minimumOrderValue}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="maximumDiscountValue"
                                as={TextField}
                                label="Maximum Discount Value"
                                variant="outlined"
                                fullWidth
                                type="number"
                                disabled={values.discountType === 2}
                                error={touched.maximumDiscountValue && Boolean(errors.maximumDiscountValue)}
                                helperText={touched.maximumDiscountValue && errors.maximumDiscountValue}
                            />
                        </Box>
                        <Box sx={{ mb: 2 }}>
                            <Field
                                name="usageLimit"
                                as={TextField}
                                label="Usage Limit"
                                variant="outlined"
                                fullWidth
                                type="number"
                                error={touched.usageLimit && Boolean(errors.usageLimit)}
                                helperText={touched.usageLimit && errors.usageLimit}
                            />
                        </Box>

                        <Field type="hidden" name="discountRank" />

                        <div className="flex items-center justify-center">
                            <Button
                                type="submit"
                                variant="contained"
                                color="primary"
                                disabled={isSubmitting || isCheckingCode || !isCodeAvailable}
                            >
                                Create Discount
                            </Button>
                        </div>
                    </Form>
                )}
            </Formik>
        </div>
    );
};

export default DashboardCreateDiscount;