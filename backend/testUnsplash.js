require("dotenv").config();
const {
    searchImages,
} = require("./dataset/unsplashService");

const searchQueries =
    require("./dataset/searchQueries");

for (const query of searchQueries) {

    console.log(
        "\nSearching:",
        query,
    );

    const images =
        await searchImages(
            query,
            1,
            3,
        );

    console.log(images);

}

async function test() {

    const images =
        await searchImages(
            "old money outfit",
            1,
            5
        );

    console.log(images);

}

test();