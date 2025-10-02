// MaxConv Parameter Handler for VPS Cloaking Setup
// This script handles parameter passing from cloaking links to MaxConv campaigns

(function() {
    'use strict';
    
    // Get URL parameters
    function getURLParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }
    
    // Get slug from path
    function getSlugFromPath() {
        const path = window.location.pathname;
        const slug = path.replace(/^\/+|\/+$/g, '');
        return slug || '';
    }
    
    // Ensure ttclid parameter exists
    function ensureTTCLIDParam() {
        try {
            const u = new URL(window.location.href);
            if (!u.searchParams.has('ttclid')) {
                u.searchParams.set('ttclid', '');
                history.replaceState(null, '', u.toString());
                console.log('Ensured ttclid param on lander URL');
            }
        } catch(e) { 
            console.log('ttclid lander ensure error', e); 
        }
    }
    
    // MaxConv campaign URLs (from your Shopify setup)
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
    
    // Main function to handle MaxConv redirect
    function handleMaxConvRedirect() {
        // Get parameters from URL
        const source = getURLParameter('s');
        const offer = getURLParameter('o') || 'mvcash';
        const slug = getSlugFromPath();
        const ttclid = getURLParameter('ttclid');
        const campaign = getURLParameter('campaign');
        const adset = getURLParameter('adset');
        
        console.log('MaxConv Handler - Source:', source, 'Offer:', offer, 'Slug:', slug);
        
        // Get MaxConv campaign URL
        const campaignUrl = MAXCONV_CAMPAIGNS[offer.toLowerCase()] || MAXCONV_CAMPAIGNS['mvcash'];
        
        if (!campaignUrl) {
            console.error('No MaxConv campaign URL found for offer:', offer);
            return;
        }
        
        // Check if mobile (same logic as your Shopify setup)
        const isMobile = window.innerWidth <= 768 || /Mobi|Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
        
        if (isMobile && campaignUrl) {
            const finalURL = new URL(campaignUrl);
            
            // Add source parameter
            if (source) {
                finalURL.searchParams.set('s1', source);
                console.log('Adding s1 (source):', source);
            }
            
            // Add slug parameter
            if (slug) {
                finalURL.searchParams.set('s2', slug);
                console.log('Adding s2 (slug):', slug);
            }
            
            // Add ttclid parameter
            const ttclidVal = (ttclid !== null) ? ttclid : '';
            finalURL.searchParams.set('ttclid', ttclidVal);
            finalURL.searchParams.set('ct3', ttclidVal);
            console.log('Adding ttclid/ct3:', ttclidVal);
            
            // Add additional tracking parameters
            if (campaign) {
                finalURL.searchParams.set('campaign', campaign);
                console.log('Adding campaign:', campaign);
            }
            
            if (adset) {
                finalURL.searchParams.set('adset', adset);
                console.log('Adding adset:', adset);
            }
            
            // Add timestamp for uniqueness
            finalURL.searchParams.set('timestamp', Date.now());
            
            console.log('Redirecting to MaxConv:', finalURL.toString());
            
            // Redirect to MaxConv
            window.location.href = finalURL.toString();
            
        } else {
            console.log('Not mobile or no campaign URL, staying on page for desktop/bot traffic.');
            // For desktop/bot traffic, stay on the current page
            // The cloaking script will handle showing the appropriate content
        }
    }
    
    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            ensureTTCLIDParam();
            handleMaxConvRedirect();
        });
    } else {
        ensureTTCLIDParam();
        handleMaxConvRedirect();
    }
    
    // Export functions for external use
    window.MaxConvHandler = {
        getURLParameter: getURLParameter,
        getSlugFromPath: getSlugFromPath,
        handleMaxConvRedirect: handleMaxConvRedirect,
        MAXCONV_CAMPAIGNS: MAXCONV_CAMPAIGNS
    };
    
})();
