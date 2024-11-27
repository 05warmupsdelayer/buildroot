################################################################################
#
# pcsx-rearmed
#
################################################################################

PCSX_REARMED_VERSION = 4373e29de72c917dbcd04ec2a5fb685e69d9def3
PCSX_REARMED_SITE = https://github.com/libretro/pcsx_rearmed.git
PCSX_REARMED_SITE_METHOD = git
PCSX_REARMED_LICENSE = GPL-2.0
PCSX_REARMED_LICENSE_FILES = COPYING
PCSX_REARMED_MAKE_OPTS += \
	CROSS_COMPILE=$(TARGET_CROSS) \
	CC=$(TARGET_CROSS)gcc \
	CXX=$(TARGET_CROSS)g++

# Optimizations and settings for ARM architecture
CFLAGS += -marm -mtune=cortex-a9 -mfloat-abi=hard -march=armv7-a -fomit-frame-pointer
CFLAGS += -ffast-math -fdata-sections -ffunction-sections -fsingle-precision-constant -flto -fPIC
LDFLAGS += -flto -fPIC

# Define the CPU architecture and optimization flags
CPU_ARCH := arm
OPTIMIZE += -Ofast -DNDEBUG=1

# Make sure to explicitly disable NEON optimizations
PCSX_REARMED_MAKE_OPTS += DYNAREC=ari64 HAVE_NEON=0 HAVE_NEON_ASM=0

define PCSX_REARMED_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_ARGS) $(MAKE) -C $(@D) -f Makefile.libretro $(PCSX_REARMED_MAKE_OPTS)
endef

define PCSX_REARMED_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/root/.config/retroarch/cores
	wget -O $(TARGET_DIR)/root/.config/retroarch/cores/pcsx_rearmed_libretro.info https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/pcsx_rearmed_libretro.info
	$(INSTALL) -m 0755 -D $(@D)/pcsx_rearmed_libretro.so $(TARGET_DIR)/root/.config/retroarch/cores/
endef

$(eval $(generic-package))
