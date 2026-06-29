// require("dotenv").config();

// const { GoogleGenAI } = require("@google/genai");
// const { downloadImage } = require("./dataset/imageDownloader");
// const { searchImages } = require("./dataset/unsplashService");

// const ai = new GoogleGenAI({
//     apiKey: process.env.GEMINI_API_KEY,
// });

// async function testVision() {

//     const images = await searchImages(
//         "old money outfit",
//         1,
//         1
//     );

//     const downloaded = await downloadImage(
//         images[0].imageUrl
//     );

//     const response = await ai.models.generateContent({
//     model: "gemini-2.5-flash-lite",
//         contents: [
//             {
//                 inlineData: {
//                     mimeType: downloaded.mimeType,
//                     data: downloaded.base64Image,
//                 },
//             },
//             {
//                 text: "What clothing do you see? Answer in one sentence."
//             }
//         ]
//     });

//     console.log(response.text);
// }

// testVision().catch(console.error);

// console.log(process.env.GEMINI_API_KEY);
// const { GoogleGenAI } = require("@google/genai");

// const client = new GoogleGenAI({
//     apiKey: process.env.GEMINI_API_KEY,
// });

// console.log(client.interactions);
require("dotenv").config();
const { GoogleGenAI } = require("@google/genai");

const client = new GoogleGenAI({
    apiKey: process.env.GEMINI_API_KEY,
});
const calll= async ()=>{
const interaction = await client.interactions.create({
    model: "gemini-3.5-flash",
    input: [
        {
            type: "text",
            text: "Say hello."
        }
    ]
});
console.log(interaction.output_text);}
calll();
