const IMAGES_PER_QUERY = 10;
const GEMINI_DELAY_MS = 1500;
require("dotenv").config(); 
const fs = require("fs"); 
// const CHECKPOINT_FILE = "checkpoint.json";
 const mongoose = require("mongoose");
const Clothing = require("./models/Clothing");
const { searchImages, } = require("./dataset/unsplashService"); 
const { downloadImage, } = require("./dataset/imageDownloader");
const { uploadImage, } = require("./services/uploadService");
const { analyzeFashionImage, } = require("./services/geminiService"); 
const searchQueries = require("./dataset/searchQueries");

async function generateDataset() {

    let allImages = [];
//-----------------------------------
// Load cached Unsplash images
//-----------------------------------

if (fs.existsSync("unsplashImages.json")) {

    console.log("Loading cached Unsplash images...");

    allImages = JSON.parse(
        fs.readFileSync(
            "unsplashImages.json",
            "utf8"
        )
    );

    console.log(
        `Loaded ${allImages.length} images from cache.`
    );

} else {

    console.log("Fetching images from Unsplash...");

    for (const query of searchQueries) {

        console.log(`\nSearching: ${query}`);

        const images = await searchImages(
            query,
            1,
            IMAGES_PER_QUERY
        );

        console.log(
            `Found ${images.length} images`
        );

        allImages.push(...images);

    }

    fs.writeFileSync(
        "unsplashImages.json",
        JSON.stringify(
            allImages,
            null,
            2
        )
    );

    console.log(
        "Saved Unsplash image cache."
    );

}

    console.log("\n======================");
    console.log(`Total Images: ${allImages.length}`);
    console.log("======================");

    //-----------------------------------
    // Resume from checkpoint
    //-----------------------------------

    let startIndex = 0;

    // if (fs.existsSync(CHECKPOINT_FILE)) {

    //     const checkpoint = JSON.parse(
    //         fs.readFileSync(
    //             CHECKPOINT_FILE,
    //             "utf8"
    //         )
    //     );

    //     startIndex = checkpoint.lastProcessed + 1;

    //     console.log(
    //         `\nResuming from image ${startIndex + 1}`
    //     );
    // }

    let savedCount = 0;
    let skippedCount = 0;
    let failedCount = 0;

    //-----------------------------------
    // Process Images
    //-----------------------------------

    for (
        let i = startIndex;
        i < allImages.length;
        i++
    ) {

        const currentImage = allImages[i];

        console.log(
            `\n========== [${i + 1}/${allImages.length}] ==========\n`
        );

        try {

            console.log("Downloading image...");

            const image =
                await downloadImage(
                    currentImage.imageUrl
                );

            console.log("Downloaded!");

            console.log("Uploading to Cloudinary...");

            const cloudinaryResult =
                await uploadImage(
                    image.base64Image
                );

            console.log(
                cloudinaryResult.secure_url
            );

            console.log("Analyzing with Gemini...");

            const geminiResponse =
                await analyzeFashionImage(
                    image.base64Image,
                    image.mimeType
                );

            geminiResponse.imageUrl =
                cloudinaryResult.secure_url;

            const exists =
                await Clothing.findOne({

                    imageUrl:
                        geminiResponse.imageUrl,

                });

            if (exists) {

                skippedCount++;

                console.log(
                    "⚠️ Already exists."
                );

                // fs.writeFileSync(
                //     CHECKPOINT_FILE,
                //     JSON.stringify({
                //         lastProcessed: i
                //     })
                // );

                continue;
            }

            const saved =
                await Clothing.create(
                    geminiResponse
                );

            savedCount++;

            // fs.writeFileSync(
            //     CHECKPOINT_FILE,
            //     JSON.stringify({
            //         lastProcessed: i
            //     })
            // );

            console.log(
                `✅ Saved: ${saved.title}`
            );

        }

        catch (error) {

            failedCount++;

            console.log(
                `❌ Failed image ${i + 1}`
            );

            console.error(
                error.message
            );

        }

        //-----------------------------------
        // Delay
        //-----------------------------------

        await new Promise(resolve =>
            setTimeout(resolve, GEMINI_DELAY_MS)
        );

    }

    //-----------------------------------
    // Finished
    //-----------------------------------

    // if (fs.existsSync(CHECKPOINT_FILE)) {

    //     fs.unlinkSync(
    //         CHECKPOINT_FILE
    //     );

    //     console.log(
    //         "\nCheckpoint removed."
    //     );
    // }

    console.log("\n======================");
    console.log("Dataset Generation Finished");
    console.log("======================");
    console.log(`Saved   : ${savedCount}`);
    console.log(`Skipped : ${skippedCount}`);
    console.log(`Failed  : ${failedCount}`);
}
async function main() {

    try {

        await mongoose.connect(
            process.env.MONGO_URI
        );

        console.log("✅ MongoDB Connected");

        await generateDataset();

    } catch (err) {

        console.error(err);

    } finally {

        await mongoose.disconnect();

        console.log("MongoDB Disconnected");

    }

}

main();
