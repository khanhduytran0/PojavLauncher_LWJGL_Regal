LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)  
LOCAL_LDLIBS := -llog -lGLESv1_CM
LOCAL_MODULE    := lwjgl

# cfiles := $(shell find -L $(LOCAL_PATH)/common -name "*.c" -printf "common/%P \n")

# cfiles += $(shell find -L $(LOCAL_PATH)/generated/opengl -name "*.c" -printf "generated/opengl/%P \n")

# cfiles += $(shell find -L $(LOCAL_PATH)/generated/openal -name "*.c" -printf "generated/openal/%P \n")

# cfiles += $(shell find -L $(LOCAL_PATH)/android -name "*.c" -printf "android/%P \n")

cfiles += android/android_al.c \
		  android/extgl_fake.c
		  
cfiles += common/common_tools.c \
 		  common/extal.c \
 		  common/org_lwjgl_BufferUtils.c \
 		  common/org_lwjgl_openal_AL.c \
 		  common/org_lwjgl_openal_ALC10.c \
 		  common/org_lwjgl_openal_ALC11.c \
		  
LOCAL_SRC_FILES := $(cfiles)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/common $(LOCAL_PATH)/common/opengl $(LOCAL_PATH)/android

include $(BUILD_SHARED_LIBRARY)  
