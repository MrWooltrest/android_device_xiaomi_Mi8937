LOCAL_PATH := $(call my-dir)

# ------------------------------------------------------------------------------
#                Make the shared library (libPomx_core)
# ------------------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -Werror \
                   -g -O0

ifeq ($(MI8937_CAM_USE_RENAMED_BLOBS_P),true)
LOCAL_CFLAGS += -DRENAME_BLOBS
endif

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../qexif

LOCAL_HEADER_LIBRARIES := libutils_headers
LOCAL_HEADER_LIBRARIES += media_plugin_headers

LOCAL_INC_FILES := qomx_core.h \
                   QOMX_JpegExtensions.h

LOCAL_SRC_FILES := qomx_core.c

LOCAL_MODULE           := libPomx_core
LOCAL_ODM_MODULE := true
LOCAL_PRELINK_MODULE   := false
LOCAL_SHARED_LIBRARIES := libcutils libdl liblog

LOCAL_32_BIT_ONLY := true
include $(BUILD_SHARED_LIBRARY)
