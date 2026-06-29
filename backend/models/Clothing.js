const mongoose = require("mongoose");

const ClothingSchema = new mongoose.Schema({

    title: {
        type: String,
        required: true,
    },

    description: {
        type: String,
    },

    imageUrl: {
        type: String,
        required: true,
    },

    imageType: {
        type: String,
        enum: [
            "Full Outfit",
            "Single Item",
            "Street Style",
            "Editorial",
            "Flatlay"
        ],
    },

    targetAudience: {
        type: String,
        enum: [
            "Women",
            "Men",
            "Unisex"
        ],
    },

    mainCategory: {
        type: String,
        enum: [
            "Full Outfit",
            "Top",
            "Bottom",
            "Dress",
            "Outerwear",
            "Footwear",
            "Accessory"
        ],
    },

    items: {
        type: [String],
        default: [],
    },

    styleTags: {
        type: [String],
        default: [],
    },

    colors: {
        type: [String],
        default: [],
    },

    pattern: String,

    fabric: {
        type: [String],
        default: [],
    },

    fit: String,

    sleeveLength: String,

    neckline: String,

    bottomLength: String,

    occasion: {
        type: [String],
        default: [],
    },

    season: {
        type: [String],
        default: [],
    },

    weather: {
        type: [String],
        default: [],
    },

    brand: String,

    priceRange: {
    type: String,
    enum: [
          "Unknown",
        "Budget",
        "Mid",
        "Premium",
        "Luxury"
    ]
},

    searchCount: {
        type: Number,
        default: 0,
    },

    viewCount: {
        type: Number,
        default: 0,
    },

    saveCount: {
        type: Number,
        default: 0,
    },

    clickCount: {
        type: Number,
        default: 0,
    },

    similarOutfits: {
        type: [String],
        default: [],
    }

},
{
    timestamps: true,
});

module.exports = mongoose.model(
    "Clothing",
    ClothingSchema
);