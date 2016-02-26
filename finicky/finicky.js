finicky.setDefaultBrowser('com.apple.Safari')

// Open Spotify links in client
finicky.onUrl(function(url, opts) {
    if (url.match(/^https?:\/\/open\.spotify\.com/)) {
        return {
            bundleIdentifier: 'com.spotify.client'
        }
    }
});

// Open Twitter links in client
finicky.onUrl(function(url, opts) {
    var matches = url.match(/^https?:\/\/twitter\.com\/.+\/status\/([0-9]+)/)
    if (matches && matches[1]) {
        var statusId = matches[1];
        return {
            url: 'twitter://status?id=' + statusId,
            bundleIdentifier: 'com.twitter.twitter-mac'
        }
    }
});
