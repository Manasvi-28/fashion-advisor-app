const express = require("express");

const router = express.Router();
router.use((req, res, next) => {
    console.log("Route hit:", req.method, req.url);
    next();
});

const clothingController =
    require("../controllers/clothingController");
    console.log("clothingRoutes loaded");

router.get(
    "/",
    clothingController.getAllClothing
);


router.get(
    "/search",
    clothingController.searchClothing
);

router.get(
    "/filter",
    clothingController.filterClothing
);

router.post(
    "/save",
    clothingController.saveClothing
);

router.delete(
    "/save/:id",
    clothingController.removeSavedClothing
);

router.post(
    "/:id/view",
    clothingController.incrementView
);

router.post(
    "/:id/click",
    clothingController.incrementClick
);

router.post(
    "/:id/save",
    clothingController.incrementSave
);

router.get(
    "/:id/recommendations",
    clothingController.getRecommendations
);
router.get(
    "/:id",
    clothingController.getClothingById
);

module.exports = router;