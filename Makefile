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
