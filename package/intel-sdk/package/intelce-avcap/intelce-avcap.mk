################################################################################
#
# intelce-avcap
#
################################################################################
INTELCE_AVCAP_VERSION = ${INTEL_SDK_VERSION}
INTELCE_AVCAP_SITE = ${INTEL_SDK_DIR}/empty
INTELCE_AVCAP_SITE_METHOD = local
INTELCE_AVCAP_LICENSE = PROPRIETARY
INTELCE_AVCAP_REDISTRIBUTE = NO
INTELCE_AVCAP_DEPENDENCIES = intel-sdk linux intelce-osal intelce-idl intelce-core intelce-platform_config intelce-display intelce-intel_ce_pm intelce-sven intelce-clock_control intelce-system_utils intelce-iosf
INTELCE_AVCAP_INSTALL_STAGING = YES

INTELCE_AVCAP_BUILD_ENV = \
    BUILD_TARGET_DIR=${INTELCE_AVCAP_DIR} \
    BUILD_SMD_COMMOM=false 
    
define INTELCE_AVCAP_CONFIGURE_CMDS
   
endef

define INTELCE_AVCAP_BUILD_CMDS
    if [ -d "${INTELCE_AVCAP_DIR}/build_i686" ] ; then \
       rm -rf "${INTELCE_AVCAP_DIR}/build_i686"; \
    fi

    if [ -d "${INTELCE_AVCAP_DIR}/binaries" ] ; then \
       rm -rf "${INTELCE_AVCAP_DIR}/binaries" ; \
    fi
    
    if [ -d "${INTELCE_AVCAP_DIR}/project_build_i686" ] ; then \
       rm -rf "${INTELCE_AVCAP_DIR}/project_build_i686" ; \
    fi
    
    ${INTELCE_AVCAP_BUILD_ENV} ${INTELSDK-BUILD} avcap
endef

define INTELCE_AVCAP_INSTALL_STAGING_CMDS
    $(call INTEL_SDK_INSTALL_TO_STAGING,${INTELCE_AVCAP_DIR}/build_i686/staging_dir) 
endef

define INTELCE_AVCAP_INSTALL_TARGET_CMDS
    $(call INTEL_SDK_INSTALL_TO_TARGET,${INTELCE_AVCAP_DIR}/project_build_i686/IntelCE/root)
endef

$(eval $(generic-package))
