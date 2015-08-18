
# Installation Instructions for Windows #

<br>
### 1. Prerequisites ###

On Windows, SimVascular requires several external packages and runtime libraries to be installed. Depending on your OS and other
software that you have installed, you may have many of the runtime libraries already installed. It is better to be safe
than sorry – if you already have a prerequisite installed, running the installer will do nothing.

*__NOTE:__ MPICH2 is needed to run simulations. GDCM is needed to read info from DICOM headers*

<br>

### 2. Requirements ###

#### Windows 8 ####

Windows 8 appears to currently have all the runtime prerequisites installed for the current release of SimVascular, except packags for DICOM and MPICH2.

####Windows 7 / Windows ####

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
	
	1. Install Win32OpenSSL_Light-1_0_1c.exe
	2. Install GDCM-2.2.1-Windows-x86.exe  (Add GDCM to system PATH for ALL users!)

Required External Packages for SimVascular Flow Solver

	1. Install MPICH2:

	mpich2-1.4.1p1-win-x86-64.msi (64-bit machines only)
<!--	2. mpich2-1.4.1p1-win-ia32.msi (32-bit machines only) -->

*__NOTE:__ install for ALL users. MPICH2 must be installed from the REAL Administrator account, NOT just a user with
administrative privileges!!!! To enable the Administrator account, first you’ll need to open a command prompt in
administrator mode by right-clicking and choosing “Run as administrator” (or use the Ctrl+Shift+Enter shortcut from the
search box) and then typing:*

	net user administrator /active:yes

<figure>
  <img class="svImg svImgSm" src="documentation/installation/imgs/mpich.jpg">
  <figcaption class="svCaption" >Open Command Prompt in Administrator Mode</figcaption>
</figure>

*Remember to add a password for the administrator account and re-login with the account to install MPICH2!*

<br>

### 3. Installing SimVascular ###

Install SimVascular & configure firewall (for flow solver if needed):

	1. Install simvascular-2.0.xxxxx-Win-x64.msi 
	2. Add exceptions to Windows Firewall for “flowsolver.exe” and “mpiexec.exe” installed under the SimVascular installation folder in “Program Files". Be careful since “private” networks and “public” networks have different settings.

<br>
