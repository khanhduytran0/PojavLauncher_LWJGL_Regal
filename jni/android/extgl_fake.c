#include <string.h>
#include <jni.h>
#include <dlfcn.h>
#include <stdio.h>

#include "extgl.h"

//static void* gles1;
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

bool extgl_Open(JNIEnv *env) {
	// Never gonna be use libGLES1 again!
	//gles1 = dlopen("libGLESv1_CM.so", RTLD_LAZY); // don't need dat crap, because Regal replaces *just* all of funs
	glregal = dlopen("libRegal.so", RTLD_LAZY); 
	
	// Why still gles1 != null here?
	return /* gles1 != NULL && */ glregal != NULL;
}

void *extgl_GetProcAddress(const char *name) {
	void *t = dlsym(glregal, name);
	if (t == NULL) {
		//dat shitty shim doesn't have a func?
		//eat that, stupid minceraft.
		
		// guy wrong, just leave it return NULL!
		
		// return (void *)glXstub;
		
		printfDebug("Could not locate symbol %s\n", name);
	}
	return t;
}

void extgl_Close(void) {
	//dlclose(gles1); //don't need that shit lol
	dlclose(glregal);
}
