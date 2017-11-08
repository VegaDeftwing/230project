#!/usr/bin/python3.6
import os
import sys
print(" ")
print("-----------------------------------------------------------")
print("Assembler for CSCE230 project")
print("\033[95m Made by Johnathan Carlson, Tyler Zinsmaster, Jake Ediger\033[92m")
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
outfile  = open("out.mif", "w")
OpCodeStr = ""
CondStr = ""
SStr = ""
RegStr1 = ""
RegStr2 = ""
RegStr3 = ""
OpCode = ""
Cond = ""
S = ""
Opx = ""
RegD = ""
RegS = ""
RegT = ""
RegStr = ""
Label = ""
FinalInstruction = ""
labels = [""]
addresses = [""]
i = 0
j = 0
OpCodeStra = " "
outputme = True

### Set up .mif file header:
outfile.write("WIDTH=24;\n")
outfile.write("DEPTH=1024;\n")
outfile.write("ADDRESS_RADIX=HEX;\n")
outfile.write("DATA_RADIX=BIN;\n")
outfile.write("CONTENT BEGIN\n")
outfile.write(" 0x0: 000000000000000000000000;\n")

tosixteen = ["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111"]
reglist = ["r0","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12","r13","r14","r15"]
condlist = ["al","nv","eq","ne","vs","vc","mi","pl","cs","cc","hi","ls","gt","lt","ge","le"]

RTypeList = ["add","sub","and","or","xor","sll","cmp","jr"]
DTypeList = ["addi","subi"]
DTMemList = ["lw","ldw","sw","stw"]
BTypeList = ["b","br","beq","bgt","blt","bge","ble","bal"]
JTypeList = ["test","Test2"]

def checkreg(RegStr):
    for i in range(len(tosixteen)):
        if RegStr == reglist[i]:
            Reg = tosixteen[i]
    return Reg

def checkcond(CondStr):
    for i in range(len(tosixteen)):
        if CondStr == condlist[i]:
            Cond = tosixteen[i]
    return Cond

#read a line
for line in inputfile:
    j = j + 1
    address = hex(j)
    line = line.lower()
    line = line.rstrip()
    StrArray = line.split()
    OpCodeStr = StrArray[0]
    if OpCodeStr in RTypeList:
        1 + 1
    elif OpCodeStr in DTypeList:
        1 + 1
    elif OpCodeStr in DTMemList:
        1 + 1
    elif OpCodeStr in BTypeList:
        1 + 1
    elif OpCodeStr in JTypeList:
        1 + 1
    else:
        label = StrArray[0].rstrip(':')
        labels.append(label)
        addresses.append(address)
        print(label +" @"+ address)
        j = j - 1

print("-----------------------------------------------------------")
inputfile.close
inputfile  = open("inputfile", "r")
for line in inputfile:
    i = i + 1
    address = hex(i)
    line = line.lower()
    line = line.replace(',',' ')
    line = line.replace('(',' ')
    line = line.replace(')',' ')
    line = line.rstrip()
    StrArray = line.split()
    OpCodeStr = StrArray[0] # The First thing tokenized out will be the OpCode
    if OpCodeStr in RTypeList:
        print(line + " \033[95m RType \033[96m", end="")
        if len(StrArray) == 4:
            RegStr1 = StrArray[1]
            RegStr2 = StrArray[2]
            RegStr3 = StrArray[3]
            S = "0"
            CondStr = "al"
        elif len(StrArray) == 5:
            if StrArray[1] == "s":
                S = "1"
                CondStr = "al"
            else:
                S = "0"
                CondStr = StrArray [1]
            RegStr1 = StrArray[2]
            RegStr2 = StrArray[3]
            RegStr3 = StrArray[4]
        elif len(StrArray) == 6:
            CondStr = StrArray[1]
            S = "1"
            RegStr1 = StrArray[3]
            RegStr2 = StrArray[4]
            RegStr3 = StrArray[5]
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
        RegD = checkreg(RegStr1)
        RegS = checkreg(RegStr2)
        RegT = checkreg(RegStr3)
        FinalInstruction = OpCode + Cond + S + Opx + RegD + RegS + RegT
    elif OpCodeStr in DTypeList:
        print(line + " \033[95m DType \033[96m", end="")
        if len(StrArray) == 4: #No "S" or "Cond"
            # if int(StrArray[1]) > 0b1111111:
            #     print("Immediate Value out of bounds")
            # else:
            #     immediate = bin(StrArray[1])
            immediate = bin(int(StrArray[3]))
            immediate = bin(int(StrArray[3])).lstrip('-0b').zfill(7)
            S = "0"
            CondStr = "al"
            RegStr2 = StrArray[1]
            RegStr3 = StrArray[2]

        if len(StrArray) == 5: #Check if its "S" or "Cond"
            if StrArray[1] == "s":
                S = "1"
                CondStr = "al"
            else:
                S = "0"
                CondStr = StrArray [1]
            if StrArray[4] > 0b1111111:
                print("Immediate Value out of bounds")
            else:
                immediate = bin(StrArray[2])
            RegStr2 = StrArray[2]
            RegStr3 = StrArray[3]
        if len(StrArray) == 6: #Everything is there
            CondStr = StrArray[1]
            S = 1
            if StrArray[5] > 0b1111111:
                print("Immediate Value out of bounds")
            else:
                immediate = bin(StrArray[3]).lstrip('-0b').zfill(7)
            RegStr2 = StrArray[3]
            RegStr3 = StrArray[4]
        if OpCodeStr == "addi":
            OpCode = "0110"
        if OpCodeStr == "subi":
            OpCode = "0110"
            immediate = int(immediate,2) ^ 0b1111111
            immediate = immediate + 0b1
            immediate = bin(immediate).lstrip('-0b').zfill(7)
        Cond = checkcond(CondStr)
        RegS = checkreg(RegStr2)
        RegT = checkreg(RegStr3)
        FinalInstruction = OpCode + Cond + S + immediate + RegS + RegT
    elif OpCodeStr in DTMemList:
        #ldw r1 (4)r2
        print(line + " \033[95m DType \033[96m", end="")
        if len(StrArray) == 4: #No "S" or "Cond"
            if int(StrArray[2]) > 127:
                print("Immediate Value out of bounds")
            immediate = bin(int(StrArray[2])).lstrip('-0b').zfill(7)
            S = "0"
            CondStr = "al"
            RegStr2 = StrArray[1]
            RegStr3 = StrArray[3]

        if len(StrArray) == 5: #Check if its "S" or "Cond"
            if StrArray[1] == "s":
                S = "1"
                CondStr = "al"
            else:
                S = "0"
                CondStr = StrArray [1]
            if int(StrArray[3]) > 127:
                print("Immediate Value out of bounds")
            RegStr2 = StrArray[2]
            RegStr3 = StrArray[4]
        if len(StrArray) == 6: #Everything is there
            CondStr = StrArray[1]
            S = "1"
            if int(StrArray[4]) > 127:
                print("Immediate Value out of bounds")
            else:
                immediate = bin(int(StrArray[4])).lstrip('-0b').zfill(7)
            RegStr2 = StrArray[3]
            RegStr3 = StrArray[5]
        if OpCodeStr == "ldw" or OpCodeStr == "lw":
            OpCode = "0100"
        if OpCodeStr == "stw" or OpCodeStr == "sw":
            OpCode = "0101"
        Cond = checkcond(CondStr)
        RegS = checkreg(RegStr2)
        RegT = checkreg(RegStr3)
        FinalInstruction = OpCode + Cond + S + immediate + RegS + RegT
    elif OpCodeStr in BTypeList:
        print(line + " \033[95m BType \033[96m", end="")
        if len(StrArray) == 3:
            CondStr = StrArray[1]
            Label = StrArray[2]
        else:
            CondStr = "al"
            Label = StrArray[1]
        if OpCodeStr == "bal":
            OpCode = "1001"
        else:
            OpCode = "1000"
        if OpCodeStr == "beq":
            CondStr = "eq"
        if OpCodeStr == "bgt":
            CondStr = "gt"
        if OpCodeStr == "blt":
            CondStr = "lt"
        if OpCodeStr == "bge":
            CondStr = "ge"
        if OpCodeStr == "ble":
            CondStr = "le"
        Cond = checkcond(CondStr)

    elif OpCodeStr in JTypeList:
        print(line + " \033[95m JType \033[96m", end="")
    else:
        1 + 1

        # print("Ya Dun Fucked Up")
        # sys.exit(2)

    #
    # print(OpCode)
    # print(Opx)
    FinalInstructionStr = len(str(FinalInstruction))
    FinalInstructionHex = '{:06X}'.format(int(FinalInstruction, 2))
    if str(FinalInstructionStr) == "24":
        FinalInstructionStr = "\033[92m[OK]"
    else:
        FinalInstructionStr = "\033[91m[FAIL]"
    if outputme:
        print(FinalInstruction + " " + str(FinalInstructionStr) + " 0x"+ FinalInstructionHex  + " Address: " + address )
        outfile.write(" " + str(address)+": "+str(FinalInstruction)+";\n")
    outputme = True
# TODO: output the 00 array at the end too

print(hex(1024) + "-"+ hex(i+1))
outfile.write(" ["+ hex(i+1) + ".."+ hex(1024) + "] : 000000000000000000000000;\n" )
outfile.write("END;\n")
print("-----------------------------------------------------------")
print("Assembly Compeleted")
print(" ")
inputfile.close
print("-----------------------------------------------------------")
print(" ")
print(labels)
print(addresses)
