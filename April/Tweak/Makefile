include $(THEOS)/makefiles/common.mk

TWEAK_NAME = April
$(TWEAK_NAME)_FILES = $(TWEAK_NAME).x $(wildcard *.m) $(wildcard Extensions/*.m)
$(TWEAK_NAME)_LIBRARIES = colorpicker
$(TWEAK_NAME)_FRAMEWORKS = EventKit CoreText MediaPlayer
$(TWEAK_NAME)_PRIVATE_FRAMEWORKS = AppSupport Weather
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk