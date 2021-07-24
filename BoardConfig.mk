#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := device/softwinner/astar_ibt

USE_CAMERA_STUB := false

# Target Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := astar
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
#ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := exdroid

# Build fails without this
ALLOW_MISSING_DEPENDENCIES := true

# CFLAGS
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Kernel
BOARD_KERNEL_CMDLINE := boot_type=0 disp_para=100 fb_base=0x0 config_size=40208 androidboot.serialno=86449ac896a700000000 androidboot.hardware=sun8i console=ttyS0,115200 root=/dev/nandd init=/init ion_cma_list=120m,256m loglevel=4 partitions=bootloader@nanda:env@nandb:boot@nandc:system@nandd:misc@nande:recovery@nandf:cache@nandg:metadata@nandh:private@nandi:alog@nandj:UDISK@nandk
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

# Memory
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368

# BOARD_CUSTOM_RECOVERY_KEYMAPPING := $(LOCAL_PATH)/recovery_keys.c

BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_NTFS_3G := true
BOARD_TOUCH_RECOVERY := true

# TWRP recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TW_THEME := landscape_hdpi
TW_NO_REBOOT_BOOTLOADER := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/extsd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "extsd"
#TW_DEFAULT_EXTERNAL_STORAGE := true
#RECOVERY_SDCARD_ON_DATA := true
TWHAVE_SELINUX := true
BOARD_UMS_LUNFILE := /sys/devices/platform/sunxi_usb_udc/gadget/lun0/file
BOARD_UMS_2ND_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun1/file"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/twrp.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
TW_BRIGHTNESS_PATH := /sys/devices/virtual/disp/disp/attr/lcdbl
TW_MAX_BRIGHTNESS := 255
TW_EXCLUDE_SUPERSU := true
TW_ALWAYS_RMRF := true
#TW_NEVER_UNMOUNT_SYSTEM := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true


# Device Specific sepolicy
BOARD_SEPOLICY_DIRS := \
       device/softwinner/astar_ibt/sepolicy

BOARD_SEPOLICY_UNION := \
       module.te \

