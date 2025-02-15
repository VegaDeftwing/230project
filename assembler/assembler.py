#!/usr/bin/python3.6
import math
import sys
print(" ")
print("-----------------------------------------------------------------------------------")
print(" Assembler for CSCE230 project")
print("\033[95m Made by Johnathan Carlson, Tyler Zinsmaster, Jake Ediger\033[92m")
print("-----------------------------------------------------------------------------------")

#File I/O
inputfile  = open(sys.argv[1], "r")
outfile  = open("MemoryInitialization.mif", "w")

#Initalizations
lireg = LabelStr = Derefaddr = Label = FinalInstruction = Cond = RegD = RegS = RegT = RegStr = Opx = S = OpCode = RegStr3 = RegStr2 = RegStr1 = OpCodeStr = SStr = CondStr = ""
labels = [""]
addresses = [""]
i = j = 13
k = 0
outputme = True

### Set up .mif file header:
outfile.write("WIDTH=24;\n")
outfile.write("DEPTH=1024;\n")
outfile.write("ADDRESS_RADIX=UNS;\n")
outfile.write("DATA_RADIX=BIN;\n")
outfile.write("CONTENT BEGIN\n")
outfile.write(" 0: 000000000000000000000000;\n")
outfile.write(" 1: 110000000000000000001101;\n")
outfile.write(" 2: 000000001000000000000000;\n")
outfile.write(" 3: 000000000100000000000000;\n")
outfile.write(" 4: 000000000010000000000000;\n")
outfile.write(" 5: 000000000101000000000000;\n")
outfile.write(" 6: 000000000110000000000000;\n")
outfile.write(" 7: 000000000111000000000000;\n")
outfile.write(" 8: 000000000001000000000000;\n")
outfile.write(" 9: 000000000011000000000000;\n")
outfile.write(" 10: 000000001110000000000000;\n")
outfile.write(" 11: 000000001111000000000000;\n")
outfile.write(" 12: 111111111111111111111111;\n")
outfile.write(" 13: 000000000000000000000000;\n")

#Define some lists containing useful data
tosixteen = ["0000","0001","0010","0011","0100","0101","0110","0111","1000","1001","1010","1011","1100","1101","1110","1111"]
reglist = ["r0","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12","r13","r14","r15"]
condlist = ["al","nv","eq","ne","vs","vc","mi","pl","cs","cc","hi","ls","gt","lt","ge","le"]
RTypeList = ["add","sub","and","or","xor","sll"]
DTypeList = ["addi","subi"]
DTMemList = ["lw","ldw","sw","stw"]
BTypeList = ["b","br","beq","bgt","blt","bge","ble","bal","bne"]
JTypeList = ["j","jal","li"]

# convert value in form of hex(0x), binary (0b), or decimal (no-prefix)
# to binary with padding
def tobin(value,bitcount):
    if value[0] == "-":
        value = value[1:]
        value = int(value)
        value = bin(value)[2:]
        value = int(value,2) ^ int(math.pow(2,bitcount)-1) #TODO: make this number match bitcount
        if value < (int(int(math.pow(2,bitcount)-1)/2)+1):
            print("~~~You Fucked up!~~~", end="")

        value = value + 0b1
        value = bin(value).lstrip('0b').zfill(bitcount)
    elif len(value) > 2:
        if value[1] == 'x': #value begings with 0x (HEX) turn into binar
            value = value[2:]
            value = int(value,16)
            if value > 63:
                print("~~~You Fucked up!~~~")
            value = bin(value)[2:]
            value = value.zfill(bitcount)
        elif value[1] == 'b': #value begings with 0b (BIN) use raw with zfill
            value = value[2:]
            value = value.zfill(bitcount)
        else:
            value = int(value)
            print(value)
            if value > 63:
                print("~~~You Fucked up!~~~")
            value = bin(value)[2:]
            value = value.zfill(bitcount)
    else: #assume base 10, convert to binary
        value = int(value)
        if value > 63:
            print("~~~You Fucked up!~~~")
        value = bin(value)[2:]
        value = value.zfill(bitcount)
    return(value)

# find the index of the input register and corolate it to it's hex value
def checkreg(RegStr):
    for i in range(len(tosixteen)):
        if RegStr == reglist[i]:
            Reg = tosixteen[i]
        if RegStr == "sp":
            Reg = "1110"
    return Reg

# find the index of the input conditon and corolate it to it's hex value
def checkcond(CondStr):
    for i in range(len(tosixteen)):
        if CondStr == condlist[i]:
            Cond = tosixteen[i]
    return Cond

#First pass, find the address of each label
for line in inputfile:
    j = j + 1
    address = hex(j)
    line = line.lower()
    line = line.rstrip()
    StrArray = line.split()
    OpCodeStr = StrArray[0]
    if OpCodeStr in RTypeList or OpCodeStr in DTypeList or OpCodeStr in DTMemList or OpCodeStr in BTypeList or OpCodeStr in JTypeList:
        print(".",end="")
    elif OpCodeStr == "cmp" or OpCodeStr == "jr" or OpCodeStr == "nop":
        print(".",end="")
    else:
        if StrArray[0][0] != "#":
            label = StrArray[0].rstrip(':')
            labels.append(label)
            addresses.append(address)
            print("\033[97m" + label +" @"+ address + "\033[92m")
        j = j - 1
print("")
print("-----------------------------------------------------------------------------------")
inputfile.close
print( "\033[95m                   IODEF\033[96m 000000000000000000000000 \033[92m[IO] \033[96m" + hex(int("000000000000000000000000",2)) + "      \033[92mAddress: 0x0")
print( "\033[95mJUMP OVER DATA --> IODEF\033[96m 110000000000000000001101 \033[92m[IO] \033[96m" + hex(int("110000000000000000001101",2)) + " \033[92mAddress: 0x1")
print( "\033[95mSLIDER SWITCHES -> IODEF\033[96m 000000001000000000000000 \033[92m[IO] \033[96m" + hex(int("000000001000000000000000",2)) + "   \033[92mAddress: 0x2")
print( "\033[95mPUSH BUTTONS ----> IODEF\033[96m 000000000100000000000000 \033[92m[IO] \033[96m" + hex(int("000000000100000000000000",2)) + "   \033[92mAddress: 0x3")
print( "\033[95m7-SEG DISPLAY0 --> IODEF\033[96m 000000000010000000000000 \033[92m[IO] \033[96m" + hex(int("000000000010000000000000",2)) + "   \033[92mAddress: 0x4")
print( "\033[95m7-SEG DISPLAY1 --> IODEF\033[96m 000000000101000000000000 \033[92m[IO] \033[96m" + hex(int("000000000101000000000000",2)) + "   \033[92mAddress: 0x5")
print( "\033[95m7-SEG DISPLAY2 --> IODEF\033[96m 000000000110000000000000 \033[92m[IO] \033[96m" + hex(int("000000000110000000000000",2)) + "   \033[92mAddress: 0x6")
print( "\033[95m7-SEG DISPLAY3 --> IODEF\033[96m 000000000111000000000000 \033[92m[IO] \033[96m" + hex(int("000000000111000000000000",2)) + "   \033[92mAddress: 0x7")
print( "\033[95mGREEN LEDS ------> IODEF\033[96m 000000000001000000000000 \033[92m[IO] \033[96m" + hex(int("000000000001000000000000",2)) + "   \033[92mAddress: 0x8")
print( "\033[95mRED LEDS --------> IODEF\033[96m 000000000011000000000000 \033[92m[IO] \033[96m" + hex(int("000000000011000000000000",2)) + "   \033[92mAddress: 0x9")
print( "\033[95mGPIO IN ---------> IODEF\033[96m 000000001110000000000000 \033[92m[IO] \033[96m" + hex(int("000000001110000000000000",2)) + "   \033[92mAddress: 0xa")
print( "\033[95mGPIO OUT --------> IODEF\033[96m 000000001111000000000000 \033[92m[IO] \033[96m" + hex(int("000000000001000000000000",2)) + "   \033[92mAddress: 0xb")
print( "\033[95mMAX VAL ---------> IODEF\033[96m 111111111111111111111111 \033[92m[IO] \033[96m" + hex(int("111111111111111111111111",2)) + " \033[92mAddress: 0xc")
print( "\033[95m                   IODEF\033[96m 000000000000000000000000 \033[92m[IO] \033[96m" + hex(int("000000000000000000000000",2)) + "      \033[92mAddress: 0xd")
#Second Pass, Instrction to Binary conversion and some error checknig
inputfile  = open(sys.argv[1], "r")
for line in inputfile:
    # Count each line, and convert that count to the address in hex
    i = i + 1
    address = hex(i)

    #Sanatize input
    line = line.lower()
    line = line.replace(',',' ')
    line = line.replace('(',' ')
    line = line.replace(')',' ')
    line = line.rstrip()
    line = "{:<17}".format(line)

    #Tokenize the line by spaces
    StrArray = line.split()
    #The OpCodeStr will always be the first thing in the array
    OpCodeStr = StrArray[0]
    #Check if it's an Rtype, if so, find out how many arguments were given
    #and generate the Instrction based on the input
    if OpCodeStr == "cmp":
        print(line + " \033[95m RType \033[96m", end="")
        if len(StrArray) == 3:
            Cond = "0000"
            RegS = checkreg(StrArray[1])
            RegT = checkreg(StrArray[2])
        else:
            Cond = checkcond(StrArray[1])
            RegS = checkreg(StrArray[2])
            RegT = checkreg(StrArray[3])
        OpCode = "0010"
        Opx = "000"
        S = "1"
        RegD = "0000"
        FinalInstruction = OpCode + Cond + S + Opx + RegD + RegS + RegT

    elif OpCodeStr == "jr":
        print(line + " \033[95m RType \033[96m", end="")
        OpCode = "0001"
        Opx = "000"
        Cond = "0000"
        S = "0"
        RegD = "0000"
        RegS = checkreg(StrArray[1])
        RegT = "0000"
        FinalInstruction = OpCode + Cond + S + Opx + RegD + RegS + RegT

    elif OpCodeStr == "nop":
        print(line + " \033[95m NO OP \033[96m", end="")
        FinalInstruction = "000000000100000000000000"

    elif OpCodeStr in RTypeList:
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
        if OpCodeStr == "mult":
            OpCode = "0000"
            Opx = "010"
        if OpCodeStr == "sll":
            OpCode = "0011"
            Opx = "000"
        Cond = checkcond(CondStr)
        RegD = checkreg(RegStr1)
        RegS = checkreg(RegStr2)
        RegT = checkreg(RegStr3)
        FinalInstruction = OpCode + Cond + S + Opx + RegD + RegS + RegT

    # DType Instrctions that don't have the memory offset format
    # such as addi and subi Checks length to be sure bits
    # not set in the input take on default values
    elif OpCodeStr in DTypeList:
        print(line + " \033[95m DType \033[96m", end="")
        if len(StrArray) == 4: #No "S" or "Cond"
            immediate = tobin(StrArray[3],7)
            S = "0"
            CondStr = "al"
            RegStr2 = StrArray[2]
            RegStr3 = StrArray[1]

        if len(StrArray) == 5: #Check if its "S" or "Cond"
            if StrArray[1] == "s":
                S = "1"
                CondStr = "al"
            else:
                S = "0"
                CondStr = StrArray [1]
            immediate = tobin(StrArray[4],7)
            RegStr2 = StrArray[3]
            RegStr3 = StrArray[2]
        if len(StrArray) == 6: #Everything is there
            CondStr = StrArray[1]
            S = 1
            immediate = tobin(StrArray[5],7)
            RegStr2 = StrArray[4]
            RegStr3 = StrArray[3]
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

    # D type Instrctions that use the memory offset syntax
    elif OpCodeStr in DTMemList:
        print(line + " \033[95m DType \033[96m", end="")
        if len(StrArray) == 4: #No "S" or "Cond"
            immediate = tobin(StrArray[2],7)
            S = "0"
            CondStr = "al"
            RegStr2 = StrArray[3]
            RegStr3 = StrArray[1]

        if len(StrArray) == 5: #Check if its "S" or "Cond"
            if StrArray[1] == "s":
                S = "1"
                CondStr = "al"
            else:
                S = "0"
                CondStr = StrArray [1]
            immediate = tobin(StrArray[3],7)
            RegStr2 = StrArray[4]
            RegStr3 = StrArray[2]
        if len(StrArray) == 6: #Everything is there
            CondStr = StrArray[1]
            S = "1"
            immediate = tobin(StrArray[4],7)
            RegStr2 = StrArray[5]
            RegStr3 = StrArray[3]
        if OpCodeStr == "ldw" or OpCodeStr == "lw":
            OpCode = "0100"
        if OpCodeStr == "stw" or OpCodeStr == "sw":
            OpCode = "0101"
        Cond = checkcond(CondStr)
        RegS = checkreg(RegStr2)
        RegT = checkreg(RegStr3)
        FinalInstruction = OpCode + Cond + S + immediate + RegS + RegT

    # Branch types need the labels from above to be derefrenced
    # Also implimented are common Op+Cond conditions that are in the
    # NIOS ISA
    elif OpCodeStr in BTypeList:
        print(line + " \033[95m BType \033[96m", end="")
        if len(StrArray) == 3:
            CondStr = StrArray[1]
            Label = StrArray[2]
        else:
            CondStr = "al"
            Cond = checkcond(CondStr)
            LabelStr = StrArray[1]
        if OpCodeStr == "bal":
            OpCode = "1001"
        else:
            OpCode = "1000"
        if OpCodeStr == "beq":
            CondStr = "eq"
        if OpCodeStr == "bne":
            CondStr = "ne"
        if OpCodeStr == "bgt":
            CondStr = "gt"
        if OpCodeStr == "blt":
            CondStr = "lt"
        if OpCodeStr == "bge":
            CondStr = "ge"
        if OpCodeStr == "ble":
            CondStr = "le"
        Cond = checkcond(CondStr)
        for l in labels:
            k = k + 1
            if l == LabelStr:
                Derefaddr = addresses[k-1]

        Derefaddr = Derefaddr[2:]
        Derefaddr = int(Derefaddr,16)
        Derefaddr = Derefaddr - i - 1
        if Derefaddr > 0:
            Derefaddr = bin(Derefaddr)[2:]
            Derefaddr = Derefaddr.zfill(16)
        else:
            Derefaddr = bin(Derefaddr)[3:]
            Derefaddr = int(Derefaddr,2) ^ 0xffff
            Derefaddr = Derefaddr + 0b1
            Derefaddr = bin(Derefaddr)[2:]

        FinalInstruction = OpCode + Cond + Derefaddr
    elif OpCodeStr in JTypeList:
        print(line + " \033[95m JType \033[96m", end="")
        if OpCodeStr == "j":
            OpCode = "1100"
            Offset = StrArray[1]
            Offset = tobin(Offset,20)
        if OpCodeStr == "jal":
            OpCode = "1101"
            Offset = StrArray[1]
            Offset = tobin(Offset,20)
        if OpCodeStr == "li":
            OpCode = "1110"
            Offset = StrArray[2]
            Offset = tobin(Offset,16)
            lireg = StrArray[1]
            lireg = checkreg(lireg)

        FinalInstruction = OpCode + lireg + Offset
    else:
        if StrArray[0][0] != "#":
            label = StrArray[0].rstrip(':')
            print("\033[97m" + label +" @"+ address + "\033[92m")
        i = i - 1
        outputme = False

    FinalInstructionStr = len(str(FinalInstruction))
    FinalInstructionHex = '{:06X}'.format(int(FinalInstruction, 2))
    k = 0

    # Check that Instrctions are actually 24 bits
    if str(FinalInstructionStr) == "24":
        FinalInstructionStr = "\033[92m[OK]"
    else:
        FinalInstructionStr = "\033[91m[FAIL]" + str(FinalInstructionStr)
    if outputme:
        print(FinalInstruction + " " + str(FinalInstructionStr) + "\033[96m 0x"+ FinalInstructionHex + "\033[92m Address: " + address, end="" )
        if OpCodeStr in BTypeList:
            if Derefaddr != " ":
                if int(Derefaddr[2:],16) < 0x7fff:
                    StrDerefaddr = 0
                    StrDerefaddr = int(Derefaddr,2)
                    StrDerefaddr = str(StrDerefaddr)
                    print(" \033[91m Branch down: " + StrDerefaddr + " (" + hex(int(Derefaddr,2)) + ")" + "\033[92m")
                else:
                    NegDerefaddr = 0
                    NegDerefaddr = int(Derefaddr,2) ^ 0xffff - 1
                    NegDerefaddr = str(NegDerefaddr)
                    print(" \033[91m Branch up: " + NegDerefaddr + " (" + hex(int(Derefaddr,2)) + ")" + "\033[92m")
            else:
                print("\033[91m  INVALID LABEL  \033[92m")
        else:
            print("")

        #Output to .mif file
        outfile.write(" " + str(i) +": "+str(FinalInstruction)+";\n")
    outputme = True
    Derefaddr = " "
#Finish writing some output file stuff
print("Filling Extra Memory: \033[91m" + hex(1024) + "-"+ hex(i+1) + "\033[92m")
outfile.write(" ["+ str(i) + ".."+ "1023" + "] : 000000000000000000000000;\n" )
outfile.write("END;\n")
print("-----------------------------------------------------------------------------------")
print("~~~~~~~~~~~~~~~~~~~Assembly Compeleted~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
inputfile.close
print("-----------------------------------------------------------------------------------")
print(" ")
