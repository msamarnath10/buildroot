################################################################################
#
# intelce-soc_audio
#
################################################################################
INTELCE_SOC_AUDIO_VERSION = ${INTEL_SDK_VERSION}
INTELCE_SOC_AUDIO_SITE = ${INTEL_SDK_DIR}/empty
INTELCE_SOC_AUDIO_SITE_METHOD = local
INTELCE_SOC_AUDIO_LICENSE = PROPRIETARY
INTELCE_SOC_AUDIO_REDISTRIBUTE = NO
INTELCE_SOC_AUDIO_DEPENDENCIES = intel-sdk intelce-osal intelce-common intelce-smd_tools intelce-sven linux intelce-core intelce-cosai intelce-SMD_Common intelce-api
INTELCE_SOC_AUDIO_INSTALL_STAGING = YES

INTELCE_SOC_AUDIO_BUILD_ENV = \
    BUILD_TARGET_DIR=${INTELCE_SOC_AUDIO_DIR} \
    BUILD_SMD_COMMOM=true BUILD_SMD_TOOLS=true  
    
define INTELCE_SOC_AUDIO_CONFIGURE_CMDS
   
endef

define INTELCE_SOC_AUDIO_BUILD_CMDS
    if [ -d "${INTELCE_SOC_AUDIO_DIR}/build_i686" ] ; then \
       rm -rf "${INTELCE_SOC_AUDIO_DIR}/build_i686"; \
    fi

    if [ -d "${INTELCE_SOC_AUDIO_DIR}/binaries" ] ; then \
       rm -rf "${INTELCE_SOC_AUDIO_DIR}/binaries" ; \
    fi
    
    if [ -d "${INTELCE_SOC_AUDIO_DIR}/project_build_i686" ] ; then \
       rm -rf "${INTELCE_SOC_AUDIO_DIR}/project_build_i686" ; \
    fi
    
    ${INTELCE_SOC_AUDIO_BUILD_ENV} ${INTELSDK-BUILD} soc_audio
endef

define INTELCE_SOC_AUDIO_INSTALL_STAGING_CMDS
    $(call INTEL_SDK_INSTALL_TO_STAGING,${INTELCE_SOC_AUDIO_DIR}/build_i686/staging_dir) 
endef

define INTELCE_SOC_AUDIO_INSTALL_TARGET_CMDS
    $(call INTEL_SDK_INSTALL_TO_TARGET,${INTELCE_SOC_AUDIO_DIR}/project_build_i686/IntelCE/root)
endef

$(eval $(generic-package))
