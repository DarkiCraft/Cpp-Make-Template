# Cpp-Make-Template

This repository contains a Makefile template designed for C++ projects, simplifying the build process and allowing for easy integration of external libraries on a Windows platform.

## Features

- Detects source files in the `src/` directory.
- Includes header files in the `include/` directory.
- Links external libraries in the `lib/` directory.
- [Raylib](https://github.com/raysan5/raylib) and [{fmt}](https://github.com/fmtlib/fmt) libraries are pre-configured as examples.

## Directory Structure

The template uses the following directory structure:
```sh
project-root/
│
├── include/
│ ├── library1/
│ └── library2/
│
├── lib/
│ ├── library1/
│ └── library2/
│
├── src/
│ └── source_files.cpp
│
├── main.cpp
└── Makefile
```

## Makefile Overview

```makefile
.RECIPEPREFIX := >

CXX = g++  # change to gcc to compile C programs
CXXFLAGS = -Wall -Wextra  # change compiler flags as needed

SRCS = $(wildcard src/*.c) $(wildcard src/*.cpp) $(wildcard src/*.cc)

INC_DIRS := $(sort $(dir $(wildcard include/*)))
INC_FLAGS := $(addprefix -I, $(INC_DIRS))

LIB_DIRS := $(sort $(dir $(wildcard lib/*/)))
LIB_FLAGS := $(addprefix -L, $(LIB_DIRS))

LIB_NAMES := $(sort $(notdir $(wildcard lib/*)))
LINKER_FLAGS := $(addprefix -l, $(LIB_NAMES))

ADDITIONAL_LINKER_FLAGS := -lopengl32 -lgdi32 -lwinmm  # change linnker flags as needed

main: main.cpp $(SRCS)
> $(CXX) $(CXXFLAGS) $(INC_FLAGS) $^ -o $@ $(LIB_FLAGS) $(LINKER_FLAGS) $(ADDITIONAL_LINKER_FLAGS)

.PHONY: main
```

## Instructions:

### 1. Clone the repository
  
```sh
git clone https://github.com/DarkiCraft/Cpp-Make-Template.git
cd Cpp-Make-Template
```
Rename the directory to your project name.
  
### 2. Add source files
     
`main.cpp` is the entry point of the program. Add your additional source files in the `src/` directory.
  
### 3. Add header files
  
Add your source files' respective header files (if any) in the `include/` directory. If you are creating subdirectories in the `include/` directory, make sure to include them properly in your code:
  
```cpp
#include "subdirectory/header.h"
```
### 4. Add External Libraries (Optional)
  
To add external libraries to your project, follow these steps:
  
#### i. Organize Header Files:
  
Place the header files of the external library in the `include/` directory.
It's recommended to use a subdirectory for each library for better organization.
For example, for the [Raylib](https://github.com/raysan5/raylib) library, place the header files in `include/raylib/`.
  
```sh
include/
└── raylib/
   └── raylib.h
   └── raymath.h
   └── rlgl.h
```
  
#### ii. Organize Compiled Library Files:
  
Place the compiled library files in the `lib/` directory.
Ensure the subdirectory name matches the linking flag required by the library.
For example, for the [Raylib](https://github.com/raysan5/raylib) library, place the compiled library file in `lib/raylib/`.
  
```sh
lib/
└── raylib/         # `raylib` matches the -lraylib linker flag
  └── librarylib.a  # raylib compiled library
```
  
#### iii. Update Makefile:
  
Add any additional linker flags required by the library to the `ADDITIONAL_LINKER_FLAGS` variable.
For example, the [Raylib](https://github.com/raysan5/raylib) library requires additional linker flags: `-lopengl32`, `-lgdi32`, and `-lwinmm`.
  
```makefile
ADDITIONAL_LINKER_FLAGS := -lopengl32 -lgdi32 -lwinmm
```

Refer to the respective library's documentation for the specific linker flags which may be required.

### 5. Build the project
  
The project can be built by running the following whilst in the `project-root/`:
  
```sh
make main
```
   
This will create a `main.exe` file in the `project-root/` directory.

## License

This project is licensed under the [Unlicense](https://unlicense.org/).
