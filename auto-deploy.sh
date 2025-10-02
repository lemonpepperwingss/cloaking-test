#!/bin/bash

# AUTO-DEPLOY SCRIPT FOR ttxgotime.xyz
# This script will deploy everything automatically

echo "🚀 AUTO-DEPLOYING ttxgotime.xyz VPS SETUP"
echo "=========================================="
echo ""

# Server details
SERVER_IP="94.156.232.142"
SERVER_USER="root"
SERVER_PATH="/var/www/html"

echo "📋 Server Information:"
echo "   IP: $SERVER_IP"
echo "   User: $SERVER_USER"
echo "   Path: $SERVER_PATH"
echo ""

# Check if deployment package exists
if [ ! -f "ttxgotime-deploy.tar.gz" ]; then
    echo "❌ Deployment package not found!"
    echo "   Creating deployment package..."
    
    # Create deployment package
    tar -czf ttxgotime-deploy.tar.gz index.php site.html offer.html offer-with-maxconv.html maxconv-handler.js vps-link-generator.html link-builder.html
    
    if [ $? -eq 0 ]; then
        echo "   ✅ Deployment package created: ttxgotime-deploy.tar.gz"
    else
        echo "   ❌ Failed to create deployment package"
        exit 1
    fi
fi

echo "📦 Deployment package ready: ttxgotime-deploy.tar.gz"
echo ""

# Try different deployment methods
echo "🔄 Attempting deployment methods..."
echo ""

# Method 1: Try with SSH key
echo "Method 1: SSH Key Deployment"
if [ -f ~/.ssh/ttxgotime_vps ]; then
    echo "   Using SSH key: ~/.ssh/ttxgotime_vps"
    scp -i ~/.ssh/ttxgotime_vps ttxgotime-deploy.tar.gz $SERVER_USER@$SERVER_IP:/tmp/
    if [ $? -eq 0 ]; then
        echo "   ✅ File uploaded successfully"
        ssh -i ~/.ssh/ttxgotime_vps $SERVER_USER@$SERVER_IP "cd $SERVER_PATH && tar -xzf /tmp/ttxgotime-deploy.tar.gz && chmod 644 *.html *.php *.js && chmod 755 . && rm /tmp/ttxgotime-deploy.tar.gz"
        if [ $? -eq 0 ]; then
            echo "   ✅ Files extracted and permissions set"
            echo "   🎉 DEPLOYMENT COMPLETE!"
            exit 0
        else
            echo "   ❌ Failed to extract files"
        fi
    else
        echo "   ❌ Failed to upload file"
    fi
else
    echo "   ❌ SSH key not found"
fi

echo ""

# Method 2: Try with password (will prompt)
echo "Method 2: Password Authentication"
echo "   Attempting to connect with password..."
scp ttxgotime-deploy.tar.gz $SERVER_USER@$SERVER_IP:/tmp/
if [ $? -eq 0 ]; then
    echo "   ✅ File uploaded successfully"
    ssh $SERVER_USER@$SERVER_IP "cd $SERVER_PATH && tar -xzf /tmp/ttxgotime-deploy.tar.gz && chmod 644 *.html *.php *.js && chmod 755 . && rm /tmp/ttxgotime-deploy.tar.gz"
    if [ $? -eq 0 ]; then
        echo "   ✅ Files extracted and permissions set"
        echo "   🎉 DEPLOYMENT COMPLETE!"
        exit 0
    else
        echo "   ❌ Failed to extract files"
    fi
else
    echo "   ❌ Failed to upload file"
fi

echo ""

# Method 3: Manual instructions
echo "Method 3: Manual Deployment Required"
echo "====================================="
echo ""
echo "Since automatic deployment failed, here are the manual steps:"
echo ""
echo "1. Log into your VPS control panel"
echo "2. Go to File Manager"
echo "3. Navigate to /var/www/html"
echo "4. Upload the file: ttxgotime-deploy.tar.gz"
echo "5. Extract the archive"
echo "6. Set permissions: 644 for files, 755 for directories"
echo ""
echo "Or use these commands if you have SSH access:"
echo ""
echo "   scp ttxgotime-deploy.tar.gz root@94.156.232.142:/tmp/"
echo "   ssh root@94.156.232.142"
echo "   cd /var/www/html"
echo "   tar -xzf /tmp/ttxgotime-deploy.tar.gz"
echo "   chmod 644 *.html *.php *.js"
echo "   chmod 755 ."
echo "   rm /tmp/ttxgotime-deploy.tar.gz"
echo ""
echo "📁 Files to deploy:"
echo "   - index.php (cloaking script)"
echo "   - site.html (white page)"
echo "   - offer-with-maxconv.html (MaxConv offer page)"
echo "   - maxconv-handler.js (MaxConv handler)"
echo "   - vps-link-generator.html (link generator)"
echo "   - offer.html (test offer page)"
echo "   - link-builder.html (original builder)"
echo ""
echo "🌐 After deployment, test these URLs:"
echo "   - http://ttxgotime.xyz (white page)"
echo "   - http://ttxgotime.xyz/vps-link-generator.html (main tool)"
echo "   - http://ttxgotime.xyz/offer-with-maxconv.html (MaxConv test)"
echo ""
echo "📋 Deployment package location:"
echo "   $(pwd)/ttxgotime-deploy.tar.gz"
echo ""
echo "✅ All files are ready for deployment!"
