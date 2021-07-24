LOCAL_PATH := device/softwinner/astar_ibt

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk) 

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/disp.ko:root/disp.ko \
    $(LOCAL_PATH)/rootdir/fstab.sun8i:root/fstab.sun8i \
    $(LOCAL_PATH)/rootdir/gslX680new.ko:root/gslX680new.ko \
    $(LOCAL_PATH)/rootdir/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc \
    $(LOCAL_PATH)/rootdir/lcd.ko:root/lcd.ko \
    $(LOCAL_PATH)/rootdir/nand.ko:root/nand.ko \
    $(LOCAL_PATH)/rootdir/sunxi-keyboard.ko:root/sunxi-keyboard.ko \
    $(LOCAL_PATH)/rootdir/sw-device.ko:root/sw-device.ko \
    $(LOCAL_PATH)/rootdir/ueventd.sun8i.rc:root/ueventd.sun8i.rc







