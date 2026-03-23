require('dotenv').config();
const express = require('express');
const cors = require('cors');
const db = require('./db'); // DB 연결 확인용

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Basic Route
app.get('/', (req, res) => {
  res.send('Campus Life RPG API is running!');
});

// TODO: 라우터 연결 (예: app.use('/api/users', userRoutes))

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
