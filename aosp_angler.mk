#
# Copyright 2015 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
#PRODUCT_COPY_FILES := device/huawei/angler/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_NAME := aosp_angler
PRODUCT_DEVICE := angler
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on angler
PRODUCT_MANUFACTURER := Huawei
PRODUCT_RESTRICT_VENDOR_FILES := false

#PRODUCT_COPY_FILES += device/huawei/angler/fstab.aosp_angler:root/fstab.angler

$(call inherit-product, device/huawei/angler/device.mk)
$(call inherit-product-if-exists, vendor/huawei/angler/angler-vendor.mk)
$(call inherit-product, vendor/aosp/common.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_PACKAGES += \
    AOSPLinks

# Override build properties.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:7.1.2/N2G47W/3938523:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 7.1.2 N2G47W 3938523 release-keys"
