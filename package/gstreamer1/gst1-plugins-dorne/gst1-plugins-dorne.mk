################################################################################
#
# gst1-plugins-dorne
#
################################################################################

GST1_PLUGINS_DORNE_VERSION = b28c59868f3091b4e6e99b3fe2c2357643b77d77
GST1_PLUGINS_DORNE_SITE_METHOD = git
GST1_PLUGINS_DORNE_SITE = git@github.com:Metrological/gst-plugins-dorne.git

GST1_PLUGINS_DORNE_INSTALL_STAGING = YES
GST1_PLUGINS_DORNE_LICENSE_FILES = COPYING.LIB
GST1_PLUGINS_DORNE_LICENSE = LGPLv2+, LGPLv2.1+

GST1_PLUGINS_DORNE_AUTORECONF = YES
GST1_PLUGINS_DORNE_AUTORECONF_OPTS = -I $(@D)/common/m4
GST1_PLUGINS_DORNE_GETTEXTIZE = YES

GST1_PLUGINS_DORNE_POST_DOWNLOAD_HOOKS += GSTREAMER1_COMMON_DOWNLOAD
GST1_PLUGINS_DORNE_POST_EXTRACT_HOOKS += GSTREAMER1_COMMON_EXTRACT
GST1_PLUGINS_DORNE_PRE_CONFIGURE_HOOKS += GSTREAMER1_FIX_AUTOPOINT
GST1_PLUGINS_DORNE_POST_INSTALL_TARGET_HOOKS += GSTREAMER1_REMOVE_LA_FILES

GST1_PLUGINS_DORNE_DEPENDENCIES = gst1-common gstreamer1 gst1-plugins-base

$(eval $(autotools-package))
