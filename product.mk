PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

$(call inherit-product-if-exists, vendor/invisiblek/product.mk)

ifneq ($(filter lineage_marlin lineage_mata lineage_nash lineage_sailfish,$(TARGET_PRODUCT)),)
$(call inherit-product-if-exists, vendor/gapps/common/common-vendor.mk)
endif

#$(shell sh vendor/extra/get-blacklist-hosts-file.sh)

#PRODUCT_COPY_FILES += \
#    vendor/extra/rootdir/etc/hosts:system/etc/hosts

PRODUCT_COPY_FILES += \
    vendor/extra/rootdir/etc/init/ttl.rc:system/etc/init/ttl.rc

PRODUCT_PACKAGES += OpenWeatherMapProvider
