# Defenition of Carbon Oxyde

Carbon is a simple set of scripts to build J2ME-applications on almost every platform. It was developed as a method to create J2ME-applications on single-board computers like Raspberry Pi.

Carbon Oxyde is an attempt to improve it. It's in development at the moment. Check "master" branch for original Carbon.

## Implemented features

Now Carbon can only build J2ME-applications, which have manifest (META-INF/MANIFEST.MF), only on MIDlet (MIDlet-1). All the sources must be in the root folder of the project. Ability to build projects with different organization will be implemented in next commits. To build the sample use following command:

```bash
./carbon build manifest
