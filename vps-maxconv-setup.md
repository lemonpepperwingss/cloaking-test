# 🚀 VPS + MaxConv Integration Setup Guide

## Overview
This setup replicates your Shopify router + MaxConv integration but for your VPS (ttxgotime.xyz) with cloaking. The cloaking handles traffic filtering, and the MaxConv handler manages parameter passing to your campaigns.

## File Structure

```
/var/www/html/
├── index.php                    # Cloaking script (main entry point)
├── site.html                    # White page (for non-targeted traffic)
├── offer-with-maxconv.html      # Test offer page with MaxConv integration
├── maxconv-handler.js           # MaxConv parameter handler
├── vps-link-generator.html      # Link generator tool
└── link-builder.html            # Original link builder
```

## How It Works

### 1. Traffic Flow
```
User visits ttxgotime.xyz → Cloaking Script → Traffic Filtering
├── Non-targeted traffic → White page (site.html)
└── Targeted traffic → Offer page (offer-with-maxconv.html)
```

### 2. MaxConv Integration
```
Mobile user on offer page → MaxConv Handler → Redirect to MaxConv
├── Desktop/Bot → Stay on page (cloaking handles this)
└── Mobile → Redirect with proper parameters
```

### 3. Parameter Passing
- **s** = Source (e.g., "cashx1", "applex2")
- **o** = Offer (e.g., "mvcash", "mvapple")
- **ttclid** = TikTok Click ID (auto-handled)
- **campaign** = Campaign name
- **adset** = Ad set name

## MaxConv Campaign URLs

Your MaxConv campaigns are configured as:

```javascript
const MAXCONV_CAMPAIGNS = {
    'mvapple': 'https://cycsrd.mcgo2.com/visit/2b3fd6b5-3fb8-48dd-aac8-bb2d5b5ceb6d',
    'mvcash': 'https://cycsrd.mcgo2.com/visit/3d6cba42-79af-4f8a-af8f-ce8a0f724be1',
    'mvzelle': 'https://cycsrd.mcgo2.com/visit/48ef07d1-64d6-4a70-a7a4-499b208f4a83',
    'mvplayful': 'https://cycsrd.mcgo2.com/visit/9d4e9214-1c61-42b7-9572-d0845f6c158c',
    'mvpaypal': 'https://cycsrd.mcgo2.com/visit/e5fb3a1a-30f0-4333-a9e3-a2186d2e20f7',
    'mvtimhortons': 'https://cycsrd.mcgo2.com/visit/69e253b9-e72d-4701-8a28-2e6112956862',
    'mvshein': 'https://cycsrd.mcgo2.com/visit/8714e220-60cb-42e6-813c-ef6046ae68ab',
    'mvlulu': 'https://cycsrd.mcgo2.com/visit/39fa6003-327e-4cdd-9816-8cc01ab93934'
};
```

## Link Generation

### Using the VPS Link Generator
1. Visit: `http://ttxgotime.xyz/vps-link-generator.html`
2. Select offer (Apple, Cash, Zelle, etc.)
3. Set profile number (1, 2, 3, etc.)
4. Add campaign/adset names (optional)
5. Generate link

### Generated Link Format
```
https://ttxgotime.xyz/randomslug?s=cashx1&o=mvcash&campaign=Facebook&adset=AdSet1&t=1696284000000
```

### Parameter Breakdown
- **Domain**: ttxgotime.xyz
- **Slug**: randomslug (for tracking)
- **s**: cashx1 (source = offer + profile)
- **o**: mvcash (offer type)
- **campaign**: Facebook (campaign name)
- **adset**: AdSet1 (ad set name)
- **t**: 1696284000000 (timestamp)

## MaxConv Parameter Mapping

When mobile users visit the offer page, parameters are mapped to MaxConv:

```
s → s1 (source)
slug → s2 (tracking)
ttclid → ttclid + ct3
campaign → campaign
adset → adset
```

## Testing the Setup

### 1. Test White Page
```
Visit: http://ttxgotime.xyz
Expected: White page (you're filtered out)
```

### 2. Test Offer Page (Desktop)
```
Visit: http://ttxgotime.xyz/offer-with-maxconv.html
Expected: Offer page with debug info (no redirect)
```

### 3. Test Offer Page (Mobile)
```
Visit: http://ttxgotime.xyz/offer-with-maxconv.html?s=cashx1&o=mvcash
Expected: Redirect to MaxConv campaign with parameters
```

### 4. Test Link Generator
```
Visit: http://ttxgotime.xyz/vps-link-generator.html
Expected: Link generator interface
```

## Cloaking.House Configuration

### White Page Settings
- **URL**: `http://ttxgotime.xyz/site.html`
- **Method**: Load

### Offer Page Settings
- **URL**: `http://ttxgotime.xyz/offer-with-maxconv.html`
- **Method**: Load

### Filtering Settings
- Configure your target countries, devices, etc.
- Add your IP to whitelist for testing

## Deployment Commands

### Upload Files to VPS
```bash
# Upload all files
scp *.html *.js *.php root@94.156.232.142:/var/www/html/

# Set permissions
ssh root@94.156.232.142 'chmod 644 /var/www/html/*.html /var/www/html/*.js /var/www/html/*.php && chmod 755 /var/www/html/'
```

### Test Deployment
```bash
# Test white page
curl -I http://ttxgotime.xyz

# Test offer page
curl -I http://ttxgotime.xyz/offer-with-maxconv.html

# Test link generator
curl -I http://ttxgotime.xyz/vps-link-generator.html
```

## Troubleshooting

### Links Not Working
1. Check if files are uploaded correctly
2. Verify file permissions
3. Check cloaking script configuration
4. Test with whitelist IP

### MaxConv Not Redirecting
1. Check if maxconv-handler.js is loaded
2. Verify mobile detection
3. Check browser console for errors
4. Test with different mobile user agents

### Parameters Not Passing
1. Check URL parameters in browser
2. Verify MaxConv campaign URLs
3. Test with debug info on offer page
4. Check console logs

## Advanced Features

### Custom Offers
Add new offers by editing the MAXCONV_CAMPAIGNS object in maxconv-handler.js

### Custom Parameters
Add new parameters by modifying the parameter handling in maxconv-handler.js

### Analytics Integration
Add analytics tracking by modifying the MaxConv handler

## Security Notes

- All PHP errors are suppressed
- SSL verification is disabled for API calls
- Input validation is handled by the cloaking script
- File permissions are set to 644 for security

## Support

For issues with:
- **Cloaking**: Check Cloaking.House dashboard
- **MaxConv**: Check MaxConv campaign settings
- **VPS**: Check server logs and file permissions
- **DNS**: Check domain resolution and propagation
