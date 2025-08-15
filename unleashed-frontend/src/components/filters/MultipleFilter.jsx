import { Rating } from "@mui/material";
import React, { useEffect, useState, useRef } from "react";
import { RadioCommon } from "../inputs/Radio";
import { getBrand, getCategory } from "../../service/ShopService";

const FilterComponent = ({ onFilter }) => {
    const [category, setCategory] = useState("");
    const [brand, setBrand] = useState("");
    const [priceOrder, setPriceOrder] = useState("");
    const [rating, setRating] = useState(0);

    const [categories, setCategories] = useState([]);
    const [brands, setBrands] = useState([]);
    const isInitialMount = useRef(true);

    useEffect(() => {
        const fetchCategories = async () => {
            // FIX: If getCategory() fails, default to an empty array.
            const categoryList = await getCategory() || [];
            setCategories(categoryList);
        };
        fetchCategories();
    }, []);

    useEffect(() => {
        const fetchBrands = async () => {
            // FIX: If getBrand() fails, default to an empty array.
            const brandList = await getBrand() || [];

            // Now it is always safe to sort the array.
            const sortedBrandList = brandList.sort((a, b) =>
                (a.brandName || '').localeCompare(b.brandName || '')
            );
            setBrands(sortedBrandList);
        };
        fetchBrands();
    }, []);

    useEffect(() => {
        if (isInitialMount.current) {
            isInitialMount.current = false;
        } else {
            if (typeof onFilter === "function") {
                onFilter({ category, brand, priceOrder, rating });
            }
        }
    }, [category, brand, priceOrder, rating, onFilter]);

    const handleReset = () => {
        setCategory("");
        setBrand("");
        setPriceOrder("");
        setRating(0);
    };

    return (
        <div className="FilterContainer p-4 border rounded-md font-poppins">
            <form>
                <div className="mb-4">
                    <label className="block text-2xl pb-4 font-medium mb-1">Category</label>
                    <div className="space-y-2">
                        <RadioCommon
                            context="All Categories"
                            current={category}
                            value=""
                            id="category-all"
                            handleChecked={() => setCategory("")}
                        />
                        {categories.length > 0 ? (
                            categories.map((categoryItem) => (
                                <RadioCommon
                                    key={categoryItem.id}
                                    context={categoryItem.categoryName}
                                    current={category}
                                    id={`category-${categoryItem.id}`}
                                    value={categoryItem.categoryName}
                                    handleChecked={() => setCategory(categoryItem.categoryName)}
                                />
                            ))
                        ) : (
                            <div>Loading categories...</div>
                        )}
                    </div>
                </div>

                <div className="mb-4">
                    <label className="block text-2xl pb-4 font-medium mb-1">Brand</label>
                    <div className="space-y-2">
                        <RadioCommon
                            context="All Brands"
                            current={brand}
                            value=""
                            id="brand-all"
                            handleChecked={() => setBrand("")}
                        />
                        {brands.length > 0 ? (
                            brands.map((brandItem) => (
                                <RadioCommon
                                    key={brandItem.id}
                                    context={brandItem.brandName}
                                    current={brand}
                                    id={`brand-${brandItem.id}`}
                                    value={brandItem.brandName}
                                    handleChecked={() => setBrand(brandItem.brandName)}
                                />
                            ))
                        ) : (
                            <div>Loading brands...</div>
                        )}
                    </div>
                </div>

                <div className="mb-4">
                    <label className="block text-2xl pb-4 font-medium mb-1">Price</label>
                    <div className="space-y-2">
                        <RadioCommon
                            context="Default"
                            current={priceOrder}
                            value=""
                            id="price-default"
                            handleChecked={() => setPriceOrder("")}
                        />
                        <RadioCommon
                            context="Low to High"
                            current={priceOrder}
                            value="asc"
                            id="price-asc"
                            handleChecked={() => setPriceOrder("asc")}
                        />
                        <RadioCommon
                            context="High to Low"
                            current={priceOrder}
                            value="desc"
                            id="price-desc"
                            handleChecked={() => setPriceOrder("desc")}
                        />
                    </div>
                </div>

                <div className="mb-4">
                    <label className="block text-2xl pb-4 font-medium mb-1">Rating</label>
                    <div className="flex justify-center">
                        <Rating
                            value={rating}
                            onChange={(event, newRating) => {
                                setRating(newRating === rating ? 0 : newRating || 0);
                            }}
                        />
                    </div>
                </div>

                <div className="flex space-x-3">
                    <button type="button" className="flex-1 py-2 bg-red-600 text-white rounded-md" onClick={handleReset}>
                        Reset Filter
                    </button>
                </div>
            </form>
        </div>
    );
};

export default FilterComponent;