# This is a FSL Android Reference Design platform based on i.MX8QP ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

-include device/fsl/common/imx_path/ImxPathConfig.mk
$(call inherit-product, device/fsl/imx8/imx8.mk)

ifneq ($(wildcard device/fsl/evk_8mq/fstab_nand.freescale),)
$(shell touch device/fsl/evk_8mq/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/evk_8mq/fstab.freescale),)
$(shell touch device/fsl/evk_8mq/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := evk_8mq
PRODUCT_DEVICE := evk_8mq


PRODUCT_COPY_FILES += \
	device/fsl/evk_8mq/init.rc:root/init.freescale.rc \
	device/fsl/evk_8mq/init.imx8mq.rc:root/init.freescale.imx8mq.rc \
	device/fsl/evk_8mq/init.usb.rc:root/init.freescale.usb.rc

# Audio
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
	device/fsl/evk_8mq/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
	device/fsl/evk_8mq/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \

# GPU files

PRODUCT_COPY_FILES += device/fsl/evk_8mq/init.freescale.sd.rc:root/init.freescale.sd.rc
PRODUCT_COPY_FILES += device/fsl/evk_8mq/init.freescale.emmc.rc:root/init.freescale.emmc.rc

DEVICE_PACKAGE_OVERLAYS := device/fsl/evk_8mq/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi xhdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.software.voice_recognizers.xml:system/etc/permissions/android.software.voice_recognizers.xml \
	frameworks/native/data/etc/android.software.backup.xml:system/etc/permissions/android.software.backup.xml \
	frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
	frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
	frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version-1_0_3.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level-0.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	device/fsl/evk_8mq/required_hardware.xml:system/etc/permissions/required_hardware.xml \

PRODUCT_COPY_FILES += \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/gpu-viv/lib64/egl/egl.cfg:system/lib64/egl/egl.cfg \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/gpu-viv/lib/egl/egl.cfg:system/lib/egl/egl.cfg

# HWC2 HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl

# Gralloc HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

PRODUCT_PACKAGES += \
        libEGL_VIVANTE \
        libGLESv1_CM_VIVANTE \
        libGLESv2_VIVANTE \
        gralloc_viv.imx8 \
        libGAL \
        libGLSLC \
        libVSC \
        libg2d \
        libgpuhelper \
        libSPIRV_viv \
        libvulkan_VIVANTE \
        vulkan.imx8

PRODUCT_PACKAGES += \
    Launcher3

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.power@1.0-impl \
    android.hardware.power@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Usb HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.imx

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# WiFi HAL
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    wifilogd \
    wificond

# Qcom WiFi Firmware
PRODUCT_COPY_FILES += \
    external/linux-firmware/qca/nvm_00130302.bin:vendor/firmware/nvm_tlv_3.2.bin \
    external/linux-firmware/qca/rampatch_00130302.bin:vendor/firmware/rampatch_tlv_3.2.tlv \
    external/linux-firmware/ath10k/QCA6174/hw3.0/board.bin:vendor/firmware/ath10k/QCA6174/hw3.0/board.bin \
    external/linux-firmware/ath10k/QCA6174/hw3.0/board-2.bin:vendor/firmware/ath10k/QCA6174/hw3.0/board-2.bin \
    external/linux-firmware/ath10k/QCA6174/hw3.0/firmware-4.bin:vendor/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

ifneq ($(BUILD_TARGET_FS),ubifs)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.internel.storage_size=/sys/block/mmcblk0/size \
    ro.frp.pst=/dev/block/by-name/presistdata
endif

# ro.product.first_api_level indicates the first api level the device has commercially launched on.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=26

PRODUCT_PACKAGES += \
    libg1 \
    libhantro \
    libcodec

