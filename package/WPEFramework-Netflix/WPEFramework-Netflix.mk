WPEFRAMEWORK_NETFLIX_VERSION = 42ac5aa4196a4de2cd06d1d703c726d64869cb92
WPEFRAMEWORK_NETFLIX_SITE_METHOD = git
WPEFRAMEWORK_NETFLIX_SITE = git@github.com:Metrological/webbridge.git
WPEFRAMEWORK_NETFLIX_INSTALL_STAGING = YES
WPEFRAMEWORK_NETFLIX_DEPENDENCIES = WPEFramework

$(eval $(cmake-package))
