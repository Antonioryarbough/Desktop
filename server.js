const express = require('express');
const path = require('path');
const http = require('http');
const socketIO = require('socket.io');

// Load environment variables
require('dotenv').config();

const app = express();
const server = http.createServer(app);
const io = socketIO(server);

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname)));

// Environment variables with defaults
const PORT = process.env.PORT || 3000;
const NODE_ENV = process.env.NODE_ENV || 'development';
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/giftingshop';

// Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'gifting-shop.html'));
});

app.get('/health', (req, res) => {
    res.json({ 
        status: 'ok', 
        environment: NODE_ENV,
        timestamp: new Date().toISOString()
    });
});

// API Routes for future expansion
app.get('/api/products', (req, res) => {
    const products = [
        {
            id: 1,
            name: 'Birthday Gift Box',
            description: 'A curated collection of birthday surprises including confetti, candles, and treats.',
            price: 49.99,
            emoji: '🎂'
        },
        {
            id: 2,
            name: 'Floral Arrangement',
            description: 'Beautiful handpicked flowers arranged with love and care for any occasion.',
            price: 39.99,
            emoji: '💐'
        },
        {
            id: 3,
            name: 'Chocolate Delights',
            description: 'Premium handmade chocolates in an elegant gift box, perfect for chocolate lovers.',
            price: 29.99,
            emoji: '🍫'
        },
        {
            id: 4,
            name: "Book Lover's Bundle",
            description: 'Bestselling books with a cozy reading kit including bookmark and tea.',
            price: 44.99,
            emoji: '📚'
        },
        {
            id: 5,
            name: 'Relaxation Kit',
            description: 'Scented candles, essential oils, and bath salts for ultimate relaxation.',
            price: 34.99,
            emoji: '🕯️'
        },
        {
            id: 6,
            name: "Artist's Collection",
            description: 'Premium art supplies for the creative soul in your life.',
            price: 59.99,
            emoji: '🎨'
        }
    ];
    
    res.json(products);
});

// Socket.IO connection handling
io.on('connection', (socket) => {
    console.log('New client connected:', socket.id);
    
    socket.on('disconnect', () => {
        console.log('Client disconnected:', socket.id);
    });
    
    // Handle cart updates
    socket.on('cart:update', (data) => {
        console.log('Cart updated:', data);
        socket.broadcast.emit('cart:updated', data);
    });
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error('Error:', err.stack);
    res.status(500).json({ 
        error: 'Something went wrong!',
        message: NODE_ENV === 'development' ? err.message : 'Internal server error'
    });
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({ error: 'Not found' });
});

// Start server
server.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
    console.log(`Visit http://localhost:${PORT} to view the app`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
    console.log('SIGTERM received, closing server gracefully...');
    server.close(() => {
        console.log('Server closed');
        process.exit(0);
    });
});

module.exports = app;
