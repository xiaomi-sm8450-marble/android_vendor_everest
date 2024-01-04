# Inherit mobile full common Everest stuff
$(call inherit-product, vendor/everest/config/common_mobile_full.mk)

# Inherit tablet common Everest stuff
$(call inherit-product, vendor/everest/config/tablet.mk)
$(call inherit-product, vendor/everest/config/wifionly.mk)
