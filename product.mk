PRODUCT_PACKAGE_OVERLAYS += vendor/extra/overlay

$(call inherit-product-if-exists, vendor/invisiblek/product.mk)

ifneq ($(filter lineage_marlin lineage_mata lineage_nash lineage_sailfish,$(TARGET_PRODUCT)),)
GAPPS_VARIANT := nano
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

PRODUCT_COPY_FILES += \
  vendor/opengapps/sources/arm/lib/28/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so \
  vendor/opengapps/sources/arm/lib/28/libsketchology_native.so:system/lib/libsketchology_native.so \
  vendor/opengapps/sources/arm64/lib64/28/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
  vendor/opengapps/sources/arm64/lib64/28/libsketchology_native.so:system/lib64/libsketchology_native.so
endif

$(shell sh vendor/extra/get-blacklist-hosts-file.sh)

PRODUCT_COPY_FILES += \
    vendor/extra/rootdir/etc/hosts:system/etc/hosts \
    vendor/extra/rootdir/etc/init/ttl.rc:system/etc/init/ttl.rc
