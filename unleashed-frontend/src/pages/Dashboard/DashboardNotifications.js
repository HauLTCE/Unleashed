import React, { useRef, useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { FaEye, FaPlus, FaTrash } from 'react-icons/fa'
import { toast, Zoom } from 'react-toastify'
import { apiClient } from '../../core/api'
import useAuthHeader from 'react-auth-kit/hooks/useAuthHeader'
import DeleteConfirmationModal from '../../components/modals/DeleteConfirmationModal'
import { Box } from '@mui/material'

const DashboardNotifications = () => {
    const [notifications, setNotifications] = useState([])
    const [currentPage, setCurrentPage] = useState(1)
    const [itemsPerPage] = useState(10)
    const [isOpen, setIsOpen] = useState(false)
    const [notificationToDelete, setNotificationToDelete] = useState(null)
    const navigate = useNavigate()
    const varToken = useAuthHeader()

    useEffect(() => {
        const fetchNotifications = async () => {
            try {
                const response = await apiClient.get('/api/notifications/as', {
                    headers: { Authorization: varToken },
                })
                if (response.data) {
                    const filteredNotifications = response.data.filter(
                        (notification) => !notification.isNotificationDraft
                    )
                    setNotifications(filteredNotifications)
                }
            } catch (error) {
                console.error('Error fetching notifications:', error)
            }
        }
        fetchNotifications()
    }, [varToken])

    const openDeleteModal = (notification) => {
        setNotificationToDelete(notification)
        setIsOpen(true)
    }

    const handleClose = () => {
        setIsOpen(false)
        setNotificationToDelete(null)
    }

    const handleDelete = async () => {
        if (!notificationToDelete || !notificationToDelete.notificationId) {
            toast.error('Failed to delete notification: Invalid ID', {
                position: 'bottom-right',
                transition: Zoom,
            })
            return
        }

        try {
            const response = await apiClient.delete(
                `/api/notifications/${notificationToDelete.notificationId}`,
                {
                    headers: { Authorization: varToken },
                }
            )

            if (response.status === 200) {
                toast.success(response.data.message, { position: 'bottom-right', transition: Zoom })
                setNotifications(
                    notifications.filter((n) => n.notificationId !== notificationToDelete.notificationId)
                )
                handleClose()
            }
        } catch (error) {
            toast.error('Failed to delete notification', { position: 'bottom-right', transition: Zoom })
        }
    }

    const handleViewNotification = (notification) => {
        navigate(`/Dashboard/Notifications/${notification.notificationId}`, { state: { notification } });
    };

    const indexOfLastNotification = currentPage * itemsPerPage
    const indexOfFirstNotification = indexOfLastNotification - itemsPerPage
    const currentNotifications = notifications.slice(
        indexOfFirstNotification,
        indexOfLastNotification
    )
    const totalPages = Math.ceil(notifications.length / itemsPerPage)
    const handlePageChange = (pageNumber) => {
        setCurrentPage(pageNumber)
    }

    return (
        <>
            <div className='flex items-center justify-between'>
                <div>
                    <h1 className='text-4xl font-bold mb-6'>Notifications List</h1>
                </div>
                <div>
                    <Link to='/Dashboard/Notifications/Create'>
                        <button className='text-blue-600 border border-blue-500 px-4 py-2 rounded-lg flex items-center'>
                            <FaPlus className='mr-2' /> Create New Notification
                        </button>
                    </Link>
                </div>
            </div>

            <div className='overflow-x-auto'>
                <table className='table-auto w-full border-collapse'>
                    <thead className='border border-gray-300'>
                    <tr>
                        <th className='px-4 py-2 text-left'>ID</th>
                        <th className='px-4 py-2 text-left'>Title</th>
                        <th className='px-4 py-2 text-left'>Message</th>
                        <th className='px-4 py-2 text-left'>Sender</th>
                        <th className='px-4 py-2 text-left'>Created at</th>
                        <th className='px-4 py-2 text-left'>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    {currentNotifications.length > 0 ? (
                        currentNotifications.map((notification) => (
                            <tr key={notification.notificationId} className='hover:bg-gray-50'>
                                <td className='px-4 py-2'>{notification.notificationId}</td>
                                <td className='px-4 py-2'>{notification.notificationTitle}</td>
                                <td className='px-4 py-2' style={{ width: '200px', overflow: 'hidden' }}>
                                    <RunningText content={notification.notificationContent} width='200px' />
                                </td>
                                <td className='px-4 py-2'>{notification.userName || 'Unknown'}</td>
                                <td className='px-4 py-2'>
                                    {notification.createdAt
                                        ? new Date(notification.createdAt).toLocaleString()
                                        : 'No Date'}
                                </td>
                                <td className='px-4 py-2 flex space-x-2 pt-6'>
                                    <button
                                        className='text-green-500 cursor-pointer'
                                        onClick={() => handleViewNotification(notification)}
                                    >
                                        <FaEye />
                                    </button>
                                    <button
                                        className='text-red-500 cursor-pointer'
                                        onClick={() => openDeleteModal(notification)}
                                    >
                                        <FaTrash />
                                    </button>
                                </td>
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan='6' className='text-center py-4 text-red-500'>
                                No notifications found.
                            </td>
                        </tr>
                    )}
                    </tbody>
                </table>
            </div>

            <div className='flex justify-center mt-4'>
                <button
                    disabled={currentPage === 1}
                    onClick={() => handlePageChange(currentPage - 1)}
                    className='px-4 py-2 mx-1 border border-gray-300 rounded-lg disabled:opacity-50'
                >
                    Previous
                </button>
                {Array.from({ length: totalPages }, (_, index) => (
                    <button
                        key={index + 1}
                        onClick={() => handlePageChange(index + 1)}
                        className={`px-4 py-2 mx-1 border border-gray-300 rounded-lg ${
                            currentPage === index + 1 ? 'bg-blue-500 text-white' : ''
                        }`}
                    >
                        {index + 1}
                    </button>
                ))}
                <button
                    disabled={currentPage === totalPages}
                    onClick={() => handlePageChange(currentPage + 1)}
                    className='px-4 py-2 mx-1 border border-gray-300 rounded-lg disabled:opacity-50'
                >
                    Next
                </button>
            </div>

            <DeleteConfirmationModal
                isOpen={isOpen}
                onClose={handleClose}
                onConfirm={handleDelete}
                name={notificationToDelete?.notificationTitle || 'this notification'}
            />
        </>
    )
}

const RunningText = ({ content, width }) => {
    const textRef = useRef(null)
    const containerRef = useRef(null)
    const [isOverflow, setIsOverflow] = useState(false)

    useEffect(() => {
        if (textRef.current && containerRef.current) {
            setIsOverflow(textRef.current.scrollWidth > containerRef.current.clientWidth)
        }
    }, [content])

    return (
        <Box
            ref={containerRef}
            sx={{
                width: width || '200px',
                overflow: 'hidden',
                whiteSpace: 'nowrap',
                display: 'flex',
                alignItems: 'center',
            }}
        >
            {isOverflow ? (
                <marquee behavior='scroll' direction='left'>
                    <Box component='span' sx={{ whiteSpace: 'nowrap' }}>
                        {content}
                    </Box>
                </marquee>
            ) : (
                <Box component='span' sx={{ whiteSpace: 'nowrap' }} ref={textRef}>
                    {content}
                </Box>
            )}
        </Box>
    )
}

export default DashboardNotifications