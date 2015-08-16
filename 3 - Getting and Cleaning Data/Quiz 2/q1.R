library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "dd885ef8465ce67af39d",
                   secret = "02544ece12e03dbeaf130fca485aba4412c0351f")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API


# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
repocontent <- content(req)

repocontent <- fromJSON(toJSON(repocontent))repocontent <- fromJSON(toJSON(repocontent))
date <- repocontent[6,"created_at"]