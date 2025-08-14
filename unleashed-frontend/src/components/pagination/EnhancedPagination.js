import React, { useState, useMemo } from 'react';
import { Button, IconButton, TextField } from '@mui/material';
import { FirstPage, LastPage, ChevronLeft, ChevronRight } from '@mui/icons-material';

const EnhancedPagination = ({ currentPage, totalPages, onPageChange, isLoading = false }) => {
    const [inputPage, setInputPage] = useState("");

    const handleGoToPage = (e) => {
        e.preventDefault();
        const pageNumber = parseInt(inputPage, 10);
        if (pageNumber >= 1 && pageNumber <= totalPages) {
            onPageChange(pageNumber);
            setInputPage("");
        }
    };

    const paginationRange = useMemo(() => {
        if (totalPages <= 7) {
            return Array.from({ length: totalPages }, (_, i) => i + 1);
        }

        const siblingCount = 1;
        const leftSiblingIndex = Math.max(currentPage - siblingCount, 1);
        const rightSiblingIndex = Math.min(currentPage + siblingCount, totalPages);

        const shouldShowLeftDots = leftSiblingIndex > 2;
        const shouldShowRightDots = rightSiblingIndex < totalPages - 1;

        const firstPageIndex = 1;
        const lastPageIndex = totalPages;
        const ELLIPSIS = "...";

        // Case 1: No left dots, but right dots needed
        if (!shouldShowLeftDots && shouldShowRightDots) {
            let leftItemCount = 3 + 2 * siblingCount;
            let leftRange = Array.from({ length: leftItemCount }, (_, i) => i + 1);
            return [...leftRange, ELLIPSIS, totalPages];
        }

        // Case 2: No right dots, but left dots needed
        if (shouldShowLeftDots && !shouldShowRightDots) {
            let rightItemCount = 3 + 2 * siblingCount;
            let rightRange = Array.from({ length: rightItemCount }, (_, i) => totalPages - rightItemCount + 1 + i);
            return [firstPageIndex, ELLIPSIS, ...rightRange];
        }

        // Case 3: Both left and right dots needed
        if (shouldShowLeftDots && shouldShowRightDots) {
            let middleRange = Array.from({ length: rightSiblingIndex - leftSiblingIndex + 1 }, (_, i) => leftSiblingIndex + i);
            return [firstPageIndex, ELLIPSIS, ...middleRange, ELLIPSIS, lastPageIndex];
        }

        // Default case (should not be reached with the first check, but as a fallback)
        return [];
    }, [currentPage, totalPages]);

    return (
        <div className="flex flex-col sm:flex-row justify-center items-center mt-6 gap-2 text-sm">
            {/* Page Buttons */}
            <div className="flex items-center gap-1">
                <IconButton onClick={() => onPageChange(1)} disabled={currentPage === 1 || isLoading} size="small" title="First Page">
                    <FirstPage />
                </IconButton>
                <IconButton onClick={() => onPageChange(currentPage - 1)} disabled={currentPage === 1 || isLoading} size="small" title="Previous Page">
                    <ChevronLeft />
                </IconButton>

                {paginationRange.map((page, index) =>
                    page === "..." ? (
                        <span key={`dots-${index}`} className="px-2 py-1">...</span>
                    ) : (
                        <Button
                            key={page}
                            onClick={() => onPageChange(page)}
                            variant={currentPage === page ? 'contained' : 'outlined'}
                            size="small"
                            disabled={isLoading}
                            sx={{ minWidth: '36px', padding: '4px 8px' }}
                        >
                            {page}
                        </Button>
                    )
                )}

                <IconButton onClick={() => onPageChange(currentPage + 1)} disabled={currentPage === totalPages || isLoading} size="small" title="Next Page">
                    <ChevronRight />
                </IconButton>
                <IconButton onClick={() => onPageChange(totalPages)} disabled={currentPage === totalPages || isLoading} size="small" title="Last Page">
                    <LastPage />
                </IconButton>
            </div>

            {/* Jump to Page Input */}
            <form onSubmit={handleGoToPage} className="flex items-center gap-2 ml-4">
                <TextField
                    type="number"
                    size="small"
                    label="Go to"
                    variant="outlined"
                    value={inputPage}
                    onChange={(e) => setInputPage(e.target.value)}
                    disabled={isLoading}
                    inputProps={{ min: 1, max: totalPages, style: { width: '50px' } }}
                />
                <Button type="submit" variant="contained" size="small" disabled={isLoading}>
                    Go
                </Button>
            </form>
        </div>
    );
};

export default EnhancedPagination;