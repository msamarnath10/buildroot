################################################################################
#
# intelce-flash_encryption_signing_tools
#
################################################################################
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_VERSION = ${INTEL_SDK_VERSION}
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_SITE = ${INTEL_SDK_DIR}/empty
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_SITE_METHOD = local
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_LICENSE = PROPRIETARY
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_REDISTRIBUTE = NO
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DEPENDENCIES = intel-sdk openssl
INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_INSTALL_STAGING = YES

INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_BUILD_ENV = \
    BUILD_TARGET_DIR=${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR} \
    BUILD_SMD_COMMOM=false 
    
define INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_CONFIGURE_CMDS
   
endef

define INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_BUILD_CMDS
    if [ -d "${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/build_i686" ] ; then \
       rm -rf "${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/build_i686"; \
    fi

    if [ -d "${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/binaries" ] ; then \
       rm -rf "${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/binaries" ; \
    fi
    
    if [ -d "${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/project_build_i686" ] ; then \
       rm -rf "${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/project_build_i686" ; \
    fi
    
    ${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_BUILD_ENV} ${INTELSDK-BUILD} flash_encryption_signing_tools
endef

define INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_INSTALL_STAGING_CMDS
    $(call INTEL_SDK_INSTALL_TO_STAGING,${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/build_i686/staging_dir) 
endef

define INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_INSTALL_TARGET_CMDS
    $(call INTEL_SDK_INSTALL_TO_TARGET,${INTELCE_FLASH_ENCRYPTION_SIGNING_TOOLS_DIR}/project_build_i686/IntelCE/root)
endef

$(eval $(generic-package))
