################################################################################
#
# intelce-idl
#
################################################################################
INTELCE_IDL_VERSION = ${INTEL_SDK_VERSION}
INTELCE_IDL_SITE = ${INTEL_SDK_DIR}/empty
INTELCE_IDL_SITE_METHOD = local
INTELCE_IDL_LICENSE = PROPRIETARY
INTELCE_IDL_REDISTRIBUTE = NO
INTELCE_IDL_DEPENDENCIES = intel-sdk linux intelce-osal intelce-pal intelce-gpio
INTELCE_IDL_INSTALL_STAGING = YES

INTELCE_IDL_BUILD_ENV = \
    BUILD_TARGET_DIR=${INTELCE_IDL_DIR} \
    BUILD_SMD_COMMOM=false 
    
define INTELCE_IDL_CONFIGURE_CMDS
   
endef

define INTELCE_IDL_BUILD_CMDS
    if [ -d "${INTELCE_IDL_DIR}/build_i686" ] ; then \
       rm -rf "${INTELCE_IDL_DIR}/build_i686"; \
    fi

    if [ -d "${INTELCE_IDL_DIR}/binaries" ] ; then \
       rm -rf "${INTELCE_IDL_DIR}/binaries" ; \
    fi
    
    if [ -d "${INTELCE_IDL_DIR}/project_build_i686" ] ; then \
       rm -rf "${INTELCE_IDL_DIR}/project_build_i686" ; \
    fi
    
    ${INTELCE_IDL_BUILD_ENV} ${INTELSDK-BUILD} idl
endef

define INTELCE_IDL_INSTALL_STAGING_CMDS
    $(call INTEL_SDK_INSTALL_TO_STAGING,${INTELCE_IDL_DIR}/build_i686/staging_dir) 
endef

define INTELCE_IDL_INSTALL_TARGET_CMDS
    $(call INTEL_SDK_INSTALL_TO_TARGET,${INTELCE_IDL_DIR}/project_build_i686/IntelCE/root)
endef

$(eval $(generic-package))
