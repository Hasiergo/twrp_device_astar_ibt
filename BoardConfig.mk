# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

include device/softwinner/astar-common/BoardConfigCommon.mk

# image related
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

# Enable dex-preoptimization to speed up first boot sequence
WITH_DEXPREOPT := true
#DONT_DEXPREOPT_PREBUILTS := true

INSTALLED_KERNEL_TARGET := kernel
BOARD_KERNEL_CMDLINE := 
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368

# recovery stuff
#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_astar_ibt
#SW_BOARD_TOUCH_RECOVERY := true

# wifi and bt configuration
# 1. Wifi Configuration
# 1.1 realtek wifi support
# 1.1  realtek wifi configuration
# BOARD_USR_WIFI: rtl8188eu/rtl8723bs/rtl8723bs_vq0/rtl8723cs
BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl
    ifeq ($(RTL_8723CS), Y)
 	BOARD_USR_WIFI := rtl8723cs
    else
        BOARD_USR_WIFI := rtl8723bs_vq0
    endif
    include hardware/realtek/wlan/config/config.mk
endif

# 1.2 Wifi Configuration
# BOARD_USR_WIFI:ap6181/ap6210/ap6212/ap6330/ap6335
#BOARD_WIFI_VENDOR := broadcom
ifeq ($(BOARD_WIFI_VENDOR), broadcom)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION      := VER_0_8_X
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
    BOARD_WLAN_DEVICE           := bcmdhd
    WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"

    BOARD_USR_WIFI := ap6476
    include hardware/broadcom/wlan/bcmdhd/firmware/$(BOARD_USR_WIFI)/device-bcm.mk

endif


# 2. Bluetooth Configuration
# make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
# BOARD_HAVE_BLUETOOTH_NAME:rtl8723bs/rtl8723bs_vq0/rtl8723cs/ap6210/ap6212/ap6330/ap6335/
BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_HAVE_BLUETOOTH_NAME := ap6476
BOARD_HAVE_BLUETOOTH_RTK := true
ifeq ($(RTL_8723CS), Y)
BOARD_HAVE_BLUETOOTH_NAME := rtl8723cs
else
BOARD_HAVE_BLUETOOTH_NAME := rtl8723bs_vq0
endif
BOARD_HAVE_BLUETOOTH_RTK_COEX := true
BLUETOOTH_HCI_USE_RTK_H5 := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/softwinner/astar-ibt/bluetooth
TARGET_USE_BOOSTUP_OPZ := true
