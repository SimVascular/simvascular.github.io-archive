##Additional Notes

### Linux: Multiple Compilers


Some versions of the needed software do not compile correctly using certain
versions of gcc/g++.  We use gcc-4.6 to compile many of the external libraries.
It is easy to obtain gcc-4.6 without overwriting your current version using
update-alternatives.  Below is an example of how to install both gcc-4.6 and
gcc-4.8 on a ubuntu system.

````bash
apt-get install c++-4.6 c++-4.8

update-alternatives --remove-all gcc
update-alternatives --remove-all g++

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 10
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20

update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20

update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
update-alternatives --set cc /usr/bin/gcc

update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
update-alternatives --set c++ /usr/bin/g++

update-alternatives --config gcc
update-alternatives --config g++
````

<br>
<br>
<br>
<br>
