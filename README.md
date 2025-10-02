# Cloaking Script Test Setup

This repository contains a complete test setup for the PHP cloaking script from Cloaking.House, following the exact setup instructions from the video tutorial.

## Files Structure

- `index.php` - **Main cloaking script** (downloaded from Cloaking.House dashboard)
- `site.html` - **White page** (renamed from index.html to avoid conflicts)
- `offer.html` - **Test offer page** (example of what targeted users will see)
- `README.md` - This documentation file

## Setup Instructions (Following Video Tutorial)

### Prerequisites

Your hosting must meet these requirements:
- PHP version 7.4 or higher (as mentioned in video)
- cURL extension enabled
- mbstring extension enabled
- OpenSSL extension enabled
- JSON extension enabled
- Filter extension enabled
- `allow_url_fopen` setting enabled in php.ini

### Step-by-Step Installation

1. **Upload White Page to Hosting:**
   - Upload `site.html` to your hosting root directory
   - Test by visiting your domain to ensure the white page loads correctly

2. **Rename Files (CRITICAL STEP):**
   - Rename your original `index.html` or `index.php` to `site.html` or `site.php`
   - This prevents conflicts when adding the cloaking script

3. **Download Cloaking Script:**
   - Go to your Cloaking.House dashboard
   - Create a new flow
   - Download the integration file (this is your `index.php`)

4. **Upload Cloaking Script:**
   - Upload the downloaded `index.php` to your hosting root directory
   - Make sure both files are in the same directory

5. **Configure Cloaking Flow:**
   - **White Page Tab:** Set to `site.html` and choose "load" method
   - **Offer Page Tab:** Set to your affiliate link or `offer.html` for testing
   - **Filtering:** Configure your target countries, devices, etc.
   - **Status:** Set to active when ready

6. **Test the Setup:**
   - Visit your domain - you should see the white page (you're filtered out)
   - Add your IP to the whitelist in the flow settings
   - Visit again - you should see the offer page

## How It Works (From Video)

The cloaking script (`index.php`) works exactly as described in the video:

1. **Traffic Analysis:** Collects visitor data including:
   - IP address
   - User agent
   - Referer
   - Query string
   - Browser language

2. **API Check:** Sends this data to Cloaking.House API for analysis

3. **Traffic Routing:** Based on the API response:
   - **Targeted traffic** → Shows the offer page
   - **Non-targeted traffic** → Shows the white page
   - **Bot traffic** → Shows the white page

## File Structure Explanation

- **`index.php`** - This is the main cloaking script downloaded from Cloaking.House dashboard
- **`site.html`** - This is your white page (renamed to avoid conflicts)
- **`offer.html`** - This is a test offer page to see what targeted users will see

## White Page Features (`site.html`)

The included white page features:
- Modern, responsive design
- Clean, professional appearance
- Real-time clock display
- Mobile-friendly layout
- Subtle animations and effects

## Offer Page Features (`offer.html`)

The test offer page includes:
- High-converting design with urgency elements
- Countdown timer
- Call-to-action buttons
- Feature highlights
- Mobile-responsive layout

## Security Notes

- The cloaking script includes comprehensive error handling
- All PHP errors are suppressed for security
- SSL verification is disabled for API calls (as per script requirements)
- The script validates all inputs and handles edge cases

## Troubleshooting (From Video)

### Common Issues

1. **"PHP 7.2 or higher is required"**
   - Upgrade your PHP version to 7.4 or higher (as mentioned in video)

2. **"The cURL PHP extension is required"**
   - Contact your hosting provider to enable cURL

3. **"The mbstring PHP extension is required"**
   - Contact your hosting provider to enable mbstring

4. **"Your Subscription Expired"**
   - Check your Cloaking.House subscription status

5. **"Flow Deleted" or "Flow Banned"**
   - Check your flow configuration in the dashboard

### Testing (Following Video Instructions)

To test if the setup is working exactly as shown in the video:

1. **First Test (You should see white page):**
   - Visit your domain
   - You should see the white page (you're filtered out)
   - This means cloaking is working correctly

2. **Second Test (Add your IP to whitelist):**
   - Go to your Cloaking.House flow settings
   - Add your IP address to the "White IPs" field
   - Save the settings
   - Visit your domain again
   - You should now see the offer page (bypassing all filters)

3. **Check Filter Logs:**
   - Go to the "Clicks" tab in your flow
   - Check the "Filter" column to see which filter was triggered
   - This helps you understand why you were redirected to the white page

## Support

For issues with the cloaking script itself, contact Cloaking.House support.

For hosting-related issues, contact your hosting provider.

## License

This test setup is provided for educational and testing purposes. The cloaking script is proprietary to Cloaking.House.
