# Inherit device configuration
$(call inherit-product, device/softwinner/astar_ibt/astar_ibt.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := astar_ibt
PRODUCT_NAME := omni_astar_ibt
PRODUCT_BRAND := softwinner
PRODUCT_MODEL := Glee_10.1
PRODUCT_MANUFACTURER := softwinner
