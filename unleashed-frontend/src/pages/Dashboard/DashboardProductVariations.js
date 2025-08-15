import React, { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { apiClient } from '../../core/api'
import { Skeleton, Dialog, DialogActions, DialogContent, DialogTitle, Button } from '@mui/material'
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader'
import { FaEdit, FaPlus, FaTrash } from 'react-icons/fa'
import { toast, Zoom } from 'react-toastify'
import useAuthUser from 'react-auth-kit/hooks/useAuthUser'
import { formatPrice } from '../../components/format/formats'

const DashboardProductVariations = () => {
    const { productId } = useParams()
    const [product, setProduct] = useState(null)
    const [loading, setLoading] = useState(true)
    const [openModal, setOpenModal] = useState(false)
    const [variationToDelete, setVariationToDelete] = useState(null)
    const role = useAuthUser()?.role
    const varToken = useAuthHeader()

    useEffect(() => {
        fetchProductDetails()
    }, [productId])

    const fetchProductDetails = async () => {
        try {
            setLoading(true)
            const response = await apiClient.get(`/api/products/${productId}/detail`, {
                headers: { Authorization: varToken },
            })
            setProduct(response.data || { productVariations: [] })
        } catch (error) {
            console.error('Error fetching product details:', error)
        } finally {
            setLoading(false)
        }
    }

    const handleDeleteVariation = (variationId, size, color) => {
        setVariationToDelete({ variationId, size, color })
        setOpenModal(true)
    }

    const confirmDeleteVariation = async () => {
        if (!variationToDelete) return
        const { variationId } = variationToDelete

        try {
            await apiClient.delete(`/api/product-variations/${variationId}`, {
                headers: { Authorization: varToken },
            })
            toast.success('Deleted successfully!', { position: 'bottom-right', transition: Zoom })

            setProduct((prevProduct) => ({
                ...prevProduct,
                productVariations: prevProduct.productVariations.filter(
                    (variation) => variation.id !== variationId
                ),
            }))
        } catch (error) {
            console.error('Error deleting product variation:', error)
        } finally {
            setOpenModal(false)
        }
    }

    if (loading) {
        return <Skeleton variant='rectangular' width='100%' height={400} />
    }

    return (
        <div className='p-4'>
            <div>
                <h1 className='text-3xl font-bold'>{product?.productName || 'N/A'}</h1>
                <p className='mt-2 text-gray-600'>
                    {product?.productDescription || 'No description available'}
                </p>

                <div className='mt-4'>
                    <p className='text-gray-600'>
                        Category:{' '}
                        {product?.categories && product.categories.length > 0
                            ? product.categories.map((category) => category.categoryName).join(', ')
                            : 'N/A'}
                    </p>
                    <p className='text-gray-600'>Brand: {product?.brand?.brandName || 'N/A'}</p>
                    <p className='text-gray-600'>
                        Created At:{' '}
                        {new Date(product?.productCreatedAt).toLocaleDateString() +
                            ' ' +
                            new Date(product?.productCreatedAt).toLocaleTimeString()}
                    </p>
                    <p className='text-gray-600'>
                        Updated At:{' '}
                        {new Date(product?.productUpdatedAt).toLocaleDateString() +
                            ' ' +
                            new Date(product?.productUpdatedAt).toLocaleTimeString()}
                    </p>
                </div>

                <div className='mt-4 flex justify-end space-x-4'>
                    {role !== 'STAFF' && (
                        <Link
                            to={`/Dashboard/Products/Edit/${product.productId}`}
                            className='text-blue-600 border border-blue-500 px-4 py-2 rounded-lg flex items-center'
                        >
                            <FaEdit className='mr-2' /> Edit Product
                        </Link>
                    )}

                    <Link
                        to={`/Dashboard/Products/${product.productId}/Add`}
                        className='text-blue-600 border border-blue-500 px-4 py-2 rounded-lg flex items-center'
                    >
                        <FaPlus className='mr-2' /> Add New Variation
                    </Link>
                </div>
            </div>

            {/* Variations Table */}
            <div className='mt-6 overflow-x-auto'>
                <table className='min-w-full bg-white border border-gray-200'>
                    <thead className='bg-gray-100'>
                    <tr>
                        <th className='py-2 px-4 border-b text-left'>Image</th>
                        <th className='py-2 px-4 border-b text-left'>Size</th>
                        <th className='py-2 px-4 border-b text-left'>Color</th>
                        <th className='py-2 px-4 border-b text-left'>Price</th>
                        <th className='py-2 px-4 border-b text-left'>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    {product?.productVariations?.length > 0 ? (
                        product.productVariations.map((variation) => (
                            <tr key={variation.id} className='hover:bg-gray-50'>
                                <td className='py-2 px-4 border-b'>
                                    <img
                                        src={variation.variationImage || '/images/placeholder.png'}
                                        alt={`${product.productName} - ${variation.color.colorName}`}
                                        className='w-16 h-16 object-cover rounded-md'
                                    />
                                </td>
                                <td className='py-2 px-4 border-b'>{variation.size.sizeName}</td>
                                <td className='py-2 px-4 border-b'>{variation.color.colorName}</td>
                                <td className='py-2 px-4 border-b'>
                                    {formatPrice(variation.variationPrice)}
                                </td>
                                <td className='py-2 px-4 border-b'>
                                    <div className='flex items-center space-x-2'>
                                        <Link
                                            to={`/Dashboard/Products/${productId}/Edit/${variation.id}`}
                                            className='text-blue-500 hover:text-blue-700 p-2'
                                        >
                                            <FaEdit size={18} />
                                        </Link>
                                        <button
                                            onClick={() =>
                                                handleDeleteVariation(
                                                    variation.id,
                                                    variation.size.sizeName,
                                                    variation.color.colorName
                                                )
                                            }
                                            className='text-red-500 hover:text-red-700 p-2'
                                        >
                                            <FaTrash size={18} />
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan='5' className='py-4 px-4 border-b text-center text-gray-500'>
                                No product variations available.
                            </td>
                        </tr>
                    )}
                    </tbody>
                </table>
            </div>

            <Dialog open={openModal} onClose={() => setOpenModal(false)}>
                <DialogTitle>Confirm Deletion</DialogTitle>
                <DialogContent>
                    {variationToDelete && (
                        <p>
                            Are you sure you want to delete the variation? <br />
                            <strong>{`Size: ${variationToDelete.size}, Color: ${variationToDelete.color}`}</strong>
                        </p>
                    )}
                </DialogContent>
                <DialogActions>
                    <Button onClick={() => setOpenModal(false)} color='primary'>
                        Cancel
                    </Button>
                    <Button onClick={confirmDeleteVariation} color='secondary'>
                        Confirm
                    </Button>
                </DialogActions>
            </Dialog>
        </div>
    )
}

export default DashboardProductVariations