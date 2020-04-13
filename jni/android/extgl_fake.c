#include <string.h>
#include <jni.h>
#include <dlfcn.h>
#include <stdio.h>

// Missing this
#include <EGL/egl.h>

#include "extgl.h"
#include "GL/Regal.h"

// static void* gles1;
static void* glregal;
/*
#define MAP(func_name, func) \
    if (strcmp(name, func_name) == 0) name = #func;

#define ARB(func_name) MAP(#func_name "ARB", func_name)

#define EXT(func_name) MAP(#func_name "EXT", func_name)

#define STUB(func_name)                       \
    if (strcmp(name, #func_name) == 0) {      \
        printf("LWJGLWrapper: glX stub: %s\n", #func_name); \
        return (void *)glXStub;               \
    }
*/

/*
 * u said we need arb, suffixes, dat gles crap?
 * NO BITCH!
 * im using Regal, and all dat func crap is shim'ed
 * in da Regal lib lul
 */
void glXStub(void *x, ...) {
    return;
}
/*
 * avoke the context to startup Regal correctly
 * need to define a function for startup
 * yeah, the regal context is just a void.
 * that's better for us.
 */
void (*avoke_context)(void* context);

bool extgl_Open(JNIEnv *env) {
	// gles1 = dlopen("libGLESv1_CM.so", RTLD_LAZY); // don't need dat crap, because Regal replaces *just* all of funs
	// glregal = dlopen("libRegal.so", RTLD_LAZY);
	
	glregal = dlopen(NULL, RTLD_LAZY);
	
	/*
	avoke_context = dlsym(glregal,"RegalMakeCurrent");
	if (dlerror() != NULL) {
		printfDebug("Could not locate symbol RegalMakeCurrent in libRegal.so\n");
	} else{
		avoke_context(eglGetCurrentContext());
	}
	*/
	
	RegalMakeCurrent(eglGetCurrentContext());
	
	return glregal != NULL;
	
	// return true;
}

void *extgl_GetProcAddress(const char *name) {
	void *t = dlsym(glregal, name);
	if (t == NULL) {
		//dat shitty shim doesn't have a func?
		//eat that, stupid minceraft.
		
		// guy wrong, just leave it return NULL!
		// no, you're wrong! if user will replace regal with some other kind of wrapper without sourcemod, it will give some unexpected results
		// but this repo only for libRegal and nothing more!
		printfDebug("Could not locate symbol %s\n", name);
		// return (void *)glXstub;
	}
	return t;
}

void extgl_Close(void) {
	// dlclose(gles1); //don't need that shit lol
	dlclose(glregal);
}
