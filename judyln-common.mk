#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit some common PixelOS stuff.
$(call inherit-product, vendor/custom/config/common_full_phone.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_NAME := judyln

# common judy (sdm845)
$(call inherit-product, device/lge/sdm845-common/sdm845.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
#   $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_PACKAGES += \
    audio_amplifier.lge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.lineage

# Init
PRODUCT_COPY_FILES += \
    device/lge/sdm845-common/rootdir/etc/fstab.judy:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.judyln \
    device/lge/sdm845-common/rootdir/etc/fstab.judy:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.judyln

# DAC
PRODUCT_PACKAGES += \
    QuadDACPanel \
    vendor.lge.hardware.audio.dac.control@2.0-service

# Light
PRODUCT_PACKAGES += \
    android.hardware.light-service.lge

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    vendor.nxp.nxpese@1.0.vendor:64 \
    vendor.nxp.nxpnfc@1.0.vendor:64

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Privapp allowlist for QuadDACPanel (required to avoid system_server crash)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-quaddac.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-quaddac.xml

# Set support hide display cutout feature
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_hide_display_cutout=true

PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.lge

# Wi-Fi Overlay
PRODUCT_PACKAGES += \
    WifiOverlayG7

# Get non-open-source specific aspects
$(call inherit-product, vendor/lge/judyln-common/judyln-common-vendor.mk)
