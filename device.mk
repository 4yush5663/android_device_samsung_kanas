# Copyright (C) 2014 The CyanogenMod Project
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/kanas/kanas-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Rootdir files
ROOTDIR_FILES := \
	$(LOCAL_PATH)/ramdisk/file_contexts \
	$(LOCAL_PATH)/ramdisk/fstab.goldfish \
	$(LOCAL_PATH)/ramdisk/init.environ.rc \
	$(LOCAL_PATH)/ramdisk/init.goldfish.rc \
	$(LOCAL_PATH)/ramdisk/init.trace.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.rc \
	$(LOCAL_PATH)/ramdisk/property_contexts \
	$(LOCAL_PATH)/ramdisk/seapp_contexts \
	$(LOCAL_PATH)/ramdisk/sepolicy \
	$(LOCAL_PATH)/ramdisk/ueventd.goldfish.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rc \
	$(LOCAL_PATH)/ramdisk/init.rc \
	$(LOCAL_PATH)/ramdisk/init.board.rc \
	$(LOCAL_PATH)/ramdisk/init.sc8830.rc \
	$(LOCAL_PATH)/ramdisk/init.sc8830.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.sc8830_ss.rc \
	$(LOCAL_PATH)/ramdisk/init.kanas3g.rc \
	$(LOCAL_PATH)/ramdisk/init.kanas3g_base.rc \
	$(LOCAL_PATH)/ramdisk/init.wifi.rc \
        $(LOCAL_PATH)/ramdisk/init.recovery.sc8830.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.sc8830.rc \
	$(LOCAL_PATH)/ramdisk/fstab.sc8830

PRODUCT_COPY_FILES += \
	$(foreach f,$(ROOTDIR_FILES),$(f):root/$(notdir $(f)))

# Override phone-hdpi-512-dalvik-heap to match value on stock
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=64m

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1


# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# Use prebuilt webviewchromium
$(call inherit-product, $(LOCAL_PATH)/prebuilt/chromium/chromium_prebuilt.mk)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kanas
PRODUCT_DEVICE := kanas
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G360H
