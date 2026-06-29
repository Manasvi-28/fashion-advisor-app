const axios = require("axios");
const mime = require("mime-types");

async function downloadImage(imageUrl) {

    const response = await axios.get(imageUrl, {
        responseType: "arraybuffer",
    });

    const base64Image =
        Buffer.from(response.data).toString("base64");

    const mimeType =
        response.headers["content-type"] ||
        mime.lookup(imageUrl) ||
        "image/jpeg";

    return {
        base64Image,
        mimeType,
    };
}

module.exports = {
    downloadImage,
};