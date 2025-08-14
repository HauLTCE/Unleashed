import React, { useState, useEffect, useRef } from "react";
import { Link, useNavigate } from "react-router-dom";
import { getProductList } from "../../service/ShopService"; // Import the API service
import useDebounce from "../hooks/useDebounce"; // Import the debounce hook
import useSearchBar from "../hooks/SearchHook";

const SearchBar = ({ toggleSearchBar }) => {
    // State for the user's direct input
    const [query, setQuery] = useState("");
    // Debounced version of the query. The API call will be triggered by this.
    const debouncedQuery = useDebounce(query, 300); // 300ms delay

    // State for the results fetched from the API
    const [searchResults, setSearchResults] = useState([]);
    const [isLoading, setIsLoading] = useState(false);

    const { isSearchOpen } = useSearchBar();
    const navigate = useNavigate();

    // Refs for UI manipulation (no changes needed here)
    const searchBarRef = useRef(null);
    const inputRef = useRef(null);
    const buttonRef = useRef(null);
    const searchResultsRef = useRef(null);
    const [left, setLeft] = useState("50%");


    // This useEffect hook now performs the API call when the debounced query changes
    useEffect(() => {
        // If the debounced query is empty, clear results and don't do anything
        if (!debouncedQuery.trim()) {
            setSearchResults([]);
            return;
        }

        const fetchSearchResults = async () => {
            setIsLoading(true);
            try {
                // Fetch only the top 5 results for the dropdown preview
                const data = await getProductList(1, 5, { query: debouncedQuery });
                setSearchResults(data.content || []);
            } catch (error) {
                console.error("Error fetching search results:", error);
                setSearchResults([]); // Clear results on error
            } finally {
                setIsLoading(false);
            }
        };

        fetchSearchResults();
    }, [debouncedQuery]); // The dependency is the debounced value


    // All the local UI logic, handlers, and effects below remain largely the same
    // as they handle the presentation, not the data.

    const handleChange = (e) => {
        setQuery(e.target.value);
    };

    const handleSearch = () => {
        if (query.trim()) {
            navigate(`/search?query=${query}`);
            toggleSearchBar();
            setQuery("");
        }
    };

    const truncateProductName = (name, maxLength) => {
        if (name.length > maxLength) {
            return name.substring(0, maxLength) + "...";
        }
        return name;
    };

    const handleClickOutside = (e) => {
        if (searchBarRef.current && !searchBarRef.current.contains(e.target)) {
            toggleSearchBar();
        }
    };

    useEffect(() => {
        if (isSearchOpen && inputRef.current) {
            inputRef.current.focus();
        }
    }, [isSearchOpen]);

    useEffect(() => {
        document.addEventListener("mousedown", handleClickOutside);
        return () => {
            document.removeEventListener("mousedown", handleClickOutside);
        };
    }, []);

    useEffect(() => {
        const updatePosition = () => {
            if (!inputRef.current || !buttonRef.current) return;
            const inputWidth = inputRef.current.offsetWidth;
            const buttonWidth = buttonRef.current.offsetWidth;
            const gap = 24;
            const totalWidth = inputWidth + buttonWidth + gap;

            setLeft(`calc(50% - ${totalWidth / 2}px)`);

            if (searchResultsRef.current) {
                searchResultsRef.current.style.left = `calc(50% - ${totalWidth / 2}px)`;
                searchResultsRef.current.style.width = `${totalWidth}px`;
            }
        };

        window.addEventListener("resize", updatePosition);
        updatePosition();

        return () => window.removeEventListener("resize", updatePosition);
    }, [query]);

    const handleKeyDownInput = (e) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            handleSearch();
        }
    };

    return (
        <>
            <div
                ref={searchBarRef}
                className={`fixed top-28 transform -translate-x-1/2 z-50 bg-white p-2 max-w-[40rem] rounded-full shadow-lg flex items-center gap-3 ${isSearchOpen ? "animate-slide-out" : "animate-slide-in"}`}
                style={{ left }}
            >
                <input
                    ref={inputRef}
                    type="text"
                    value={query}
                    onChange={handleChange}
                    placeholder="Find..."
                    className="border border-gray-300 rounded-full px-4 py-2 w-[25rem]"
                    onKeyDown={handleKeyDownInput}
                />
                <button
                    ref={buttonRef}
                    onClick={handleSearch}
                    className="bg-blue-500 text-white px-6 py-2 rounded-full hover:bg-blue-600"
                >
                    Find
                </button>
            </div>

            {/* The search results dropdown now uses the new state */}
            {query && (
                <div
                    ref={searchResultsRef}
                    className="fixed top-[11.5rem] z-50 bg-white shadow-lg rounded-lg border-t border-gray-200 mt-2 ml-2"
                    onMouseDown={(e) => e.stopPropagation()}
                >
                    <ul className="max-h-64 overflow-y-auto">
                        {isLoading && (
                            <li className="px-4 py-3 text-gray-500">Searching...</li>
                        )}
                        {!isLoading && searchResults.length === 0 && debouncedQuery && (
                            <li className="px-4 py-3 text-gray-500">No results found.</li>
                        )}
                        {!isLoading && searchResults.map((product, index) => (
                            <Link
                                tabIndex={index}
                                to={`/shop/product/${product.productId}`}
                                key={product.productId}
                                onClick={(e) => {
                                    e.stopPropagation();
                                    toggleSearchBar();
                                    setQuery(""); // Clear query after selection
                                }}
                            >
                                <li className="flex items-center py-3 px-4 hover:bg-blue-100 cursor-pointer">
                                    <img
                                        src={product.productVariationImage}
                                        alt={product.productName}
                                        className="w-12 h-12 mr-4 rounded-full object-cover"
                                    />
                                    <span title={product.productName}>
                                        {truncateProductName(product.productName, 40)}
                                    </span>
                                </li>
                            </Link>
                        ))}
                    </ul>
                </div>
            )}
        </>
    );
};

export default SearchBar;