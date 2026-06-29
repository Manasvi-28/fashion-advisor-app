const { GoogleGenAI } = require("@google/genai");

const client = new GoogleGenAI({
    apiKey: process.env.GEMINI_API_KEY,
});

async function analyzeFashionImage(base64Image, mimeType) {

    const prompt = `You are an expert fashion stylist, fashion merchandiser, clothing analyst, and dataset annotation engine.

Your task is to analyze ONE fashion image and generate a high-quality clothing document for a production fashion recommendation application.

The generated document will be stored directly inside a MongoDB database.

Therefore, STRICTLY follow the schema and instructions below.

────────────────────────────────────────

GENERAL RULES

• Return ONLY valid JSON.
• Never return Markdown.
Return ONLY valid JSON.

Do not return Markdown.

Do not surround the JSON with code fences.

Do not include any text before or after the JSON.
• Never explain your reasoning.
• Never include notes before or after the JSON.
• Every required field must always be present.
• Never add extra fields.
• Never remove existing fields.
• Never change the data type of any field.
• If information cannot reasonably be determined, use:
    - "Unknown" for String fields
    - [] for Array fields
• Do not hallucinate brands or unavailable information.
• Base every answer ONLY on what is visible in the image.

────────────────────────────────────────

FIELD REQUIREMENTS

title

Generate a short descriptive title.

Examples:

Old Money Linen Outfit

Minimalist Office Look

Streetwear Cargo Outfit

Coquette Summer Dress

Korean Casual Outfit

Maximum 6 words.

────────────────────────────────────────

description

Write ONE concise sentence (20–35 words).

Describe:

• clothing
• colors
• overall style

Do NOT describe:

• background
• lighting
• camera
• person's pose
• facial expression

────────────────────────────────────────

imageType

Describes the IMAGE.

Choose ONLY one:

Full Outfit
Single Item
Street Style
Editorial
Flatlay

────────────────────────────────────────

targetAudience

Choose ONLY one:

Women
Men
Unisex

────────────────────────────────────────

mainCategory

Represents the PRIMARY clothing category.

Choose ONLY one:

Top
Bottom
Dress
Outerwear
Footwear
Accessory

If multiple clothing pieces exist, choose the dominant category.

Do NOT return "Full Outfit".

────────────────────────────────────────

items

This field contains ONLY clothing names.

Return an array of strings.

Correct:

"items": [
    "Grey varsity jacket",
    "White shirt",
    "Black bow tie",
    "Black shorts",
    "Green sneakers"
]

Incorrect:

"items": [
    {
        "itemType":"Top"
    }
]

Do NOT return objects.

────────────────────────────────────────

styleTags

Return 1–5 styles.

Choose ONLY from:

Old Money
Quiet Luxury
Minimalist
Clean Girl
Soft Girl
Coquette
Cottagecore
Dark Academia
Light Academia
Streetwear
Athleisure
Y2K
Vintage
Boho
Business Casual
Smart Casual
Formal
Casual
Preppy
Grunge
Korean
Parisian Chic
Scandinavian
Linen
Monochrome
Indo-Western
Ethnic
College Wear
Office Wear
Resort Wear
Vacation
Elegant
Romantic
Edgy
Classic

────────────────────────────────────────

colors

Return the dominant visible colors.

Choose ONLY from:

Black
White
Grey
Brown
Beige
Cream
Blue
Navy
Green
Olive
Yellow
Orange
Pink
Purple
Red
Maroon
Gold
Silver

────────────────────────────────────────

pattern

Examples:

Solid
Striped
Checked
Plaid
Floral
Printed
Graphic
Polka Dot
Unknown

────────────────────────────────────────

fabric

Examples:

Cotton
Denim
Linen
Silk
Leather
Wool
Polyester
Knitted
Unknown

Return an array.

────────────────────────────────────────

fit

Examples:

Slim
Regular
Relaxed
Oversized
Loose
Unknown

────────────────────────────────────────

sleeveLength

Examples:

Sleeveless
Short Sleeve
Three Quarter
Long Sleeve
Unknown

────────────────────────────────────────

neckline

Examples:

Crew Neck
V-Neck
Collared
Turtleneck
Off Shoulder
Square Neck
Unknown

────────────────────────────────────────

bottomLength

Choose one:

Short
Midi
Long
Unknown

────────────────────────────────────────

occasion

Return an array.

Choose only from:

Daily Wear
College
Office
Party
Date
Wedding
Travel
Vacation
Festival
Gym
Formal Event
Business Meeting
Brunch
Shopping
Beach

────────────────────────────────────────

season

Return an array.

Choose only from:

Spring
Summer
Autumn
Winter
All Season

────────────────────────────────────────

weather

Return an array.

Choose only from:

Hot
Warm
Mild
Cool
Cold
Rainy

────────────────────────────────────────

brand

Only identify a brand if its logo or branding is clearly visible.

Otherwise return:

Unknown

────────────────────────────────────────

priceRange

Estimate the overall outfit price.

Choose ONLY one:

Budget
Mid
Premium
Luxury

Do NOT return Unknown.

────────────────────────────────────────

searchCount

Always return:

0

────────────────────────────────────────

viewCount

Always return:

0

────────────────────────────────────────

saveCount

Always return:

0

────────────────────────────────────────

clickCount

Always return:

0

────────────────────────────────────────

similarOutfits

Always return an empty array.

[]

────────────────────────────────────────

Return this EXACT JSON schema.

{
  "title": "",
  "description": "",
  "imageType": "",
  "targetAudience": "",
  "mainCategory": "",
  "items": [],
  "styleTags": [],
  "colors": [],
  "pattern": "",
  "fabric": [],
  "fit": "",
  "sleeveLength": "",
  "neckline": "",
  "bottomLength": "",
  "occasion": [],
  "season": [],
  "weather": [],
  "brand": "",
  "priceRange": "",
  "searchCount": 0,
  "viewCount": 0,
  "saveCount": 0,
  "clickCount": 0,
  "similarOutfits": []
}

Before returning the JSON, internally verify that:

• every required field exists
• every enum value belongs to the allowed values
• every array contains the correct data type
• no additional fields exist

Return ONLY the final JSON.`;


    
    for (let attempt = 1; attempt <= 3; attempt++) {

    try {

 const interaction =
await client.interactions.create({

    model: "gemini-2.5-flash-lite",

    input: [

        {
            type: "text",
            text: prompt,
        },

        {
            type: "image",
            data: base64Image,
            mime_type: mimeType,
        }

    ]

});

let jsonText = interaction.output_text.trim();

// Remove ```json
jsonText = jsonText.replace(/^```json\s*/i, "");

// Remove ```
jsonText = jsonText.replace(/\s*```$/, "");

return JSON.parse(jsonText);

    } catch (error) {

        if (error.status === 503) {

            console.log(
                `Gemini busy. Retry ${attempt}/3`
            );

            await new Promise(resolve =>
                setTimeout(resolve, 5000)
            );

        } else {

            throw error;

        }

    }

}

throw new Error(
    "Gemini unavailable after 3 attempts."
);

   

}

module.exports = {
    analyzeFashionImage,
};