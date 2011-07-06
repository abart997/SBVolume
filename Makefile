include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = SBVolume
SBVolume_FILES = Tweak.xm
SBVolume_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
