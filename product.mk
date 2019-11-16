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

-include vendor/gapps/common/common-vendor.mk

PRODUCT_PACKAGES += OpenWeatherMapProvider

# init.d support
PRODUCT_COPY_FILES += \
    vendor/extra/prebuilt/common/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner \
    vendor/extra/prebuilt/common/bin/sysinit:$(TARGET_COPY_OUT_SYSTEM)/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/extra/prebuilt/common/etc/init.d/90userinit:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/90userinit
endif

$(foreach f,$(wildcard vendor/extra/prebuilt/common/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

$(eval include vendor/extra/sepolicy/common/sepolicy.mk)
