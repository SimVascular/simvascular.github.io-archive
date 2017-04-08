
#            Compiling SimVascular using CMake #
<br>
*This guide gives an overview of compiling SimVascular using CMake.  We also support standard MakeFiles.*

<br>

##				System Requirements


<table class="table table-bordered">
<thead>
<tr>
  <th>Windows</th>
  <th>Apple OS X</th>
  <th>Linux</th>
</tr>
</thead>
<tr>
  <td>Tested Configurations:
        <ul>
          <li>Windows 10</li>
          <li>C++ compilers</li>
        </ul>
    Supported Compilers:
      <ul>
      <li>Visual Studio 2013 Community Edition <br>(version 12.0 update 5 for x64)</li>
      <li>Visual Studio 2013 Professional <br>(version 12.0 update 5 for x64)</li>
    </ul>
  </td>
  <td>Tested Configurations:
        <ul>
          <li>Version 10.10.5 (OS X Yosemite) <br>with XCode 7.2.1 (command line tools installed)</li>
          <li>Version 10.12.1 (macOS Sierra) <br>with XCode 8.2.1 (command line tools installed)</li>
        </ul>
    Supported Compilers:
      <ul>
      <li>Apple LLVM version 7.0.2 (clang-700.1.81)</li>
      <li>Apple LLVM version 8.0.0 (clang-800.0.42.1)</li>
    </ul>
  </td>
  <td>Tested Configurations:
        <ul>
          <li>Ubuntu 14.04 64-bit desktop</li>
          <li>Ubuntu 16.04 64-bit desktop</li>
        </ul>
    Supported Compilers:
      <ul>
      <li>gcc/g++ 4.8.5</li>
      <li>gcc/g++ 5.4.0</li>
    </ul>
  </td>
</tr>
</table>

*On linux, use <code>gcc --version</code> to see which compiler you are using.*
*On mac, use <code>clang --version</code> to see which compiler you are using.*
