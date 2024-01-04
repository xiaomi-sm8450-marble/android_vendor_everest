# Copyright (C) 2024 EverestOS
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

# Versioning System
EVEREST_CODENAME := SAGARMATHA
EVEREST_NUM_VER := 2.0

TARGET_PRODUCT_SHORT := $(subst everest_,,$(EVEREST_BUILD_TYPE))

EVEREST_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official  build
ifeq ($(filter-out OFFICIAL,$(EVEREST_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater

PRODUCT_COPY_FILES += \
    vendor/everest/prebuilt/common/etc/init/init.everest-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.everest-updater.rc
endif

# Sign builds if building an official build
ifeq ($(filter-out OFFICIAL,$(EVEREST_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
EVEREST_BUILD_VERSION := $(EVEREST_NUM_VER)-$(EVEREST_CODENAME)
EVEREST_VERSION := $(EVEREST_BUILD_VERSION)-$(EVEREST_BUILD)-$(EVEREST_BUILD_TYPE)-$(BUILD_TIME)-$(BUILD_DATE)
ROM_FINGERPRINT := everest/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
EVEREST_DISPLAY_VERSION := $(EVEREST_VERSION)
RELEASE_TYPE := $(EVEREST_BUILD_TYPE)

# EverestOS System Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.everest.base.codename=$(EVEREST_CODENAME) \
    ro.everest.base.version=$(EVEREST_NUM_VER) \
    ro.everest.build.version=$(EVEREST_BUILD_VERSION) \
    ro.everest.build.date=$(BUILD_DATE) \
    ro.everest.buildtype=$(EVEREST_BUILD_TYPE) \
    ro.everest.display.version=$(EVEREST_DISPLAY_VERSION) \
    ro.everest.fingerprint=$(ROM_FINGERPRINT) \
    ro.everest.version=$(EVEREST_VERSION) \
    ro.modversion=$(EVEREST_VERSION)
