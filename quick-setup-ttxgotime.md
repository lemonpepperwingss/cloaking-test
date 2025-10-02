# 🚀 Quick Setup Guide for ttxgotime.xyz

## Current Status
- **Domain:** ttxgotime.xyz
- **VPS IP:** 94.156.232.142
- **DNS:** Not configured yet (NXDOMAIN)

## Step 1: Configure DNS in CloudNS

### Go to CloudNS Dashboard
1. Visit [CloudNS.net](https://www.cloudns.net)
2. Log into your account
3. Find "ttxgotime.xyz" in your domain list
4. Click "Manage" or "DNS settings"

### Add These DNS Records

#### A Record (IPv4)
```
Type: A
Name: @ (or leave blank)
Value: 94.156.232.142
TTL: 300
```

#### A Record (WWW)
```
Type: A
Name: www
Value: 94.156.232.142
TTL: 300
```

### Save and Wait
- Save the DNS records
- Wait 5-30 minutes for propagation

## Step 2: Deploy Files to VPS

### Option A: Using SCP (if you have SSH access)
```bash
# Upload the deployment package
scp ttxgotime-deploy.tar.gz root@94.156.232.142:/tmp/

# SSH into server and extract
ssh root@94.156.232.142
cd /var/www/html
tar -xzf /tmp/ttxgotime-deploy.tar.gz
chmod 644 *.html *.php
chmod 755 .
rm /tmp/ttxgotime-deploy.tar.gz
```

### Option B: Manual Upload via VPS Control Panel
1. Log into your VPS control panel
2. Go to File Manager
3. Navigate to `/var/www/html`
4. Upload these files:
   - `index.php` (cloaking script)
   - `site.html` (white page)
   - `offer.html` (test offer page)
   - `link-builder.html` (link generator)

## Step 3: Test the Setup

### Test DNS Resolution
```bash
nslookup ttxgotime.xyz
ping ttxgotime.xyz
```

### Test HTTP Access
```bash
curl -I http://ttxgotime.xyz
curl -I http://94.156.232.142
```

### Test in Browser
- Visit: `http://ttxgotime.xyz` (should show white page)
- Visit: `http://ttxgotime.xyz/link-builder.html` (link generator)

## Step 4: Configure Cloaking.House

1. **White Page URL:** `http://ttxgotime.xyz/site.html`
2. **Offer Page URL:** Your affiliate link or `http://ttxgotime.xyz/offer.html`
3. **Load Method:** Choose "load" for white page
4. **Redirect Method:** Choose "redirect" for offer page

## Step 5: Test Cloaking

1. **Default Test:** Visit `http://ttxgotime.xyz` - should show white page
2. **Whitelist Test:** Add your IP to Cloaking.House whitelist, visit again - should show offer page

## Quick Commands

### Check DNS Status
```bash
nslookup ttxgotime.xyz
dig ttxgotime.xyz A
```

### Test Server Access
```bash
curl -I http://94.156.232.142
curl -I http://ttxgotime.xyz
```

### Check File Permissions (on server)
```bash
ls -la /var/www/html/
chmod 644 /var/www/html/*.html /var/www/html/*.php
chmod 755 /var/www/html/
```

## Expected Results

After setup, you should see:
- DNS resolves to 94.156.232.142
- White page loads at ttxgotime.xyz
- Link builder works at ttxgotime.xyz/link-builder.html
- Cloaking script filters traffic correctly

## Troubleshooting

### DNS Not Working
- Wait up to 24 hours for full propagation
- Check CloudNS DNS records are correct
- Clear browser cache

### Files Not Loading
- Check file permissions on server
- Verify files are in `/var/www/html`
- Check VPS is running web server

### Cloaking Not Working
- Verify `index.php` is in root directory
- Check Cloaking.House flow configuration
- Test with verification script
