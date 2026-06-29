const cloudinary =
    require("./cloudinaryService");

async function uploadImage(base64Image) {

    const result =
        await cloudinary.uploader.upload(

            `data:image/jpeg;base64,${base64Image}`,

            {
                folder: "fashion_dataset",
            }

        );

    return result;

}

module.exports = {
    uploadImage,
};