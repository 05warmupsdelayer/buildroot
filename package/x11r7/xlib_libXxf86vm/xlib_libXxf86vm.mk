################################################################################
#
# xlib_libXxf86vm
#
################################################################################

# Version of libXxf86vm
XLIB_LIBXXF86VM_VERSION = 1.1.5

# Source URL and tarball
XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.xz
XLIB_LIBXXF86VM_SITE = https://xorg.freedesktop.org/archive/individual/lib

# License and license files
XLIB_LIBXXF86VM_LICENSE = MIT
XLIB_LIBXXF86VM_LICENSE_FILES = COPYING

# CPE (Common Platform Enumeration) ID for the package
XLIB_LIBXXF86VM_CPE_ID_VENDOR = x
XLIB_LIBXXF86VM_CPE_ID_PRODUCT = libxxf86vm

# Set install target to staging
XLIB_LIBXXF86VM_INSTALL_STAGING = YES

# Dependencies for libXxf86vm
XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xorgproto

# Configuration options for the build
XLIB_LIBXXF86VM_CONF_OPTS = --disable-malloc0returnsnull

# Use autotools for the build process
$(eval $(autotools-package))

# Optional: Add custom patches or modifications if necessary
# If you need to apply patches, you can define them here
# XLIB_LIBXXF86VM_PATCHES = path/to/your/patch.diff

# Additional build options, for example, if you need to modify CFLAGS
# XLIB_LIBXXF86VM_CFLAGS += -DDEFINE_FOR_CUSTOM_BUILD
