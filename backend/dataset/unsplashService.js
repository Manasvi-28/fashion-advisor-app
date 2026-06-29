const axios = require("axios");

const UNSPLASH_ACCESS_KEY =
    process.env.UNSPLASH_ACCESS_KEY;

async function searchImages(
    query,
    page = 1,
    perPage = 10
) {

    try {

        const response = await axios.get(
            "https://api.unsplash.com/search/photos",
            {
                params: {
                    query: query,
                    page: page,
                    per_page: perPage,
                },

                headers: {
                    Authorization:
                        `Client-ID ${UNSPLASH_ACCESS_KEY}`,
                },
            }
        );

        return response.data.results.map((image) => ({

    id: image.id,

    imageUrl: image.urls.regular,

    thumbnail: image.urls.small,

    photographer: image.user.name,

    photographerProfile:
        image.user.links.html,

}));

    } catch (error) {

        console.log(error.response?.data || error.message);

        return [];

    }

}

module.exports = {
    searchImages,
};