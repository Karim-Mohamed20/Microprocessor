def chooseRegister(register):
    if (register == "R0"):
        return "000"
    elif (register == "R1"):
        return "001"
    elif (register == "R2"):
        return "010"
    elif (register == "R3"):
        return "011"
    elif (register == "R4"):
        return "100"
    elif (register == "R5"):
        return "101"
    elif (register == "R6"):
        return "110"
    else:
        return "111"


def repeat(digit, n):
    temp = digit
    for x in range(n):
        digit = digit+temp

    return digit

def assemblyConvert(assemblyInstruction):
    if (assemblyInstruction == "NOP"):
        return "16'b001_000_000_000_0000"
    elif (assemblyInstruction == "SETC"):
        return "16'b001_001_000_000_0000"
    elif (assemblyInstruction == "CLRC"):
        return "16'b001_010_000_000_0000"
    elif (assemblyInstruction == "RTI"):
        return "RTI"
    elif (assemblyInstruction == "RET"):
        return "RET"
    elif (assemblyInstruction == "POPF"):
        return "16'b011_101_001_011_000_0"
    elif (assemblyInstruction == "popWithoutWriteBack"):
        return "16'b111_001_001_011_000_0"
    elif (assemblyInstruction == "PopPcHig"):
        return "16'b011_110_001_011_000_0"
    elif (assemblyInstruction == "PopPclow"):
        return "16'b011_111_001_011_000_0"
    elif (assemblyInstruction.split()[0] == ".ORG"):
        return ".ORG"+" "+assemblyInstruction.split()[1]
    elif (assemblyInstruction.split()[0] == "NOT"):
        return "16'b001_011_000_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "IN"):
        return "16'b001_110_"+chooseRegister(assemblyInstruction.split()[1])+'_'+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "OUT"):
        return "16'b001_111_"+chooseRegister(assemblyInstruction.split()[1])+'_'+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "INC"):
        return "16'b001_100_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "DEC"):
        return "16'b001_101_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "IN"):
        return "16'b001_111_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "OUT"):
        return "16'b001_110_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "PUSH"):
        return "16'b010_000_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "POP"):
        return "16'b010_001_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "JZ"):
        return "16'b011_000_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "JN"):
        return "16'b011_001_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "JC"):
        return "16'b011_010_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "JMP"):
        return "16'b011_011_"+chooseRegister(assemblyInstruction.split()[1])+"_"+chooseRegister(assemblyInstruction.split()[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "CALL"):
        return "CALL"
    elif (assemblyInstruction== "pushPChighCall"):
        return "16'b111_010_001_011_000_0"
    elif (assemblyInstruction== "pushPClowCall"):
        return "16'b111_011_001_011_000_0"
    elif (assemblyInstruction.split()[0] == "MOV"):
        return "16'b000_000_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "ADD"):
        return "16'b000_001_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "SUB"):
        return "16'b000_010_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "AND"):
        return "16'b000_011_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "OR"):
        return "16'b000_100_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "LDD"):
        return "16'b010_011_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "STD"):
        return "16'b010_100"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[1])+"_0000"
    elif (assemblyInstruction.split()[0] == "LDM"):
        return "16'b010_010_000_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_000_1"+" "+"16'b"+repeat("0", 15-len(bin(int(assemblyInstruction.split()[1].split(",")[1]))[2:]))+bin(int(assemblyInstruction.split()[1].split(",")[1]))[2:]
    elif (assemblyInstruction.split()[0] == "SHL"):
        return "16'b000_101_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_000_1"+" "+"16'b"+repeat("0", 15-len(bin(int(assemblyInstruction.split()[1].split(",")[1]))[2:]))+bin(int(assemblyInstruction.split()[1].split(",")[1]))[2:]
    elif (assemblyInstruction.split()[0] == "SHR"):
        return "16'b000_110_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_"+chooseRegister(assemblyInstruction.split()[1].split(",")[0])+"_000_1"+" "+"16'b"+repeat("0", 15-len(bin(int(assemblyInstruction.split()[1].split(",")[1]))[2:]))+bin(int(assemblyInstruction.split()[1].split(",")[1]))[2:]
print('hello')

file = open('Instruction.txt', 'w')
index = 0
f = open("Read_Text.txt", "r")
text = f.read()
i = 0
while (i < len(text.splitlines())):
    instruction = assemblyConvert(text.splitlines()[i].strip())
    print(instruction)
    
    if(instruction.split()[0] == '.ORG'):
        file.write(
                "MemoryAddress ="+instruction.split()[1]+";\n")
    elif(instruction == 'RTI'):
        instruction = assemblyConvert('POPF')
        file.write(
            "Inputinstruction ="+instruction+";\n")
        if(index==0):
            file.write("#50\n")
            index = index+1
        else:
            file.write("#100\n")
        instruction = assemblyConvert('PopPclow')
        file.write(
            "Inputinstruction ="+instruction+";\n")
        file.write("#100\n")
        instruction = assemblyConvert('PopPcHig')
        file.write(
            "Inputinstruction ="+instruction+";\n")
        file.write("#100\n")
    elif(instruction == 'RET'):
        instruction = assemblyConvert('popWithoutWriteBack')
        file.write(
            "Inputinstruction ="+instruction+";\n")
        if(index==0):
            file.write("#50\n")
            index = index+1
        else:
            file.write("#100\n")
        instruction = assemblyConvert('PopPclow')
        file.write(
            "Inputinstruction ="+instruction+";\n")
        file.write("#100\n")
        instruction = assemblyConvert('PopPcHig')
        file.write(
            "Inputinstruction ="+instruction+";\n")
        file.write("#100\n")
    elif(instruction == 'CALL'):
        instruction1 = assemblyConvert('pushPChighCall')
        file.write(
            "Inputinstruction ="+instruction1+";\n")
        if(index==0):
            file.write("#50\n")
            index = index+1
        else:
            file.write("#100\n")
        instruction1 = assemblyConvert('pushPClowCall')
        file.write(
            "Inputinstruction ="+instruction1+";\n")
        file.write("#100\n")
        instruction1 = assemblyConvert('JMP '+text.splitlines()[i].split()[1])
        file.write(
            "Inputinstruction ="+instruction1.split()[0]+";\n")
        file.write("#100\n")
    elif (len(instruction.split()) == 1):
        file.write(
            "Inputinstruction ="+instruction+";\n")
        if(index==0):
            file.write("#50\n")
            index = index+1
        else:
            file.write("#100\n")
    else:
        file.write(
            "Inputinstruction ="+instruction.split()[0]+";\n")
        if(index==0):
            file.write("#50\n")
            index = index+1
        else:
            file.write("#100\n")
        index = index+1
        file.write(
            "Inputinstruction ="+instruction.split()[1]+";\n")
        file.write("#100\n")
    i = i+1
