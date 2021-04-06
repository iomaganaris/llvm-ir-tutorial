#!/bin/bash

# Generate LLVM IR from test.cpp file
clang -emit-llvm -S test.cpp -o test.cpp.ll

# Optimize LLVM IR file
opt -S -O3 -march=x86-64 -mcpu=skylake-avx512 test.ll -o test_optimized.ll

# Create assembly file from test.ll file (LLVM IR)
llc test.ll

# Create executable from assembly file
clang test.s -o test.exe

# Run executable
./text.exe
