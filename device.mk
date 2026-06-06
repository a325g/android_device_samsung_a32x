#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_RAMDISK_COMPRESSION := lzma
LOCAL_PATH := device/samsung/a32x
PRODUCT_USE_DYNAMIC_PARTITIONS := true
INFINITY_BUILD_TYPE := UNOFFICIAL
WITH_GAPPS := true
# Define the path to your extracted blobs folder
LOCAL_BLOB_PATH := recovery/root/vendor

# Copy Binaries
PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_BLOB_PATH)/bin/hw/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/hw/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_BLOB_PATH)/bin/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/$(notdir $(f)))

# Copy Libraries (lib64 is critical for MTK)
PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_BLOB_PATH)/lib64/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_BLOB_PATH)/lib64/hw/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/$(notdir $(f)))

# Copy Configs (RC and XML)
PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_BLOB_PATH)/etc/init/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/init/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_BLOB_PATH)/etc/vintf/manifest/*),$(f):$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest/$(notdir $(f)))
