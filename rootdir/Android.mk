LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE		    := fstab.samsungexynos9810
LOCAL_MODULE_TAGS	    := optional
LOCAL_MODULE_CLASS	    := ETC
LOCAL_SRC_FILES		    := etc/fstab.samsungexynos9810
LOCAL_MODULE_PATH	    := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := fstab.zram
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/fstab.zram
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.samsung.rc
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/init.samsung.rc
LOCAL_MODULE_PATH       := $(TARGET_OUT_ETC)/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.usb_accessory.rc
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/init.usb_accessory.rc
LOCAL_MODULE_PATH       := $(TARGET_OUT_ETC)/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := wifi_sec.rc
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/$(LOCAL_MODULE)
LOCAL_MODULE_PATH       := $(TARGET_OUT_VENDOR_ETC)/init
include $(BUILD_PREBUILT)

# Saifailnet
include $(CLEAR_VARS)
LOCAL_MODULE            := init.safailnet.rc
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/init.safailnet.rc
LOCAL_MODULE_PATH       := $(TARGET_OUT_VENDOR_ETC)/init/hw
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := init.baseband.rc
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := etc/init.baseband.rc
LOCAL_MODULE_PATH       := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		    := init.samsung.rc
LOCAL_MODULE_TAGS	    := optional
LOCAL_MODULE_CLASS	    := ETC
LOCAL_SRC_FILES		    := etc/init.samsung.rc
LOCAL_MODULE_PATH	    := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		    := init.samsungexynos9810.rc
LOCAL_MODULE_TAGS	    := optional
LOCAL_MODULE_CLASS	    := ETC
LOCAL_SRC_FILES		    := etc/init.samsungexynos9810.rc
LOCAL_MODULE_PATH	    := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		    := init.samsungexynos9810.usb.rc
LOCAL_MODULE_TAGS	    := optional
LOCAL_MODULE_CLASS	    := ETC
LOCAL_SRC_FILES		    := etc/init.samsungexynos9810.usb.rc
LOCAL_MODULE_PATH	    := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		    := mobicore.rc
LOCAL_MODULE_TAGS	    := optional
LOCAL_MODULE_CLASS	    := ETC
LOCAL_SRC_FILES		    := etc/mobicore.rc
LOCAL_MODULE_PATH	    := $(TARGET_OUT_VENDOR_ETC)/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		    := ueventd.samsungexynos9810.rc
LOCAL_MODULE_TAGS	    := optional
LOCAL_MODULE_CLASS	    := ETC
LOCAL_SRC_FILES		    := etc/ueventd.samsungexynos9810.rc
LOCAL_MODULE_PATH	    := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
