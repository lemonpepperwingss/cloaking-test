# 🚀 AUTO-DEPLOY INSTRUCTIONS - ttxgotime.xyz

## IMMEDIATE DEPLOYMENT - NO TOUCHING REQUIRED

### Option 1: VPS Control Panel Upload (RECOMMENDED)

1. **Log into your VPS control panel** (cPanel, Plesk, or direct server access)
2. **Go to File Manager**
3. **Navigate to `/var/www/html` or `public_html`**
4. **Upload the file: `ttxgotime-deploy.tar.gz`**
5. **Extract the archive** (right-click → Extract)
6. **Set permissions:**
   - Select all files → Right-click → Permissions
   - Set to 644 for files, 755 for directories

### Option 2: SSH Key Setup (If you want SSH access)

1. **Generate SSH key:**
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
   ```

2. **Copy public key:**
   ```bash
   cat ~/.ssh/id_rsa.pub
   ```

3. **Add to VPS:**
   - Log into VPS control panel
   - Go to SSH Keys section
   - Add the public key

4. **Then run:**
   ```bash
   scp ttxgotime-deploy.tar.gz root@94.156.232.142:/tmp/
   ssh root@94.156.232.142 'cd /var/www/html && tar -xzf /tmp/ttxgotime-deploy.tar.gz && chmod 644 *.html *.php *.js && chmod 755 . && rm /tmp/ttxgotime-deploy.tar.gz'
   ```

### Option 3: FTP Upload

1. **Use FTP client** (FileZilla, WinSCP, etc.)
2. **Connect to:** 94.156.232.142
3. **Upload all files** from the deployment package
4. **Set permissions** via FTP client

## FILES TO UPLOAD

The `ttxgotime-deploy.tar.gz` contains:

- ✅ `index.php` - Cloaking script (MAIN ENTRY POINT)
- ✅ `site.html` - White page
- ✅ `offer-with-maxconv.html` - MaxConv integrated offer page
- ✅ `maxconv-handler.js` - MaxConv parameter handler
- ✅ `vps-link-generator.html` - VPS link generator (MAIN TOOL)
- ✅ `offer.html` - Test offer page
- ✅ `link-builder.html` - Original link builder

## AFTER UPLOAD - AUTOMATIC TESTING

Once files are uploaded, test these URLs:

1. **White Page:** `http://ttxgotime.xyz` (should show white page)
2. **Link Generator:** `http://ttxgotime.xyz/vps-link-generator.html` (MAIN TOOL)
3. **MaxConv Offer:** `http://ttxgotime.xyz/offer-with-maxconv.html` (test page)
4. **Original Builder:** `http://ttxgotime.xyz/link-builder.html` (backup)

## DNS CONFIGURATION (If not done yet)

Add these DNS records in CloudNS:

```
Type: A, Name: @, Value: 94.156.232.142, TTL: 300
Type: A, Name: www, Value: 94.156.232.142, TTL: 300
```

## CLOAKING.HOUSE CONFIGURATION

1. **White Page URL:** `http://ttxgotime.xyz/site.html`
2. **Offer Page URL:** `http://ttxgotime.xyz/offer-with-maxconv.html`
3. **Load Method:** "load" for both
4. **Add your IP to whitelist** for testing

## TESTING CHECKLIST

- [ ] Files uploaded to VPS
- [ ] Permissions set correctly
- [ ] DNS pointing to VPS
- [ ] White page loads
- [ ] Link generator works
- [ ] MaxConv offer page loads
- [ ] Cloaking.House configured
- [ ] Test with whitelist IP

## SUCCESS INDICATORS

✅ **White page loads** at ttxgotime.xyz  
✅ **Link generator works** at ttxgotime.xyz/vps-link-generator.html  
✅ **MaxConv integration** works on mobile  
✅ **Parameters pass** correctly to MaxConv  
✅ **Cloaking filters** traffic properly  

## EMERGENCY CONTACT

If you need help with the upload process, the files are ready in:
`/Users/christianarmstrong/Desktop/Landing Pages/cloaking-test/ttxgotime-deploy.tar.gz`

Just upload this single file and extract it on your VPS!
