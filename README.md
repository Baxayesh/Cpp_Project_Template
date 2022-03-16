# Cpp_Project_Template
An easy to use cpp project template 

## Description
  this is a complete project template for c++ app that contain almost everything you need in your project including:
  - a makefile by auto dependency detection (you dont need to add dependencies by hand!)
  - a gitignore
  - license
  - README.md template (this file!)
 
 you can use this tamplate for a fast start on your new projects!
  
## Usage
1. Copy files on your project

2. Set up makefile: don't worry! everything is almost written! you can just change this makefile variables at top of makefile if you need
 ```makefile
 #project variables 
APP_NAME := foobar <name of compiled program>
OUTPUT_DIR := . <where to save compiled program. "." for defualt>
SOURCE_DIRS := code sources <add here all directories you saved .cpp files there >

#compiler variables
#compiler name
CXX :=g++ <or any other compiler you like>
#compiler preprocess flags
CPPFLAGS := 
#compilation flags
CXXFLAGS :=--std=c++11
#linker flags
LDFLAGS :=
#loud liberaries
LDLIBS :=
 ```
 3. Personalize readme, .gitignore, note directory, etc. if you wish
 
 4. Start coding! 

## Warnings:
You can change any part of this template if you wish except for makefile.
change makefile if and only if you know what are you doing!

also:
  - Using source code file and directory names that contain space may cuase some problem in makefile. I don't have any solution.
  - This makefile has a sketchy installer; If you have external liberary, you should edit it to install dependent liberary. Also changing APP_NAME after installing the app will cuase uninstaller to not work currectly.
 
 ## Installation
You don't need to install anything to use this template!

## Support
If you have any question about this project, just let me know: m.r.bakhshayesh1123@gmail.com

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Authors and acknowledgment
Up to yet, its just me!

I will be glad if you help me improving this!

## License
 [MIT](https://choosealicense.com/licenses/mit/)

## Project status
Its almost finished!

But I am open to new suggestions!
