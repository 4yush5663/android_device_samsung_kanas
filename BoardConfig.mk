USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/kanas/BoardConfigVendor.mk

#platform
TARGET_ARCH                    := arm
TARGET_BOARD_PLATFORM_GPU      := mali-400 MP
TARGET_BOARD_PLATFORM          := sc8830
TARGET_CPU_ABI                 := armeabi-v7a
TARGET_CPU_ABI2                := armeabi
TARGET_ARCH_VARIANT            := armv7-a-neon
TARGET_CPU_VARIANT             := cortex-a7
TARGET_CPU_SMP                 := true
ARCH_ARM_HAVE_TLS_REGISTER     := true

TARGET_BOOTLOADER_BOARD_NAME := SC7735S

#kernel
BOARD_KERNEL_CMDLINE           := console=ttyS1,115200n8 androidboot.selinux=permissive
BOARD_KERNEL_BASE              := 0x00000000
BOARD_KERNEL_PAGESIZE          := 2048
BOARD_VENDOR                   := samsung
TARGET_KERNEL_CONFIG := cyanogen_kanas_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/kanas

#Config u-boot

TARGET_NO_BOOTLOADER           := true
BOARD_BOOTIMAGE_PARTITION_SIZE      := 15728640
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 1195376640
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 2457862144
BOARD_CACHEIMAGE_PARTITION_SIZE     := 125829120
BOARD_FLASH_BLOCK_SIZE := 131072


BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Hardware rendering
TARGET_BOARD_PLATFORM_GPU := ARM Mali-400
BOARD_EGL_CFG := device/samsung/kanas/configs/egl.cfg
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
HWUI_COMPILE_FOR_PERF := true
USE_SPRD_HWCOMPOSER := true
USE_OPENGL_RENDERER := true
USE_OVERLAY_COMPOSER_GPU := true
DEVICE_FORCE_VIDEO_GO_OVERLAYCOMPOSER := true
COMMON_GLOBAL_CFLAGS += -DSC8830_HWC

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ device/samsung/kanas/cmhw/

# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH  := 480

# Audio
BOARD_USES_TINYALSA_AUDIO      := true
BOARD_USES_SS_VOIP             := true
BOARD_USE_LIBATCHANNEL_WRAPPER := true

# Board specific features
#BOARD_USE_VETH := true
#BOARD_SPRD_RIL := true
#BOARD_SAMSUNG_RIL := true
BOARD_USE_SAMSUNG_COLORFORMAT := true
BOARD_NEEDS_MEMORYHEAPION_SPRD := true
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_BCM                    := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kanas/bluetooth
BOARD_BLUEDROID_VENDOR_CONF                 := device/samsung/kanas/bluetooth/libbt_vndcfg.txt
#USE_BLUETOOTH_BCM4330 := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND                        := 802_11_ABG

# Wi-Fi Tethering
BOARD_HAVE_SAMSUNG_WIFI := true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/kanas/ril/
COMMON_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# Recovery
BOARD_HAS_DOWNLOAD_MODE      := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB        := device/samsung/kanas/ramdisk/recovery.fstab

# Assert
TARGET_OTA_ASSERT_DEVICE := kanas3gnfc,SM-G355H,kanas,kanas3g,SM-G355H,kanas3gnfcxx

# Use prebuilt webviewchromium to cut down build time
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# Enable dex-preoptimization to speed up the first boot sequence
WITH_DEXPREOPT := true


# Init
TARGET_NR_SVC_SUPP_GIDS := 48
