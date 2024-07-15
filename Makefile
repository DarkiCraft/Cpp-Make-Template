.RECIPEPREFIX := >

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++26

SRCS = $(wildcard src/*.cpp)

INC_DIRS := $(sort $(dir $(wildcard include/*)))
INC_FLAGS := $(addprefix -I, $(INC_DIRS))

LIB_DIRS := $(sort $(dir $(wildcard lib/*/)))
LIB_FLAGS := $(addprefix -L, $(LIB_DIRS))

LIB_NAMES := $(sort $(notdir $(wildcard lib/*)))
LINKER_FLAGS := $(addprefix -l, $(LIB_NAMES))

ADDITIONAL_LINKER_FLAGS := -lopengl32 -lgdi32 -lwinmm -lstdc++exp

main: main.cpp $(SRCS)
> $(CXX) $(CXXFLAGS) $(INC_FLAGS) $^ -o $@ $(LIB_FLAGS) $(LINKER_FLAGS) $(ADDITIONAL_LINKER_FLAGS)

.PHONY: main
