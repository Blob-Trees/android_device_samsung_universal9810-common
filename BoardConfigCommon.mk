# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2022 The LineageOS Project

COMMON_PATH := device/samsung/universal9810-common

# Apex
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH         := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI      := arm64-v8a
TARGET_CPU_ABI2     :=
TARGET_CPU_VARIANT  := cortex-a53

# Architecture Secondary
TARGET_2ND_ARCH         := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI      := armeabi-v7a
TARGET_2ND_CPU_ABI2     := armeabi
TARGET_2ND_CPU_VARIANT  := cortex-a53

# AR Core
TARGET_INCLUDE_STOCK_ARCORE := false

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG                      := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH_BCM                    := true

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4        := true
TARGET_USERIMAGES_USE_F2FS        := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_FS_CONFIG_GEN              := $(COMMON_PATH)/config.fs

# Fingerprint
TARGET_SEC_FP_HAS_FINGERPRINT_GESTURES := true

# Firmware
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Graphics
TARGET_USES_HWC2 := true
BACKLIGHT_PATH   := "/sys/class/backlight/panel/brightness"

# Hacks
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_DUP_SYSPROP                     := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Kernel
BOARD_CUSTOM_BOOTIMG           := true
BOARD_CUSTOM_BOOTIMG_MK        := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_IMAGE_NAME        := Image
BOARD_KERNEL_SEPARATED_DT      := true
BOARD_KERNEL_BASE              := 0x10000000
BOARD_KERNEL_PAGESIZE          := 2048
BOARD_MKBOOTIMG_ARGS           := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_CUSTOM_DTBTOOL          := dtbhtoolExynos
TARGET_KERNEL_ARCH             := arm64
TARGET_KERNEL_HEADER_ARCH      := arm64
TARGET_KERNEL_SOURCE           := kernel/samsung/universal9810
TARGET_KERNEL_CLANG_COMPILE    := true
TARGET_KERNEL_ADDITIONAL_FLAGS := HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"
TARGET_KERNEL_CLANG_VERSION    := r437112

# MACLOADER
BOARD_HAVE_SAMSUNG_WIFI := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 57671680
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 68149248
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4561305600
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE             := 131072

# Platform
BOARD_VENDOR                 := samsung
TARGET_BOARD_PLATFORM        := universal9810
TARGET_SOC                   := exynos9810
TARGET_BOOTLOADER_BOARD_NAME := universal9810

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Quick Tap
TARGET_SUPPORTS_QUICK_TAP := true

# Ramdisk
BOARD_ROOT_EXTRA_FOLDERS := efs

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_FSTAB        := $(COMMON_PATH)/rootdir/etc/fstab.samsungexynos9810
BOARD_HAS_DOWNLOAD_MODE      := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Samsung HALs
TARGET_POWERHAL_VARIANT := samsung

# Security
BOOT_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# SELinux
# include device/custom/sepolicy/exynos/sepolicy.mk
# BOARD_SEPOLICY_TEE_FLAVOR := mobicore

# SELinux SLSI
# include device/samsung_slsi/sepolicy/sepolicy.mk
# BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor

# Soong
BUILD_BROKEN_DUP_RULES := true

# Vendor
TARGET_COPY_OUT_VENDOR := vendor

# VINTF
DEVICE_MANIFEST_FILE           := $(COMMON_PATH)/configs/vintf/manifest.xml
DEVICE_MATRIX_FILE             := $(COMMON_PATH)/configs/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(COMMON_PATH)/configs/vintf/framework_manifest.xml

# VNDK
BOARD_VNDK_VERSION          := current

# Wifi
TARGET_USES_64_BIT_BCMDHD                     := true
BOARD_WLAN_DEVICE                             := bcmdhd
WPA_SUPPLICANT_VERSION                        := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER                   := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB              := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_USE_HIDL                       := true
BOARD_HOSTAPD_DRIVER                          := NL80211
BOARD_HOSTAPD_PRIVATE_LIB                     := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM                     := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_NVRAM_PATH_PARAM                  := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH                        := "/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_STA                       := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP                        := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                                     := 802_11_ABG
WIFI_AVOID_IFACE_RESET_MAC_CHANGE             := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE              := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
PRODUCT_CFI_INCLUDE_PATHS                     += hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib

# Inherit from the proprietary version
include vendor/samsung/universal9810-common/BoardConfigVendor.mk
