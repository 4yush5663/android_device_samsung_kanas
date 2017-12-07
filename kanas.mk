#
# Copyright (C) 2016 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/kanas

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay


# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from vendor tree
$(call inherit-product-if-exists, vendor/samsung/kanas/kanas-vendor.mk)

# Inherit from scx35-common device configuration
$(call inherit-product, device/samsung/scx35-common/common.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/ist30xx_ts_input.kl:system/usr/keylayout/ist30xx_ts_input.kl \
	$(LOCAL_PATH)/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
	$(LOCAL_PATH)/keylayout/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Media
PRODUCT_PACKAGES += \
	media_profiles.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/mediaserver.rc:system/etc/init/mediaserver.rc

# Audio
PRODUCT_PACKAGES += \
	audio_hw.xml \
	audio_para \
	audio_effects_vendor.conf \
	audio_policy.conf \
	codec_pga.xml \
	tiny_hw.xml \
	audio.primary.sc8830 \
	libaudio-resampler
	
# Rootdir files
PRODUCT_PACKAGES += \
	init.sc8830.rc \
	init.sc8830.usb.rc \
	init.kanas3g_base.rc \
	ueventd.sc8830.rc

# RIL
PRODUCT_PACKAGES += \
	rild.rc


# Bluetooth
PRODUCT_PACKAGES += \
	bt_vendor.conf \
	libbluetooth_jni \
	bluetooth.default

# GPS
PRODUCT_PACKAGES += \
	gps.xml \

# WiFi
PRODUCT_PACKAGES += \
        macloader
	wpa_supplicant.conf \
	nvram_net.txt \
	nvram_mfg.txt

	
# Rootdir
PRODUCT_PACKAGES += \
	fstab.sc8830

# Media
PRODUCT_PACKAGES += \
	media_codecs.xml

# Media config
MEDIA_XML_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_XML_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Permissions
PERMISSIONS_XML_FILES := \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.software.midi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSIONS_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))
	
# HWC
PRODUCT_PACKAGES += \
	libHWCUtils \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	libmemoryheapion \
	libion_sprd
	
# Codecs
PRODUCT_PACKAGES += \
        libstagefrighthw \
	libcolorformat_switcher \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec
	
# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	librilutils \
	libril_shim \
	libgps_shim

# System init.rc files
PRODUCT_PACKAGES += \
	at_distributor.rc \
	chown_service.rc \
	data.rc \
	dns.rc \
	engpc.rc \
	gpsd.rc \
	hostapd.rc \
	kill_phone.rc \
	macloader.rc \
	mediacodec.rc \
	modem_control.rc \
	modemd.rc \
	nvitemd.rc \
	p2p_supplicant.rc \
	phoneserver.rc \
	refnotify.rc \
	set_mac.rc \
	smd_symlink.rc \
	swap.rc \
	wpa_supplicant.rc \

# Rootdir files
PRODUCT_PACKAGES += \
	init.board.rc \
	init.wifi.rc
	
# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# PowerHAL
PRODUCT_PACKAGES += \
	power.sc8830

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Disable mobile data on first boot
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.mobiledata=false

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1


# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1


# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# WiFi
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)


