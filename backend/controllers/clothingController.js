const Clothing = require("../models/Clothing");

//----------------------------------------------------
// GET ALL CLOTHING
//----------------------------------------------------

exports.getAllClothing = async (req, res) => {

    console.log("GET /clothing");

    try {

        const outfits = await Clothing.find();

        res.status(200).json(outfits);

    }

    catch (err) {

        res.status(500).json({

            success: false,
            message: err.message,

        });

    }

};

//----------------------------------------------------
// GET CLOTHING BY ID
//----------------------------------------------------

exports.getClothingById = async (req, res) => {

    try {

        const outfit =
            await Clothing.findById(
                req.params.id
            );

        if (!outfit) {

            return res.status(404).json({

                success: false,
                message: "Clothing not found"

            });

        }

        res.status(200).json(outfit);

    }

    catch (err) {

        res.status(500).json({

            success: false,
            message: err.message,

        });

    }

};

//----------------------------------------------------
// SEARCH CLOTHING
//----------------------------------------------------

exports.searchClothing = async (req, res) => {

    try {

        const query = req.query.q?.trim();

        if (!query) {

            return res.status(400).json({

                success: false,
                message: "Search query required."

            });

        }

        //----------------------------------
        // Split search into words
        //----------------------------------

        const words = query
            .toLowerCase()
            .split(/\s+/);

        //----------------------------------
        // MongoDB Search
        //----------------------------------

        const searchConditions = [];

        for (const word of words) {

            searchConditions.push(

                { title: { $regex: word, $options: "i" } },
                { description: { $regex: word, $options: "i" } },
                { styleTags: { $regex: word, $options: "i" } },
                { items: { $regex: word, $options: "i" } },
                { colors: { $regex: word, $options: "i" } },
                { season: { $regex: word, $options: "i" } },
                { occasion: { $regex: word, $options: "i" } },
                { weather: { $regex: word, $options: "i" } },
                { fabric: { $regex: word, $options: "i" } },
                { fit: { $regex: word, $options: "i" } },
                { pattern: { $regex: word, $options: "i" } },
                { targetAudience: { $regex: word, $options: "i" } },
                { mainCategory: { $regex: word, $options: "i" } }

            );

        }

        const outfits = await Clothing.find({

            $or: searchConditions

        });

        //----------------------------------
        // Ranking Algorithm
        //----------------------------------

        const scoredOutfits = outfits.map(outfit => {

            let score = 0;

            for (const word of words) {

                const title =
                    (outfit.title || "").toLowerCase();

                const description =
                    (outfit.description || "").toLowerCase();

                const styleTags =
                    (outfit.styleTags || [])
                        .join(" ")
                        .toLowerCase();

                const items =
                    (outfit.items || [])
                        .join(" ")
                        .toLowerCase();

                const colors =
                    (outfit.colors || [])
                        .join(" ")
                        .toLowerCase();

                const fabric =
                    (outfit.fabric || [])
                        .join(" ")
                        .toLowerCase();

                const season =
                    (outfit.season || [])
                        .join(" ")
                        .toLowerCase();

                const occasion =
                    (outfit.occasion || [])
                        .join(" ")
                        .toLowerCase();

                const weather =
                    (outfit.weather || [])
                        .join(" ")
                        .toLowerCase();

                const pattern =
                    (outfit.pattern || "").toLowerCase();

                const fit =
                    (outfit.fit || "").toLowerCase();

                const category =
                    (outfit.mainCategory || "").toLowerCase();

                const audience =
                    (outfit.targetAudience || "").toLowerCase();

                if (title.includes(word))
                    score += 10;

                if (styleTags.includes(word))
                    score += 8;

                if (items.includes(word))
                    score += 7;

                if (description.includes(word))
                    score += 5;

                if (colors.includes(word))
                    score += 4;

                if (fabric.includes(word))
                    score += 4;

                if (occasion.includes(word))
                    score += 3;

                if (season.includes(word))
                    score += 3;

                if (weather.includes(word))
                    score += 2;

                if (pattern.includes(word))
                    score += 2;

                if (fit.includes(word))
                    score += 2;

                if (category.includes(word))
                    score += 5;

                if (audience.includes(word))
                    score += 2;

            }

            return {

                score,
                outfit

            };

        });

        //----------------------------------
        // Highest score first
        //----------------------------------

        scoredOutfits.sort(

            (a, b) => b.score - a.score

        );

        //----------------------------------
        // Remove scores
        //----------------------------------

        const finalResults = scoredOutfits.map(

            item => item.outfit

        );

        //----------------------------------
        // Response
        //----------------------------------

        res.status(200).json({

            success: true,
            count: finalResults.length,
            data: finalResults

        });

    }

    catch (err) {

        res.status(500).json({

            success: false,
            message: err.message

        });

    }

};
//----------------------------------------------------
// FILTER CLOTHING
//----------------------------------------------------

exports.filterClothing = async (req, res) => {

    try {

        const filters = {};

        if (req.query.gender)
            filters.targetAudience =
                req.query.gender;

        if (req.query.category)
            filters.mainCategory =
                req.query.category;

        if (req.query.season)
            filters.season =
                req.query.season;

        if (req.query.occasion)
            filters.occasion =
                req.query.occasion;

        const outfits =
            await Clothing.find(filters);

        res.status(200).json(outfits);

    }

    catch (err) {

        res.status(500).json({

            success: false,
            message: err.message,

        });

    }

};

//----------------------------------------------------
// TO BE IMPLEMENTED
//----------------------------------------------------

exports.saveClothing = async (req, res) => {

    res.json({

        message:
            "Coming soon."

    });

};

exports.removeSavedClothing = async (req, res) => {

    res.json({

        message:
            "Coming soon."

    });

};

exports.incrementView = async (req, res) => {

    try {

        const outfit =
            await Clothing.findByIdAndUpdate(

                req.params.id,

                {
                    $inc: {
                        viewCount: 1
                    }
                },

                {
                    new: true
                }

            );

        if (!outfit) {

            return res.status(404).json({

                success: false,
                message: "Clothing not found."

            });

        }

        res.status(200).json({

            success: true,
            viewCount: outfit.viewCount

        });

    }

    catch (err) {

        res.status(500).json({

            success: false,
            message: err.message

        });

    }

};

exports.incrementClick = async (req, res) => {

    res.json({

        message:
            "Coming soon."

    });

};

exports.incrementSave = async (req, res) => {

    res.json({

        message:
            "Coming soon."

    });

};

exports.getRecommendations = async (req, res) => {

    res.json({

        message:
            "Coming soon."

    });

};