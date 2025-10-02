# Cloaking Script Test Setup

This repository contains a test setup for the PHP cloaking script from Cloaking.House.

## Files

- `index.php` - Main cloaking script that handles traffic filtering
- `index.html` - White page that displays for non-targeted traffic
- `README.md` - This documentation file

## Setup Instructions

### Prerequisites

Your hosting must meet these requirements:
- PHP version 7.2 or higher
- cURL extension enabled
- mbstring extension enabled
- OpenSSL extension enabled
- JSON extension enabled
- Filter extension enabled
- `allow_url_fopen` setting enabled in php.ini

### Installation

1. **Upload files to your hosting:**
   - Upload `index.php` to your website's root directory
   - Upload `index.html` to the same directory

2. **Configure your cloaking flow:**
   - Set up your flow in the Cloaking.House dashboard
   - Configure the white page URL to point to your `index.html`
   - Configure the offer page URL to point to your actual landing page

3. **Test the setup:**
   - Access your website from a targeted (allowed) GEO to see the offer page
   - Access from a non-targeted GEO to see the white page

## How It Works

The cloaking script (`index.php`) works as follows:

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

## White Page Features

The included white page (`index.html`) features:
- Modern, responsive design
- Clean, professional appearance
- Real-time clock display
- Mobile-friendly layout
- Subtle animations and effects

## Security Notes

- The cloaking script includes comprehensive error handling
- All PHP errors are suppressed for security
- SSL verification is disabled for API calls (as per script requirements)
- The script validates all inputs and handles edge cases

## Troubleshooting

### Common Issues

1. **"PHP 7.2 or higher is required"**
   - Upgrade your PHP version to 7.2 or higher

2. **"The cURL PHP extension is required"**
   - Contact your hosting provider to enable cURL

3. **"The mbstring PHP extension is required"**
   - Contact your hosting provider to enable mbstring

4. **"Your Subscription Expired"**
   - Check your Cloaking.House subscription status

5. **"Flow Deleted" or "Flow Banned"**
   - Check your flow configuration in the dashboard

### Testing

To test if the setup is working:

1. **From a targeted GEO:** You should see your offer page
2. **From a non-targeted GEO:** You should see the white page
3. **From a bot/crawler:** You should see the white page

## Support

For issues with the cloaking script itself, contact Cloaking.House support.

For hosting-related issues, contact your hosting provider.

## License

This test setup is provided for educational and testing purposes. The cloaking script is proprietary to Cloaking.House.
