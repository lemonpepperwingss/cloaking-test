# 🌐 Domain Setup Guide

## Server Information
- **Server IP:** 94.156.232.142
- **IPv6:** 2a0e:d604:1:45d::/64
- **Gateway:** 10.0.0.1
- **Status:** Active

## Domain Configuration Steps

### 1. DNS Configuration

You need to point your domain to your server. Here are the DNS records you need to set up:

#### A Record (IPv4)
```
Type: A
Name: @ (or your domain name)
Value: 94.156.232.142
TTL: 300 (or default)
```

#### AAAA Record (IPv6)
```
Type: AAAA
Name: @ (or your domain name)
Value: 2a0e:d604:1:45d::/64
TTL: 300 (or default)
```

#### WWW Subdomain
```
Type: A
Name: www
Value: 94.156.232.142
TTL: 300 (or default)
```

### 2. Where to Configure DNS

Depending on where you bought your domain:

#### GoDaddy
1. Log into your GoDaddy account
2. Go to "My Products" → "DNS"
3. Click "Manage" next to your domain
4. Add the A and AAAA records above

#### Namecheap
1. Log into your Namecheap account
2. Go to "Domain List"
3. Click "Manage" next to your domain
4. Go to "Advanced DNS" tab
5. Add the A and AAAA records above

#### Cloudflare
1. Log into your Cloudflare account
2. Select your domain
3. Go to "DNS" tab
4. Add the A and AAAA records above

### 3. SSL Certificate Setup

After your domain is pointing to the server, you'll need SSL:

#### Option 1: Let's Encrypt (Free)
```bash
# SSH into your server
ssh root@94.156.232.142

# Install Certbot
apt update
apt install certbot python3-certbot-apache

# Get SSL certificate
certbot --apache -d your-domain.com -d www.your-domain.com
```

#### Option 2: cPanel SSL (if available)
1. Log into your hosting control panel
2. Go to "SSL/TLS" section
3. Enable "Let's Encrypt" or upload your certificate

### 4. Testing Your Setup

After DNS propagation (usually 5-30 minutes):

1. **Test DNS Resolution:**
   ```bash
   nslookup your-domain.com
   ping your-domain.com
   ```

2. **Test HTTP Access:**
   - Visit: `http://your-domain.com`
   - Should show your white page

3. **Test HTTPS Access:**
   - Visit: `https://your-domain.com`
   - Should show your white page with SSL

4. **Test Cloaking:**
   - Visit: `https://your-domain.com`
   - Should show white page (you're filtered out)
   - Add your IP to Cloaking.House whitelist
   - Visit again - should show offer page

### 5. File Structure on Server

After deployment, your server should have:
```
/var/www/html/
├── index.php          # Cloaking script
├── site.html          # White page
├── offer.html         # Test offer page
├── verify.php         # Verification script (delete after use)
└── link-builder.html  # Custom link builder
```

### 6. Cloaking.House Configuration

Once your domain is live:

1. **White Page URL:** `https://your-domain.com/site.html`
2. **Offer Page URL:** Your affiliate link or `https://your-domain.com/offer.html`
3. **Load Method:** Choose "load" for white page
4. **Redirect Method:** Choose "redirect" for offer page

### 7. Testing Checklist

- [ ] Domain resolves to correct IP
- [ ] HTTP access works
- [ ] HTTPS access works (SSL certificate)
- [ ] White page loads correctly
- [ ] Cloaking script works (shows white page by default)
- [ ] Whitelist IP works (shows offer page)
- [ ] Link builder generates correct URLs

### 8. Common Issues

#### DNS Not Propagating
- Wait 24-48 hours for full propagation
- Check with different DNS lookup tools
- Clear your browser cache

#### SSL Certificate Issues
- Ensure domain is pointing to server first
- Check if port 80 and 443 are open
- Verify domain ownership

#### Cloaking Not Working
- Check if all files are uploaded correctly
- Verify PHP extensions are installed
- Check Cloaking.House flow configuration
- Test with verification script

## Next Steps

1. Configure your domain DNS
2. Wait for propagation
3. Set up SSL certificate
4. Test the setup
5. Configure Cloaking.House flow
6. Use the link builder to generate tracking URLs
