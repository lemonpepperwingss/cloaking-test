#!/bin/bash

# Server Verification Script for Cloaking Requirements
# Server: 94.156.232.142

echo "🔍 Cloaking Server Verification Script"
echo "======================================"
echo ""

SERVER_IP="94.156.232.142"
SERVER_USER="root"

echo "📋 Checking server prerequisites..."
echo "   Server: $SERVER_IP"
echo ""

# Create a PHP verification script
cat > verify.php << 'EOF'
<?php
echo "🔍 Cloaking Server Verification\n";
echo "===============================\n\n";

// Check PHP version
echo "PHP Version: " . PHP_VERSION . "\n";
if (version_compare(PHP_VERSION, '7.4.0', '>=')) {
    echo "✅ PHP version is 7.4 or higher\n";
} else {
    echo "❌ PHP version is below 7.4 (required)\n";
}

echo "\n";

// Check required extensions
$required_extensions = ['curl', 'mbstring', 'openssl', 'json', 'filter'];
$all_good = true;

foreach ($required_extensions as $ext) {
    if (extension_loaded($ext)) {
        echo "✅ $ext extension is loaded\n";
    } else {
        echo "❌ $ext extension is NOT loaded (required)\n";
        $all_good = false;
    }
}

echo "\n";

// Check allow_url_fopen
if (ini_get('allow_url_fopen')) {
    echo "✅ allow_url_fopen is enabled\n";
} else {
    echo "❌ allow_url_fopen is disabled (required)\n";
    $all_good = false;
}

echo "\n";

// Check if files exist
$files = ['index.php', 'site.html', 'offer.html'];
foreach ($files as $file) {
    if (file_exists($file)) {
        echo "✅ $file exists\n";
    } else {
        echo "❌ $file is missing\n";
        $all_good = false;
    }
}

echo "\n";

// Test cURL functionality
if (function_exists('curl_init')) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://httpbin.org/ip');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    
    $result = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    
    if ($http_code == 200) {
        echo "✅ cURL can make external requests\n";
    } else {
        echo "❌ cURL cannot make external requests (HTTP Code: $http_code)\n";
        $all_good = false;
    }
} else {
    echo "❌ cURL function not available\n";
    $all_good = false;
}

echo "\n";

if ($all_good) {
    echo "🎉 All prerequisites are met! Your server is ready for cloaking.\n";
} else {
    echo "⚠️  Some prerequisites are missing. Please contact your hosting provider.\n";
}

echo "\n";
echo "📊 Server Information:\n";
echo "   Server IP: " . ($_SERVER['SERVER_ADDR'] ?? 'Unknown') . "\n";
echo "   Document Root: " . ($_SERVER['DOCUMENT_ROOT'] ?? 'Unknown') . "\n";
echo "   Current Directory: " . getcwd() . "\n";
?>
EOF

echo "📤 Uploading verification script to server..."
echo ""
echo "To verify your server, run one of these commands:"
echo ""
echo "Option 1 - Using SCP:"
echo "   scp verify.php $SERVER_USER@$SERVER_IP:/var/www/html/"
echo "   ssh $SERVER_USER@$SERVER_IP 'cd /var/www/html && php verify.php'"
echo ""
echo "Option 2 - Manual upload:"
echo "   1. Upload verify.php to your server's web root"
echo "   2. Visit: http://$SERVER_IP/verify.php"
echo "   3. Check the output for any ❌ errors"
echo ""
echo "Option 3 - Via hosting panel:"
echo "   1. Log into your hosting control panel"
echo "   2. Create a new file called verify.php"
echo "   3. Copy the contents of verify.php"
echo "   4. Save and visit: http://$SERVER_IP/verify.php"
echo ""
echo "After verification, delete verify.php for security."
