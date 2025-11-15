# Gifting Shop 🎁

A beautiful, responsive gifting shop application with real-time features built with Node.js, Express, and Socket.IO.

## Features

- 🛍️ Modern, responsive design
- 🛒 Shopping cart functionality
- 🔄 Real-time updates with Socket.IO
- 🎨 Beautiful gradient UI
- 📱 Mobile-friendly interface
- ⚡ Fast and lightweight

## Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)

## Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/Antonioryarbough/Desktop.git
   cd Desktop
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Create environment file**
   ```bash
   cp .env.example .env
   ```
   Edit `.env` and configure your environment variables.

4. **Start the development server**
   ```bash
   npm run dev
   ```
   Or for production:
   ```bash
   npm start
   ```

5. **Open your browser**
   Navigate to `http://localhost:3000`

## Deployment to Railway

### Step 1: Prepare Your Repository

1. Ensure all files are committed to your GitHub repository
2. Make sure `.gitignore` includes `node_modules/` and `.env`
3. Verify `package.json` has the correct `start` script

### Step 2: Deploy to Railway

1. **Sign up for Railway**
   - Go to [railway.app](https://railway.app)
   - Sign up with your GitHub account

2. **Create a new project**
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository (`Antonioryarbough/Desktop`)
   - Railway will automatically detect it's a Node.js app

3. **Configure Environment Variables**
   - In your Railway project dashboard, go to "Variables"
   - Add the following environment variables:
     ```
     NODE_ENV=production
     PORT=3000 (Railway will override this automatically)
     ```
   - Add any other variables from `.env.example` as needed

4. **Deploy**
   - Railway will automatically build and deploy your application
   - Wait for the deployment to complete (usually 2-3 minutes)

5. **Get your URL**
   - Once deployed, Railway will provide a URL like: `https://your-app.up.railway.app`
   - Click on "Settings" → "Generate Domain" if not automatically generated

### Step 3: Connect a Custom Domain (Optional)

1. **In Railway Dashboard**
   - Go to your project settings
   - Click on "Domains"
   - Click "Custom Domain"
   - Enter your domain name

2. **Configure DNS**
   - Add a CNAME record in your domain provider:
     - Name: `@` or `www`
     - Value: provided by Railway (e.g., `your-app.up.railway.app`)
     - TTL: 3600 (or automatic)

3. **Wait for DNS propagation** (can take up to 48 hours, usually much faster)

## Environment Variables

The following environment variables can be configured:

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `PORT` | Server port | 3000 | No (Railway sets this) |
| `NODE_ENV` | Environment mode | development | No |
| `MONGODB_URI` | MongoDB connection string | mongodb://localhost:27017/giftingshop | No |
| `SESSION_SECRET` | Session secret key | - | For future use |
| `JWT_SECRET` | JWT secret key | - | For future use |

## Project Structure

```
Desktop/
├── server.js              # Express server with Socket.IO
├── gifting-shop.html      # Main HTML file with embedded CSS/JS
├── package.json           # Node.js dependencies and scripts
├── .env.example           # Example environment variables
├── .gitignore            # Git ignore rules
└── README.md             # This file
```

## API Endpoints

- `GET /` - Main application page
- `GET /health` - Health check endpoint
- `GET /api/products` - Get all products (JSON)

## Technologies Used

- **Backend**: Node.js, Express.js
- **Real-time**: Socket.IO
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Deployment**: Railway

## Troubleshooting

### Port already in use
If you get a "port already in use" error:
```bash
# Find and kill the process using the port (Linux/Mac)
lsof -ti:3000 | xargs kill -9

# On Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

### Dependencies not installing
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Railway deployment fails
- Check the Railway logs for specific error messages
- Ensure all required dependencies are in `package.json`
- Verify `start` script in `package.json` is correct
- Check that environment variables are properly set

## Future Enhancements

- [ ] Add MongoDB database integration
- [ ] User authentication and registration
- [ ] Payment gateway integration (Stripe/PayPal)
- [ ] Order history and tracking
- [ ] Product search and filtering
- [ ] Admin dashboard for product management
- [ ] Email notifications
- [ ] Product reviews and ratings

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - feel free to use this project for learning or commercial purposes.

## Contact

For questions or support, please open an issue on GitHub.

---

Made with ❤️ by Antonio Ryarbough
