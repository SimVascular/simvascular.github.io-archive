# Installation Instructions for Windows #



### Prerequisites ###

SimVascular requires several external packages and runtime libraries to be installed. Depending on your OS and other
software that you have installed, you may have many of the runtime libraries already installed. It is better to be safe
than sorry – if you already have a prerequisite installed, running the installer will do nothing.

*__NOTE:__ You should install all 32-bit installers on every machine (including 64-bit machines) EXCEPT MPICH2 as indicated
below.*

*__NOTE:__ SimVascular does not explicitly require Cygwin.*

*__NOTE:__ You can install both SimVascular 64-bit and 32-bit on the same (64-bit) machine.*

*__NOTE:__ MPICH2 is needed to run simulations. GDCM is needed to read info from DICOM headers in SV.*

### OS requirements ###

SimVascular can be installed on Windows Vista/7/8 

#### Windows 8 ####

Windows 8 appears to currently have all the runtime prerequisites installed for the current release of SimVascular. You
can skip steps 1-9 below, and only do them if the software fails to run.

#### Windows 7 / Windows ####

Install MSVC & Intel Fortran runtime compiler libraries:

<!--
	1. Install vcredist_x86-2008-sp0.exe
	2. Install msvc10_vcredist_x64.exe (64-bit machines only)
	3. Install msvc2010sp1-vcredist_x64.exe (64 bit machines only)
	4. Install msvc10_sp1_vcredist_x86.exe
	5. w_fcompxe_redist_intel64_2011.6.233.msi (64-bit machines only)
	6. w_fcompxe_redist_ia32_2011.6.233.msi
	7. w_fcompxe_redist_intel64_2011.11.344.msi (64-bit machines only)
	8. w_fcompxe_redist_ia32_2011.11.344.msi
	-->
	NetFx20SP2_x86.exe

Required External Packages for DICOM
	
	Install OpenSSL:

	1. Install Win32OpenSSL_Light-1_0_1c.exe
		Install GDCM:
	2. Install GDCM-2.2.1-Windows-x86.exe

	Required External Packages for SimVascular Flow Solver
	Install MPICH2:

	1. mpich2-1.4.1p1-win-x86-64.msi (64-bit machines only)
<!--	2. mpich2-1.4.1p1-win-ia32.msi (32-bit machines only) -->

*__NOTE:__ install for ALL users. MPICH2 must be installed from the REAL Administrator account, NOT just a user with
administrative privileges!!!! To enable the Administrator account, first you’ll need to open a command prompt in
administrator mode by right-clicking and choosing “Run as administrator” (or use the Ctrl+Shift+Enter shortcut from the
search box) and then typing:*

	% net user administrator /active:yes

*Remember to add a password for the administrator account!*

### Installing SimVascular ###

Install SimVascular & configure firewall (for flow solver if needed):

	1. Install simvascular-2013-08-27-A.msi (64-bit machines only)
	2. Install simvascular32-2013-??-??-A.msi (32 bit optional)
	3. Install the simvascular-*-licenses-2013.msi
	4. Add exceptions to Windows Firewall for “flowsolver-bin.exe” and “mpiexec.exe” installed in “Program Files (x86/SimVascular/sv/??????????”. Be careful since “private” networks and “public” networks have different settings.

### Final Notes ###

SimVascular, “beta”, and cpmViewer can all be installed side-by-side (both 32-bit and 64-bit versions) without conflict.