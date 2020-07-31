
<html>
<head>

<style>
.PythonMethodsDiv {
   background-color: #F0F0F0;
   padding: 10px;
   border: 1px solid #e6e6e6;
}
</style>

<style>
.PythonMethodsLegend {
   font-size: 14px;
}
</style>

<style>
.PythonMethodsPre {
   font-size: 12px;
}
</style>

</head>
<body>


# Introduction #
SimVascular provides an application programming interface (API) for accessing core SimVascular functions using the
Python programming language. The API defines a number of Python modules and classes used to access, manipulate and 
create data for each of the path planning, segmentation, modeling, mesh generation and simulation steps in the SimVascular 
image-based modeling pipeline. Custom Python scripts can be written to augment the functionality provided by the
SimVascular GUI and to automate modeling tasks for optimization, uncertainty quantification, and studies with large 
patient cohorts.

The API attempts to provide an interface conceptually similar to how data is accessed and how operations are
performed using the GUI. There are, however, some differences between the GUI and API because the GUI hides 
SimVascular internals that must sometmes be exposed in the API. These differences are explained in the 
<a href="#sv_modules"> SimVascular Python Modules </a> section.

