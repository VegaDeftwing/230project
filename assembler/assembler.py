#!/usr/bin/python3.6
import os
import sys
print(" ")
print("-----------------------------------------------------------")
print("Assembler for CSCE230 project")
print("Made by Johnathan Carlson, Tyler Zinsmaster, Jake Edinger")
print("-----------------------------------------------------------")
print(" ")

#open assembly file for reading
#read a line
#tokenize line by spaces
#detect insturtion type (RType, DType, BType, JType)
OpCodeStr = "sub"
CondStr = "ls"
SStr = "n"
RTypeList = ["add","sub","and","or","xor","sll","cmp","jr"]
DTypeList = ["test","Test2"]
BTypeList = ["test","Test2"]
JTypeList = ["test","Test2"]
OpCode = ""
Cond = ""
S = ""
Opx = ""
RegD = ""
RegS = ""
RegT = ""
FinalInstruction = ""

def checkreg(RegStr):
    if RegStr == "r1"
        Reg = "0001"
    return Reg


def checks(SStr):
    if SStr == "n":
        S = "0"
    if SStr == "s":
        S = "1"
    return S

def checkcond(CondStr):
    if CondStr == "al":
        Cond = "0000"
    if CondStr == "nv":
        Cond = "0001"
    if CondStr == "eq":
        Cond = "0010"
    if CondStr == "ne":
        Cond = "0011"
    if CondStr == "vs":
        Cond = "0100"
    if CondStr == "vc":
        Cond = "0101"
    if CondStr == "mi":
        Cond = "0110"
    if CondStr == "pl":
        Cond = "0111"
    if CondStr == "cs":
        Cond = "1000"
    if CondStr == "cc":
        Cond = "1001"
    if CondStr == "hi":
        Cond = "1010"
    if CondStr == "ls":
        Cond = "1011"
    if CondStr == "gt":
        Cond = "1100"
    if CondStr == "lt":
        Cond = "1101"
    if CondStr == "ge":
        Cond = "1110"
    if CondStr == "le":
        Cond = "1111"
    return Cond

if OpCodeStr in RTypeList:
    print("RType ", end="")
    if OpCodeStr == "add":
        OpCode = "0000"
        Opx = "100"
    if OpCodeStr == "sub":
        OpCode = "0000"
        Opx = "011"
    if OpCodeStr == "and":
        OpCode = "0000"
        Opx = "111"
    if OpCodeStr == "or":
        OpCode = "0000"
        Opx = "110"
    if OpCodeStr == "xor":
        OpCode = "0000"
        Opx = "101"
    if OpCodeStr == "sll":
        OpCode = "0011"
        Opx = "000"
    if OpCodeStr == "cmp":
        OpCode = "0010"
        Opx = "000"
    if OpCodeStr == "jr":
        OpCode = OpCode + "0001"
        Opx = "000"
    Cond = checkcond(CondStr)
    S = checks(SStr)
elif OpCodeStr in DTypeList:
    print("DType Found")
elif OpCodeStr in BTypeList:
    print("BType Found")
elif OpCodeStr in JTypeList:
    print("JType Found")
else:
    print("Ya Dun Fucked Up")
    sys.exit(2)

#
# print(OpCode)
# print(Opx)
FinalInstruction = OpCode + Cond + S + Opx + RegD + RegS + RegT
print(FinalInstruction)
print("-----------------------------------------------------------")
print("Assembly Compeleted")
print(" ")
