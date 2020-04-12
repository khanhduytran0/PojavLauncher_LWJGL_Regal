A **port** from @artdeell's project to **attempt** get Regal working on PojavLauncher.
This can be imported to Android Studio or AIDE.
Attempt to link the library statically.
----

LWJGL - Lightweight Java Game Library
======

The Lightweight Java Game Library (LWJGL) is a solution aimed directly at professional and amateur Java programmers alike to enable commercial quality games to be written in Java. 
LWJGL provides developers access to high performance crossplatform libraries such as OpenGL (Open Graphics Library), OpenCL (Open Computing Language) and OpenAL (Open Audio Library) allowing for state of the art 3D games and 3D sound.
Additionally LWJGL provides access to controllers such as Gamepads, Steering wheel and Joysticks.
All in a simple and straight forward API.

Website: [http://lwjgl.org](http://lwjgl.org)
Forum: [http://lwjgl.org/forum](http://lwjgl.org/forum)
Bugs/Suggestions: [https://github.com/LWJGL/lwjgl/issues](https://github.com/LWJGL/lwjgl/issues)

Compilation
-----------

This LWJGL project can only build C++ code. Requires Android Studio and Android NDK, so:
- Import to Android Studio.
- Build project as normal apk.

Or if you have only Android NDK:
- Open Terminal (Linux) or Command Prompt (Windows).
- Execute `cd [directory locate to this project]`.
- Execute `ndk-build`.
