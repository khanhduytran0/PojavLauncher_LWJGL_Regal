LOCAL_PATH := $(call my-dir)

global_cflags := -DANDROID=1

# Regal prebuilt library
include $(CLEAR_VARS)
LOCAL_MODULE := Regal_static

LOCAL_SRC_FILES := prebuilt/armeabi-v7a/lib$(LOCAL_MODULE).a
# Uncomment below and comment above if have x86 libRegal_static.a
# LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/regal_include
include $(PREBUILT_STATIC_LIBRARY)

# LWJGL build
include $(CLEAR_VARS)  
LOCAL_LDLIBS := -llog -lEGL
LOCAL_MODULE := lwjgl

# Link libRegal_static.a to liblwjgl.so
LOCAL_WHOLE_STATIC_LIBRARIES := Regal_static zlib snappy
LOCAL_CFLAGS    := $(global_cflags)
LOCAL_ARM_MODE  := arm

# Add this for RegalMakeCurrent
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

# cfiles := $(shell find -L $(LOCAL_PATH)/common -name "*.c" -printf "common/%P \n")

# cfiles += $(shell find -L $(LOCAL_PATH)/generated/opengl -name "*.c" -printf "generated/opengl/%P \n")

# cfiles += $(shell find -L $(LOCAL_PATH)/generated/openal -name "*.c" -printf "generated/openal/%P \n")

# cfiles += $(shell find -L $(LOCAL_PATH)/android -name "*.c" -printf "android/%P \n")

cfiles := android/android_al.c \
		  android/extgl_fake.c
		  
cfiles += common/common_tools.c \
 		  common/extal.c \
 		  common/opengl/org_lwjgl_opengl_CallbackUtil.c \
 		  common/opengl/org_lwjgl_opengl_GLContext.c \
 		  common/org_lwjgl_BufferUtils.c \
 		  common/org_lwjgl_openal_AL.c \
 		  common/org_lwjgl_openal_ALC10.c \
 		  common/org_lwjgl_openal_ALC11.c \
		  
cfiles += fake/FakeGLGetString.c \

cfiles += generated/openal/org_lwjgl_openal_AL10.c \
		  generated/openal/org_lwjgl_openal_AL11.c \
		  generated/openal/org_lwjgl_openal_EFX10.c \
		  generated/opengl/org_lwjgl_opengl_AMDDebugOutput.c \
generated/opengl/org_lwjgl_opengl_AMDDrawBuffersBlend.c \
generated/opengl/org_lwjgl_opengl_AMDMultiDrawIndirect.c \
generated/opengl/org_lwjgl_opengl_AMDNameGenDelete.c \
generated/opengl/org_lwjgl_opengl_AMDPerformanceMonitor.c \
generated/opengl/org_lwjgl_opengl_AMDSamplePositions.c \
generated/opengl/org_lwjgl_opengl_AMDVertexShaderTessellator.c \
generated/opengl/org_lwjgl_opengl_APPLEElementArray.c \
generated/opengl/org_lwjgl_opengl_APPLEFence.c \
generated/opengl/org_lwjgl_opengl_APPLEFlushBufferRange.c \
generated/opengl/org_lwjgl_opengl_APPLEObjectPurgeable.c \
generated/opengl/org_lwjgl_opengl_APPLETextureRange.c \
generated/opengl/org_lwjgl_opengl_APPLEVertexArrayObject.c \
generated/opengl/org_lwjgl_opengl_APPLEVertexArrayRange.c \
generated/opengl/org_lwjgl_opengl_APPLEVertexProgramEvaluators.c \
generated/opengl/org_lwjgl_opengl_ARBBufferObject.c \
generated/opengl/org_lwjgl_opengl_ARBColorBufferFloat.c \
generated/opengl/org_lwjgl_opengl_ARBDebugOutput.c \
generated/opengl/org_lwjgl_opengl_ARBDrawBuffers.c \
generated/opengl/org_lwjgl_opengl_ARBDrawBuffersBlend.c \
generated/opengl/org_lwjgl_opengl_ARBDrawInstanced.c \
generated/opengl/org_lwjgl_opengl_ARBGeometryShader4.c \
generated/opengl/org_lwjgl_opengl_ARBGpuShaderFp64.c \
generated/opengl/org_lwjgl_opengl_ARBImaging.c \
generated/opengl/org_lwjgl_opengl_ARBInstancedArrays.c \
generated/opengl/org_lwjgl_opengl_ARBMatrixPalette.c \
generated/opengl/org_lwjgl_opengl_ARBMultisample.c \
generated/opengl/org_lwjgl_opengl_ARBMultitexture.c \
generated/opengl/org_lwjgl_opengl_ARBOcclusionQuery.c \
generated/opengl/org_lwjgl_opengl_ARBPointParameters.c \
generated/opengl/org_lwjgl_opengl_ARBProgram.c \
generated/opengl/org_lwjgl_opengl_ARBRobustness.c \
generated/opengl/org_lwjgl_opengl_ARBSampleShading.c \
generated/opengl/org_lwjgl_opengl_ARBShaderObjects.c \
generated/opengl/org_lwjgl_opengl_ARBShadingLanguageInclude.c \
generated/opengl/org_lwjgl_opengl_ARBTextureBufferObject.c \
generated/opengl/org_lwjgl_opengl_ARBTextureCompression.c \
generated/opengl/org_lwjgl_opengl_ARBTextureStorage.c \
generated/opengl/org_lwjgl_opengl_ARBTransposeMatrix.c \
generated/opengl/org_lwjgl_opengl_ARBVertexAttrib64bit.c \
generated/opengl/org_lwjgl_opengl_ARBVertexBlend.c \
generated/opengl/org_lwjgl_opengl_ARBVertexShader.c \
generated/opengl/org_lwjgl_opengl_ARBWindowPos.c \
generated/opengl/org_lwjgl_opengl_ATIDrawBuffers.c \
generated/opengl/org_lwjgl_opengl_ATIElementArray.c \
generated/opengl/org_lwjgl_opengl_ATIEnvmapBumpmap.c \
generated/opengl/org_lwjgl_opengl_ATIFragmentShader.c \
generated/opengl/org_lwjgl_opengl_ATIMapObjectBuffer.c \
generated/opengl/org_lwjgl_opengl_ATIPnTriangles.c \
generated/opengl/org_lwjgl_opengl_ATISeparateStencil.c \
generated/opengl/org_lwjgl_opengl_ATIVertexArrayObject.c \
generated/opengl/org_lwjgl_opengl_ATIVertexAttribArrayObject.c \
generated/opengl/org_lwjgl_opengl_ATIVertexStreams.c \
generated/opengl/org_lwjgl_opengl_EXTBindableUniform.c \
generated/opengl/org_lwjgl_opengl_EXTBlendColor.c \
generated/opengl/org_lwjgl_opengl_EXTBlendEquationSeparate.c \
generated/opengl/org_lwjgl_opengl_EXTBlendFuncSeparate.c \
generated/opengl/org_lwjgl_opengl_EXTBlendMinmax.c \
generated/opengl/org_lwjgl_opengl_EXTCompiledVertexArray.c \
generated/opengl/org_lwjgl_opengl_EXTDepthBoundsTest.c \
generated/opengl/org_lwjgl_opengl_EXTDirectStateAccess.c \
generated/opengl/org_lwjgl_opengl_EXTDrawBuffers2.c \
generated/opengl/org_lwjgl_opengl_EXTDrawInstanced.c \
generated/opengl/org_lwjgl_opengl_EXTDrawRangeElements.c \
generated/opengl/org_lwjgl_opengl_EXTFogCoord.c \
generated/opengl/org_lwjgl_opengl_EXTFramebufferBlit.c \
generated/opengl/org_lwjgl_opengl_EXTFramebufferMultisample.c \
generated/opengl/org_lwjgl_opengl_EXTFramebufferObject.c \
generated/opengl/org_lwjgl_opengl_EXTGeometryShader4.c \
generated/opengl/org_lwjgl_opengl_EXTGpuProgramParameters.c \
generated/opengl/org_lwjgl_opengl_EXTGpuShader4.c \
generated/opengl/org_lwjgl_opengl_EXTMultiDrawArrays.c \
generated/opengl/org_lwjgl_opengl_EXTPalettedTexture.c \
generated/opengl/org_lwjgl_opengl_EXTPointParameters.c \
generated/opengl/org_lwjgl_opengl_EXTProvokingVertex.c \
generated/opengl/org_lwjgl_opengl_EXTSecondaryColor.c \
generated/opengl/org_lwjgl_opengl_EXTSeparateShaderObjects.c \
generated/opengl/org_lwjgl_opengl_EXTShaderImageLoadStore.c \
generated/opengl/org_lwjgl_opengl_EXTStencilClearTag.c \
generated/opengl/org_lwjgl_opengl_EXTStencilTwoSide.c \
generated/opengl/org_lwjgl_opengl_EXTTextureBufferObject.c \
generated/opengl/org_lwjgl_opengl_EXTTextureInteger.c \
generated/opengl/org_lwjgl_opengl_EXTTimerQuery.c \
generated/opengl/org_lwjgl_opengl_EXTTransformFeedback.c \
generated/opengl/org_lwjgl_opengl_EXTVertexAttrib64bit.c \
generated/opengl/org_lwjgl_opengl_EXTVertexShader.c \
generated/opengl/org_lwjgl_opengl_GL11.c \
generated/opengl/org_lwjgl_opengl_EXTVertexWeighting.c \
generated/opengl/org_lwjgl_opengl_GL12.c \
generated/opengl/org_lwjgl_opengl_GL13.c \
generated/opengl/org_lwjgl_opengl_GL14.c \
generated/opengl/org_lwjgl_opengl_GL15.c \
generated/opengl/org_lwjgl_opengl_GL20.c \
generated/opengl/org_lwjgl_opengl_GL21.c \
generated/opengl/org_lwjgl_opengl_GL30.c \
generated/opengl/org_lwjgl_opengl_GL31.c \
generated/opengl/org_lwjgl_opengl_GL32.c \
generated/opengl/org_lwjgl_opengl_GL33.c \
generated/opengl/org_lwjgl_opengl_GL40.c \
generated/opengl/org_lwjgl_opengl_GL41.c \
generated/opengl/org_lwjgl_opengl_GL42.c \
generated/opengl/org_lwjgl_opengl_GREMEDYStringMarker.c \
generated/opengl/org_lwjgl_opengl_NVConditionalRender.c \
generated/opengl/org_lwjgl_opengl_NVCopyImage.c \
generated/opengl/org_lwjgl_opengl_NVDepthBufferFloat.c \
generated/opengl/org_lwjgl_opengl_NVEvaluators.c \
generated/opengl/org_lwjgl_opengl_NVExplicitMultisample.c \
generated/opengl/org_lwjgl_opengl_NVFence.c \
generated/opengl/org_lwjgl_opengl_NVFragmentProgram.c \
generated/opengl/org_lwjgl_opengl_NVFramebufferMultisampleCoverage.c \
generated/opengl/org_lwjgl_opengl_NVGeometryProgram4.c \
generated/opengl/org_lwjgl_opengl_NVGpuProgram4.c \
generated/opengl/org_lwjgl_opengl_NVGpuShader5.c \
generated/opengl/org_lwjgl_opengl_NVHalfFloat.c \
generated/opengl/org_lwjgl_opengl_NVOcclusionQuery.c \
generated/opengl/org_lwjgl_opengl_NVParameterBufferObject.c \
generated/opengl/org_lwjgl_opengl_NVPathRendering.c \
generated/opengl/org_lwjgl_opengl_NVPixelDataRange.c \
generated/opengl/org_lwjgl_opengl_NVPointSprite.c \
generated/opengl/org_lwjgl_opengl_NVPresentVideo.c \
generated/opengl/org_lwjgl_opengl_NVPrimitiveRestart.c \
generated/opengl/org_lwjgl_opengl_NVProgram.c \
generated/opengl/org_lwjgl_opengl_NVRegisterCombiners.c \
generated/opengl/org_lwjgl_opengl_NVRegisterCombiners2.c \
generated/opengl/org_lwjgl_opengl_NVShaderBufferLoad.c \
generated/opengl/org_lwjgl_opengl_NVTextureBarrier.c \
generated/opengl/org_lwjgl_opengl_NVTextureMultisample.c \
generated/opengl/org_lwjgl_opengl_NVTransformFeedback.c \
generated/opengl/org_lwjgl_opengl_NVTransformFeedback2.c \
generated/opengl/org_lwjgl_opengl_NVVertexArrayRange.c \
generated/opengl/org_lwjgl_opengl_NVVertexAttribInteger64bit.c \
generated/opengl/org_lwjgl_opengl_NVVertexBufferUnifiedMemory.c \
generated/opengl/org_lwjgl_opengl_NVVertexProgram.c \
generated/opengl/org_lwjgl_opengl_NVVideoCapture.c \
# generated/opengles/org_lwjgl_opengles_AMDPerformanceMonitor.c \
generated/opengles/org_lwjgl_opengles_ANGLEFramebufferBlit.c \
generated/opengles/org_lwjgl_opengles_ANGLEFramebufferMultisample.c \
generated/opengles/org_lwjgl_opengles_APPLEFramebufferMultisample.c \
generated/opengles/org_lwjgl_opengles_ARBDrawBuffers.c \
generated/opengles/org_lwjgl_opengles_EXTBlendMinmax.c \
generated/opengles/org_lwjgl_opengles_EXTDiscardFramebuffer.c \
generated/opengles/org_lwjgl_opengles_EXTMultiDrawArrays.c \
generated/opengles/org_lwjgl_opengles_EXTTextureArray.c \
generated/opengles/org_lwjgl_opengles_GLES20.c \
generated/opengles/org_lwjgl_opengles_IMGMultisampledRenderToTexture.c \
generated/opengles/org_lwjgl_opengles_NVCoverageSample.c \
generated/opengles/org_lwjgl_opengles_NVDrawBuffers.c \
generated/opengles/org_lwjgl_opengles_NVDrawPath.c \
generated/opengles/org_lwjgl_opengles_NVFence.c \
generated/opengles/org_lwjgl_opengles_NVFramebufferVertexAttribArray.c \
generated/opengles/org_lwjgl_opengles_NVGetTexImage.c \
generated/opengles/org_lwjgl_opengles_NVReadBuffer.c \
generated/opengles/org_lwjgl_opengles_NVSystemTime.c \
generated/opengles/org_lwjgl_opengles_OESBlendEquationSeparate.c \
generated/opengles/org_lwjgl_opengles_OESBlendFuncSeparate.c \
generated/opengles/org_lwjgl_opengles_OESBlendSubtract.c \
generated/opengles/org_lwjgl_opengles_OESEGLImage.c \
generated/opengles/org_lwjgl_opengles_OESEGLImageExternal.c \
generated/opengles/org_lwjgl_opengles_OESFramebufferObject.c \
generated/opengles/org_lwjgl_opengles_OESGetProgramBinary.c \
generated/opengles/org_lwjgl_opengles_OESMapbuffer.c \
generated/opengles/org_lwjgl_opengles_OESTexture3D.c \
generated/opengles/org_lwjgl_opengles_OESVertexArrayObject.c \
generated/opengles/org_lwjgl_opengles_QCOMDriverControl.c \
generated/opengles/org_lwjgl_opengles_QCOMExtendedGet.c \
generated/opengles/org_lwjgl_opengles_QCOMExtendedGet2.c \
generated/opengles/org_lwjgl_opengles_QCOMTiledRendering.c \

## Unnecessary to compile:
# generated/opengl/org_lwjgl_opengl_ARBCLEvent.c \
# generated/opencl/org_lwjgl_opencl_APPLEContextLoggingFunctions.c \
# generated/opencl/org_lwjgl_opencl_APPLEGLSharing.c \
# generated/opencl/org_lwjgl_opencl_APPLESetMemObjectDestructor.c \
# generated/opencl/org_lwjgl_opencl_CL10.c \
# generated/opencl/org_lwjgl_opencl_CL10GL.c \
# generated/opencl/org_lwjgl_opencl_CL11.c \
# generated/opencl/org_lwjgl_opencl_EXTDeviceFission.c \
# generated/opencl/org_lwjgl_opencl_EXTMigrateMemobject.c \
# generated/opencl/org_lwjgl_opencl_KHRGLEvent.c \
# generated/opencl/org_lwjgl_opencl_KHRGLSharing.c \
# generated/opencl/org_lwjgl_opencl_KHRICD.c \
		  
LOCAL_SRC_FILES := $(cfiles)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/common \
					$(LOCAL_PATH)/common/opengl \
					$(LOCAL_PATH)/android \
					$(LOCAL_PATH)/regal_include \

include $(BUILD_SHARED_LIBRARY)  
