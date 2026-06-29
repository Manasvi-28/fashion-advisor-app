require("dotenv").config();
const mongoose = require("mongoose");
const Clothing = require("./models/Clothing");
const outfits = [
  {
    title: "Classic Old Money Summer",
    description: "A timeless beige and white linen outfit with effortless elegance.",
    imageUrl: "https://example.com/old_money.jpg",
    imageType: "Full Outfit",
    targetAudience: "Women",
    mainCategory: "Dress",
    items: [
      "Linen Shirt",
      "Wide Leg Trousers",
      "Brown Loafers"
    ],
    styleTags: [
      "Old Money",
      "Minimal",
      "Quiet Luxury"
    ],
    colors: [
      "White",
      "Beige",
      "Brown"
    ],
    pattern: "Solid",
    fabric: [
      "Linen",
      "Cotton"
    ],
    fit: "Relaxed",
    sleeveLength: "Full Sleeve",
    neckline: "Collar",
    occasion: [
      "Casual",
      "Vacation"
    ],
    season: [
      "Summer",
      "Spring"
    ],
    weather: [
      "Hot"
    ],
    brand: "Zara",
    priceRange: "Premium"
  },

  {
    title: "Soft Coquette Look",
    description: "Feminine pastel outfit inspired by the coquette aesthetic.",
    imageUrl: "https://example.com/coquette.jpg",
    imageType: "Full Outfit",
    targetAudience: "Women",
    mainCategory: "Dress",
    items: [
      "Pink Mini Dress",
      "White Cardigan",
      "Mary Jane Shoes"
    ],
    styleTags: [
      "Coquette",
      "Cute",
      "Soft Girl"
    ],
    colors: [
      "Pink",
      "White"
    ],
    pattern: "Floral",
    fabric: [
      "Cotton"
    ],
    fit: "Slim",
    sleeveLength: "Half Sleeve",
    neckline: "Square Neck",
    occasion: [
      "Date",
      "Cafe"
    ],
    season: [
      "Spring"
    ],
    weather: [
      "Mild"
    ],
    brand: "H&M",
    priceRange: "Budget"
  },

  {
    title: "Minimal Monochrome",
    description: "Simple black and white everyday outfit.",
    imageUrl: "https://example.com/minimal.jpg",
    imageType: "Full Outfit",
    targetAudience: "Women",
    mainCategory: "Top",
    items: [
      "White Oversized Shirt",
      "Black Straight Pants",
      "White Sneakers"
    ],
    styleTags: [
      "Minimal",
      "Clean Girl"
    ],
    colors: [
      "White",
      "Black"
    ],
    pattern: "Solid",
    fabric: [
      "Cotton"
    ],
    fit: "Oversized",
    sleeveLength: "Full Sleeve",
    neckline: "Collar",
    occasion: [
      "College",
      "Casual"
    ],
    season: [
      "All Season"
    ],
    weather: [
      "Mild"
    ],
    brand: "Uniqlo",
    priceRange: "Mid"
  },

  {
    title: "Urban Streetwear",
    description: "Oversized hoodie with cargo pants and sneakers.",
    imageUrl: "https://example.com/streetwear.jpg",
    imageType: "Full Outfit",
    targetAudience: "Unisex",
    mainCategory: "Outerwear",
    items: [
      "Oversized Hoodie",
      "Cargo Pants",
      "High Top Sneakers"
    ],
    styleTags: [
      "Streetwear",
      "Oversized"
    ],
    colors: [
      "Grey",
      "Black"
    ],
    pattern: "Graphic",
    fabric: [
      "Cotton",
      "Fleece"
    ],
    fit: "Oversized",
    sleeveLength: "Full Sleeve",
    neckline: "Hooded",
    occasion: [
      "Casual"
    ],
    season: [
      "Autumn",
      "Winter"
    ],
    weather: [
      "Cold"
    ],
    brand: "Nike",
    priceRange: "Premium"
  },

  {
    title: "Elegant Office Chic",
    description: "Professional neutral-toned office outfit.",
    imageUrl: "https://example.com/office.jpg",
    imageType: "Full Outfit",
    targetAudience: "Women",
    mainCategory: "Top",
    items: [
      "White Blouse",
      "Beige Pencil Skirt",
      "Nude Heels"
    ],
    styleTags: [
      "Office",
      "Elegant",
      "Minimal"
    ],
    colors: [
      "White",
      "Beige"
    ],
    pattern: "Solid",
    fabric: [
      "Polyester",
      "Cotton"
    ],
    fit: "Regular",
    sleeveLength: "Half Sleeve",
    neckline: "V Neck",
    occasion: [
      "Office",
      "Formal"
    ],
    season: [
      "All Season"
    ],
    weather: [
      "Indoor"
    ],
    brand: "Mango",
    priceRange: "Mid"
  }
]
async function seedDatabase() {

    try {

        await mongoose.connect(process.env.MONGO_URI);

        console.log("MongoDB Connected");

        await Clothing.insertMany(outfits);
     
        console.log("Outfits Inserted");
          console.log(await Clothing.countDocuments());
    } catch (err) {

        console.log(err);

    } finally {

        await mongoose.disconnect();

        console.log("MongoDB Disconnected");

    }

}
seedDatabase();