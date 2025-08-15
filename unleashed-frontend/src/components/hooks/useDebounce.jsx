import { useState, useEffect } from 'react';

// This custom hook takes a value (like our search term) and a delay
export default function useDebounce(value, delay) {
    // State to hold the debounced value
    const [debouncedValue, setDebouncedValue] = useState(value);

    useEffect(() => {
        // Set up a timer to update the debounced value after the specified delay
        const handler = setTimeout(() => {
            setDebouncedValue(value);
        }, delay);

        // Clean up the timer if the value changes (e.g., user types again)
        // or if the component unmounts.
        return () => {
            clearTimeout(handler);
        };
    }, [value, delay]); // Only re-run the effect if value or delay changes

    return debouncedValue;
}