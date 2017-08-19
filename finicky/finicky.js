finicky.setDefaultBrowser('com.apple.Safari')

// Open Spotify links in client
finicky.onUrl(function(url, opts) {
    if (url.match(/^https?:\/\/open\.spotify\.com/)) {
        return {
            bundleIdentifier: 'com.spotify.client'
        }
    }
});

finicky.onUrl(function(url, opts) {
	if (url.match(/^https?:\/\/reddit\.com/)) {
		return {
			bundleIdentifier: 'com.google.Chrome'
		}
	}
});