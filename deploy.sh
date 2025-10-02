#!/bin/bash

# Cloaking Test Deployment Script
# Server: 94.156.232.142
# Domain: [Your domain will be configured]

echo "🚀 Cloaking Test Deployment Script"
echo "=================================="
echo ""

# Server details
SERVER_IP="94.156.232.142"
SERVER_USER="root"
SERVER_PATH="/var/www/html"

echo "📋 Server Information:"
echo "   IP Address: $SERVER_IP"
echo "   User: $SERVER_USER"
echo "   Path: $SERVER_PATH"
echo ""

# Check if files exist
echo "🔍 Checking local files..."
if [ -f "index.php" ]; then
    echo "   ✅ index.php found"
else
    echo "   ❌ index.php not found"
    exit 1
fi

if [ -f "site.html" ]; then
    echo "   ✅ site.html found"
else
    echo "   ❌ site.html not found"
    exit 1
fi

if [ -f "offer.html" ]; then
    echo "   ✅ offer.html found"
else
    echo "   ❌ offer.html not found"
    exit 1
fi

echo ""
echo "📤 Ready to deploy files to server..."
echo ""
echo "To deploy, run one of these commands:"
echo ""
echo "Option 1 - Using SCP (if you have SSH access):"
echo "   scp index.php site.html offer.html $SERVER_USER@$SERVER_IP:$SERVER_PATH/"
echo ""
echo "Option 2 - Using SFTP:"
echo "   sftp $SERVER_USER@$SERVER_IP"
echo "   put index.php"
echo "   put site.html"
echo "   put offer.html"
echo "   quit"
echo ""
echo "Option 3 - Manual upload via hosting panel:"
echo "   1. Log into your hosting control panel"
echo "   2. Navigate to File Manager"
echo "   3. Go to public_html or www directory"
echo "   4. Upload index.php, site.html, and offer.html"
echo ""
echo "After deployment, run the verification script:"
echo "   ./verify-server.sh"
