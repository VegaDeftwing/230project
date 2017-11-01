#!/usr/bin/python3.6
import os
import sys
print(" ")
print("-----------------------------------------------------------")
print("Assembler for CSCE230 project")
print("\033[95m Made by Johnathan Carlson, Tyler Zinsmaster, Jake Edinger\033[96m")
print("-----------------------------------------------------------")
print(" ")

### INFO ###
#R
#OP Cond S opx RegD regS regT
#D
#Op Cond S immed regS regT
#B
#Op Cond Label
#J
#Op Const

#open assembly file for reading
inputfile  = open("inputfile", "r")
print(inputfile.readline())
OpCodeStr = "sub"
CondStr = "ls"
SStr = "n"
RegStr1 = "r1"
RegStr2 = "r2"
RegStr3 = "r3"
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
RegStr = ""
FinalInstruction = ""

def checkreg(RegStr):
    if RegStr == "r0":
        Reg = "0000"
    if RegStr == "r1":
        Reg = "0001"
    if RegStr == "r2":
        Reg = "0010"
    if RegStr == "r3":
        Reg = "0011"
    if RegStr == "r4":
        Reg = "0100"
    if RegStr == "r5":
        Reg = "0101"
    if RegStr == "r6":
        Reg = "0110"
    if RegStr == "r7":
        Reg = "0111"
    if RegStr == "r8":
        Reg = "1000"
    if RegStr == "r9":
        Reg = "1001"
    if RegStr == "r10":
        Reg = "1010"
    if RegStr == "r11":
        Reg = "1011"
    if RegStr == "r12":
        Reg = "1100"
    if RegStr == "r13":
        Reg = "1101"
    if RegStr == "r14":
        Reg = "1110"
    if RegStr == "r15":
        Reg = "1111"
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

#read a line
for line in inputfile:
    print(line, end='')
    
#tokenize line by spaces
#detect insturtion type (RType, DType, BType, JType)
    if OpCodeStr in RTypeList:
        print("\033[95m RType \033[96m", end="")
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
        RegD = checkreg(RegStr1)
        RegS = checkreg(RegStr2)
        RegT = checkreg(RegStr3)
        FinalInstruction = OpCode + Cond + S + Opx + RegD + RegS + RegT
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
    FinalInstructionStr = len(str(FinalInstruction))
    if str(FinalInstructionStr) == "24":
        FinalInstructionStr = "\033[92m[OK]"
    else:
        FinalInstructionStr = "\033[91m[FAIL]"
    print(FinalInstruction + " " + str(FinalInstructionStr))
    print("-----------------------------------------------------------")
    print("Assembly Compeleted")
    print(" ")
    inputfile.close
