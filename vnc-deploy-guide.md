# 🚀 VNC DEPLOYMENT GUIDE - ttxgotime.xyz

## IMMEDIATE VNC DEPLOYMENT STEPS

### Step 1: Access VNC
1. **Click "Copy host"** in the VNC controls panel
2. **Click "Copy password"** in the VNC controls panel
3. **Open VNC Viewer** or use the web VNC interface
4. **Connect** using the copied host and password

### Step 2: Open Terminal in VNC
1. **Right-click on desktop** → "Open Terminal" (or Ctrl+Alt+T)
2. **Navigate to web directory:**
   ```bash
   cd /var/www/html
   ```

### Step 3: Download Deployment Package
```bash
# Download the deployment package directly to your VPS
wget https://raw.githubusercontent.com/lemonpepperwingss/cloaking-test/main/ttxgotime-deploy.tar.gz

# Or if wget doesn't work, use curl:
curl -O https://raw.githubusercontent.com/lemonpepperwingss/cloaking-test/main/ttxgotime-deploy.tar.gz
```

### Step 4: Extract and Deploy
```bash
# Extract the deployment package
tar -xzf ttxgotime-deploy.tar.gz

# Set proper permissions
chmod 644 *.html *.php *.js
chmod 755 .

# Remove the deployment package
rm ttxgotime-deploy.tar.gz

# List files to verify
ls -la
```

### Step 5: Test Deployment
```bash
# Test if files are accessible
curl -I http://localhost
curl -I http://localhost/vps-link-generator.html
curl -I http://localhost/offer-with-maxconv.html
```

## ALTERNATIVE: Direct File Creation

If downloading doesn't work, create files directly in VNC:

### Create index.php (Cloaking Script)
```bash
nano index.php
# Copy and paste the cloaking script content
# Save with Ctrl+X, then Y, then Enter
```

### Create site.html (White Page)
```bash
nano site.html
# Copy and paste the white page content
# Save with Ctrl+X, then Y, then Enter
```

### Create vps-link-generator.html (Main Tool)
```bash
nano vps-link-generator.html
# Copy and paste the link generator content
# Save with Ctrl+X, then Y, then Enter
```

## VNC SHORTCUTS

- **Copy:** Ctrl+Shift+C
- **Paste:** Ctrl+Shift+V
- **Open Terminal:** Ctrl+Alt+T
- **Save in nano:** Ctrl+X, then Y, then Enter
- **Exit nano:** Ctrl+X

## FILES TO CREATE

1. **index.php** - Cloaking script (main entry point)
2. **site.html** - White page
3. **offer-with-maxconv.html** - MaxConv integrated offer page
4. **maxconv-handler.js** - MaxConv parameter handler
5. **vps-link-generator.html** - VPS link generator (MAIN TOOL)
6. **offer.html** - Test offer page
7. **link-builder.html** - Original link builder

## VERIFICATION COMMANDS

```bash
# Check if all files exist
ls -la *.html *.php *.js

# Check file permissions
ls -la

# Test web server
systemctl status apache2
# or
systemctl status nginx

# Check if port 80 is open
netstat -tlnp | grep :80
```

## EXPECTED OUTPUT

After successful deployment, you should see:
```
-rw-r--r-- 1 root root 12345 Oct  2 17:20 index.php
-rw-r--r-- 1 root root  5432 Oct  2 17:20 site.html
-rw-r--r-- 1 root root  6789 Oct  2 17:20 vps-link-generator.html
-rw-r--r-- 1 root root  4321 Oct  2 17:20 offer-with-maxconv.html
-rw-r--r-- 1 root root  2345 Oct  2 17:20 maxconv-handler.js
-rw-r--r-- 1 root root  3456 Oct  2 17:20 offer.html
-rw-r--r-- 1 root root  4567 Oct  2 17:20 link-builder.html
```

## TEST URLs (After Deployment)

- **White Page:** `http://94.156.232.142` (should show white page)
- **Link Generator:** `http://94.156.232.142/vps-link-generator.html` (MAIN TOOL)
- **MaxConv Offer:** `http://94.156.232.142/offer-with-maxconv.html` (test page)

## TROUBLESHOOTING

### If wget/curl doesn't work:
1. **Check internet connection:** `ping google.com`
2. **Try different method:** Use the direct file creation method
3. **Check firewall:** `ufw status`

### If files don't load:
1. **Check web server:** `systemctl status apache2` or `systemctl status nginx`
2. **Check permissions:** `ls -la`
3. **Check directory:** `pwd` (should be /var/www/html)

### If VNC is slow:
1. **Reduce quality** in VNC settings
2. **Use terminal only** instead of GUI
3. **Close unnecessary applications**

## SUCCESS INDICATORS

✅ **All 7 files created** in /var/www/html  
✅ **File permissions set** to 644  
✅ **Web server running** (apache2 or nginx)  
✅ **Port 80 accessible**  
✅ **Test URLs load** correctly  

## NEXT STEPS AFTER VNC DEPLOYMENT

1. **Configure DNS** in CloudNS (point ttxgotime.xyz to 94.156.232.142)
2. **Set up Cloaking.House flow** with your URLs
3. **Test the setup** with the provided URLs
4. **Start generating links** with the VPS link generator

## EMERGENCY FALLBACK

If VNC deployment fails, you can always:
1. **Use the VPS control panel** file manager
2. **Upload the ttxgotime-deploy.tar.gz** file manually
3. **Extract and set permissions** via the control panel

The deployment package is ready at:
`/Users/christianarmstrong/Desktop/Landing Pages/cloaking-test/ttxgotime-deploy.tar.gz`
