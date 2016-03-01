# Carbon defenition

Carbon is a simple set of scripts to build J2ME-applications on almost every platform. It was developed as a method to create J2ME-applications on single-board computers like Raspberry Pi.

## Carbon's content

* Sample.java (MIDlet sample)
* manifest (MANIFEST.MF)
* libraries 
  * j2me.jar (includes MIDP 2.0, CLDC 1.1)
  * pstros.jar (J2ME-emulator)
  * sixlegs.jar (image library for emulator)
* compile (script)
* build (script)
* preverify (script)
* run (script)

## Instructions on how to use Carbon

Before using Carbon make sure You have installed:

* JDK
* Proguard

Imagine "Sample.java" is MIDlet You want to build and launch on J2ME-phone (or emulator included in the project):

```sh
./compile
./build
./preverify
./run
