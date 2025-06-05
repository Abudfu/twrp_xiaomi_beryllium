#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# OrangeFox settings
OF_HIDE_NOTCH := 1
OF_USE_GREEN_LED := 0
OF_FLASHLIGHT_ENABLE := 1
OF_ALLOW_DISABLE_NAVBAR := 0
OF_QUICK_BACKUP_LIST := /data;/boot;
OF_SKIP_MULTIUSER_FOLDERS_BACKUP := 1
OF_ENABLE_USB_STORAGE := 1
OF_IGNORE_LOGICAL_MOUNT_ERRORS := 1
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1
OF_FORCE_CASEFOLDING := 1
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
OF_RECOVERY_AB_FULL_REFLASH_RAMDISK := 1

# screen settings
OF_SCREEN_H := 2246
OF_STATUS_H := 80
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1

ifeq ($(PRODUCT_RELEASE_NAME),polaris)
  OF_STATUS_INDENT_LEFT := 48
  OF_SCREEN_H := 2160
  OF_OPTIONS_LIST_NUM := 6
else
  OF_OPTIONS_LIST_NUM := 8
endif

# Recovery additional features	
OF_ENABLE_ALL_PARTITION_TOOLS := 1

OF_DISABLE_OTA_MENU := 1

# OTA
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# patch avb20 - some ROM recoveries try to overwrite custom recoveries
OF_PATCH_AVB20 := 1

# MIUI OTA
OF_DISABLE_MIUI_OTA_BY_DEFAULT := 1

# delta OTA for custom ROMs
OF_SUPPORT_ALL_BLOCK_OTA_UPDATES := 1
OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR := 1

# try to deal with MTP issues
OF_BIND_MOUNT_SDCARD_ON_FORMAT := 1

# ensure that /sdcard is bind-unmounted before f2fs data repair or format (required for FBE v1)
OF_UNBIND_SDCARD_F2FS := 1

# encrypttion
OF_DEFAULT_KEYMASTER_VERSION := 3.0

# dynamic partitions?
ifeq ($(FOX_USE_DYNAMIC_PARTITIONS),1)
   # build all the partition tools
   OF_ENABLE_ALL_PARTITION_TOOLS := 1
   #
   OF_QUICK_BACKUP_LIST := /boot;/data;
   OF_DISABLE_OTA_MENU := 1
   OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
   # OF_SUPPORT_ALL_BLOCK_OTA_UPDATES :=
   # OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR :=
   FOX_RECOVERY_SYSTEM_PARTITION := "/dev/block/mapper/system"
   FOX_RECOVERY_VENDOR_PARTITION := "/dev/block/mapper/vendor"

else
   OF_QUICK_BACKUP_LIST := /boot;/data;/system_image;/vendor_image;
   ifeq ($(FOX_USE_KEYMASTER_4),1)
       OF_DISABLE_OTA_MENU := 1
       OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1
       # OF_SUPPORT_ALL_BLOCK_OTA_UPDATES :=
       # OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR :=
   endif
endif

# other
OF_CLASSIC_LEDS_FUNCTION := 1