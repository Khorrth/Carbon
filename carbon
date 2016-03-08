#!/bin/sh

#	Carbon is a set of scripts to build J2ME-applications.

#	Carbon-related variables:

	CarbonVersion=0.1
	CarbonAuthor="K'horrth"
	J2MELibrariesPath=libraries/j2me.jar
	Emulator=microemulator

#	Application-related variables:

	ApplicationManifestPath=
	ApplicationName=
	ApplicationVersion=
	ApplicationVendor=
	ApplicationMidlets=
	SourceFiles=
	PackageName=
	PreverifiedPackageName=
	
#	Functions:

	Build()
	{
		javac -encoding utf8 -target 1.4 -source 1.4 -cp $J2MELibrariesPath $SourceFiles || { echo "Compilation failed." ; exit 3; }
		jar -cfm $PackageName "manifest" *.class || { echo "Failed to create package." ; exit 3; }
		proguard -injars $PackageName -outjars $PreverifiedPackageName -libraryjars $J2MELibrariesPath -target 1.4 -dontshrink -dontoptimize -dontobfuscate -microedition -verbose || { echo "Preverification failed." ; exit 3; }
		echo "Application has been built."
	}
	
	CheckManifestValidity()
	{
		if test -s $ApplicationManifestPath
			then
			echo "Application manifest is found ($PWD/$ApplicationManifestPath)."
			else
			echo "Application manifest is not found."
			exit 3
		fi
		if [[ "$(xdg-mime query filetype $ApplicationManifestPath)" = "text/vnd.sun.j2me.app-descriptor" ]];
			then
			echo "Application manifest is valid."
			else
			echo "Application manifest validation failed - ignored."
			#exit 3
		fi
	}
	
	ParseManifest()
	{
		ApplicationName=$(GetApplicationProperty "MIDlet-Name")
		ApplicationVendor=$(GetApplicationProperty "MIDlet-Vendor")
		ApplicationVersion=$(GetApplicationProperty "MIDlet-Version")
		ApplicationMidlets=$(GetApplicationProperty "MIDlet-1")
		SourceFiles=$(echo $ApplicationMidlets | cut -f3 -d ",").java
		PackageName=$ApplicationName.jar
		PreverifiedPackageName=$ApplicationName-preverified.jar
		echo $PackageName
		echo "Application manifest has been parsed."
	}
	
	CheckSetup()
	{
		if
			test -s $J2MELibrariesPath
			then
			echo "J2ME libraries location: $J2MELibrariesPath"
			else
			echo "J2ME libraries are not found."
			exit 2
		fi
	}
	
	GetApplicationProperty()
	{
		echo $(grep $1 $ApplicationManifestPath | cut -f2 -d ":")
	}
	
	ShowHelp()
	{
		echo "To build J2ME-application execute the command:"
		echo "carbon build 'manifest-path'"
	}
	
#	Script body:

	echo "Welcome to Carbon ($CarbonVersion), a J2ME-application building system by $CarbonAuthor!"

	case $1
		in
		"build")
			if [ $# -ne 2 ]
			then
			echo "Wrong arguments number."
			ShowHelp
			exit 1
			fi
			ApplicationManifestPath=$2
			CheckManifestValidity
			ParseManifest
			Build
		;;
		* )
			echo "Wrong operation specified!"
			ShowHelp
			exit 1
		;;
	esac
	



# java -jar libraries/pstros.jar Sample-preverified.jar -w240 -h320
