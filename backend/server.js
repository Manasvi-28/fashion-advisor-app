require("dotenv").config();
const mongoose = require("mongoose");
const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());

app.use(express.json());

const clothingRoutes =
    require("./routes/clothingRoutes");

app.use("/clothing", clothingRoutes);

mongoose.connect(process.env.MONGO_URI)
.then(() => {
    console.log("✅ MongoDB Connected");
   
})
.catch((err) => {
    console.error("ERROR NAME:", err.name);
    console.error("ERROR MESSAGE:", err.message);
    console.error(err);
});

app.listen(5000, () => {

    console.log(
        "Fashion Advisor Backend Running..."
    );

});
