#!/bin/bash

# ttxgotime.xyz Deployment Script
# Domain: ttxgotime.xyz
# VPS: 94.156.232.142

echo "🚀 ttxgotime.xyz Deployment Script"
echo "=================================="
echo ""

# Server details
DOMAIN="ttxgotime.xyz"
SERVER_IP="94.156.232.142"
SERVER_USER="root"
SERVER_PATH="/var/www/html"

echo "📋 Deployment Information:"
echo "   Domain: $DOMAIN"
echo "   Server IP: $SERVER_IP"
echo "   User: $SERVER_USER"
echo "   Path: $SERVER_PATH"
echo ""

# Check if files exist
echo "🔍 Checking local files..."
files=("index.php" "site.html" "offer.html" "offer-with-maxconv.html" "maxconv-handler.js" "vps-link-generator.html" "link-builder.html")
all_files_exist=true

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "   ✅ $file found"
    else
        echo "   ❌ $file not found"
        all_files_exist=false
    fi
done

if [ "$all_files_exist" = false ]; then
    echo ""
    echo "❌ Some files are missing. Please ensure all files are present."
    exit 1
fi

echo ""
echo "📤 Ready to deploy to ttxgotime.xyz..."
echo ""

# Create deployment package
echo "📦 Creating deployment package..."
tar -czf ttxgotime-deploy.tar.gz index.php site.html offer.html offer-with-maxconv.html maxconv-handler.js vps-link-generator.html link-builder.html
echo "   ✅ Created ttxgotime-deploy.tar.gz"
echo ""

echo "🚀 Deployment Options:"
echo ""
echo "Option 1 - Direct SCP Upload:"
echo "   scp ttxgotime-deploy.tar.gz $SERVER_USER@$SERVER_IP:/tmp/"
echo "   ssh $SERVER_USER@$SERVER_IP 'cd $SERVER_PATH && tar -xzf /tmp/ttxgotime-deploy.tar.gz && rm /tmp/ttxgotime-deploy.tar.gz'"
echo ""
echo "Option 2 - Individual File Upload:"
echo "   scp index.php site.html offer.html offer-with-maxconv.html maxconv-handler.js vps-link-generator.html link-builder.html $SERVER_USER@$SERVER_IP:$SERVER_PATH/"
echo ""
echo "Option 3 - SFTP Upload:"
echo "   sftp $SERVER_USER@$SERVER_IP"
echo "   cd $SERVER_PATH"
echo "   put index.php"
echo "   put site.html"
echo "   put offer.html"
echo "   put offer-with-maxconv.html"
echo "   put maxconv-handler.js"
echo "   put vps-link-generator.html"
echo "   put link-builder.html"
echo "   quit"
echo ""
echo "Option 4 - Manual Upload via Hosting Panel:"
echo "   1. Log into your VPS control panel"
echo "   2. Navigate to File Manager"
echo "   3. Go to /var/www/html directory"
echo "   4. Upload all files from ttxgotime-deploy.tar.gz"
echo "      - index.php (cloaking script)"
echo "      - site.html (white page)"
echo "      - offer.html (test offer page)"
echo "      - offer-with-maxconv.html (MaxConv integrated offer page)"
echo "      - maxconv-handler.js (MaxConv parameter handler)"
echo "      - vps-link-generator.html (VPS link generator)"
echo "      - link-builder.html (original link builder)"
echo ""

echo "🔧 After Deployment:"
echo "   1. Set proper file permissions:"
echo "      chmod 644 *.html *.php *.js"
echo "      chmod 755 ."
echo ""
echo "   2. Test the setup:"
echo "      curl -I http://$DOMAIN"
echo "      curl -I http://$SERVER_IP"
echo ""
echo "   3. Verify cloaking:"
echo "      Visit: http://$DOMAIN (should show white page)"
echo "      Visit: http://$DOMAIN/vps-link-generator.html (VPS link generator)"
echo "      Visit: http://$DOMAIN/offer-with-maxconv.html (MaxConv integrated offer page)"
echo "      Visit: http://$DOMAIN/link-builder.html (original link builder)"
echo ""

echo "🌐 DNS Configuration:"
echo "   Make sure your DNS is pointing to $SERVER_IP"
echo "   A record: @ -> $SERVER_IP"
echo "   A record: www -> $SERVER_IP"
echo ""

echo "📋 Quick Test Commands:"
echo "   # Test DNS resolution"
echo "   nslookup $DOMAIN"
echo "   ping $DOMAIN"
echo ""
echo "   # Test HTTP access"
echo "   curl -I http://$DOMAIN"
echo "   curl -I http://$SERVER_IP"
echo ""

echo "✅ Deployment package ready: ttxgotime-deploy.tar.gz"
echo "   Upload this file to your VPS and extract it in $SERVER_PATH"
