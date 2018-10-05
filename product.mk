PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay
PRODUCT_PACKAGES += auditd

$(call prepend-product-if-exists, vendor/invisiblek/product.mk)

ifneq ($(filter lineage_marlin lineage_mata lineage_nash lineage_sailfish,$(TARGET_PRODUCT)),)
# TARGET_ARCH doesn't get set in time, so let's make sure its done before we inherit gapps
TARGET_ARCH := arm64
-include vendor/gapps/$(TARGET_ARCH)/$(TARGET_ARCH)-vendor.mk
endif

TARGET_EXTRA_KERNEL_MODULES := wireguard

PRODUCT_COPY_FILES += \
    vendor/extra/rootdir/etc/init/ttl.rc:system/etc/init/ttl.rc
