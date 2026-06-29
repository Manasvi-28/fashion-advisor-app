# Fashion Advisor AI 👗

A cross-platform fashion discovery and personal styling app built with Flutter and Node.js.

## Features

- 🔐 **User Authentication** — Secure sign-in and sign-up via Firebase Authentication
- 👗 **Fashion Catalogue** — Browse clothing, accessories, makeup, and skincare collections
- ☁️ **Cloud Storage** — Fashion data managed via MongoDB Atlas and Cloudinary

## Tech Stack

**Frontend**
- Flutter (Dart) — cross-platform mobile app (Android & iOS)
- Firebase Authentication

**Backend**
- Node.js + Express.js
- RESTful API with MVC architecture
- MongoDB Atlas + Mongoose
- Cloudinary (image storage)
- Gemini AI API (outfit recommendations)

## Project Structure

```
fashionAdvisorApp/
├── backend/
│   ├── routes/          # API route handlers
│   ├── services/        # Gemini, Cloudinary, upload services
│   └── server.js        # Entry point
└── frontend/
    └── fashion_advisor_ai/
        └── lib/
            ├── models/      # Data models
            ├── screens/     # UI screens
            └── services/    # API and auth services
```

## Getting Started

### Prerequisites
- Flutter SDK
- Node.js (v18+)
- MongoDB Atlas account
- Firebase project

### Backend Setup

```bash
cd backend
npm install
```

Create a `.env` file in the `backend/` directory:
```
MONGODB_URI=your_mongodb_connection_string
GEMINI_API_KEY=your_gemini_api_key
CLOUDINARY_URL=your_cloudinary_url
```

Start the server:
```bash
node server.js
```

### Frontend Setup

```bash
cd frontend/fashion_advisor_ai
flutter pub get
flutter run
```

## Status

Core features implemented and functional:
- ✅ User authentication (Firebase)
- ✅ Fashion catalogue browsing
- ✅ REST API integration
- ✅ MongoDB cloud database
- 🚧 AI outfit recommendations (Gemini) — in progress
- 🚧 Style discovery and personal stylist features — in progress

## Author

**Manasvi Nautiyal**  
B.Tech ECE, NSUT Delhi | NXP Women in Tech Scholar  
[LinkedIn](https://www.linkedin.com/in/manasvi-nautiyal-03a733261) • [GitHub](https://github.com/Manasvi-28)
