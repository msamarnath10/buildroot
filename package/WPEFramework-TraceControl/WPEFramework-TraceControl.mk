WPEFRAMEWORK_TRACECONTROL_VERSION = 65b500c240d798407c5eb4a155924b7ab095a2ec
WPEFRAMEWORK_TRACECONTROL_SITE_METHOD = git
WPEFRAMEWORK_TRACECONTROL_SITE = git@github.com:Metrological/webbridge.git
WPEFRAMEWORK_TRACECONTROL_INSTALL_STAGING = YES
WPEFRAMEWORK_TRACECONTROL_DEPENDENCIES = WPEFramework

$(eval $(cmake-package))
