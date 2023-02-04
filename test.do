vlog -reportprogress 300 -work work D:/Project8/Project/ALU.v
vlog -reportprogress 300 -work work D:/Project8/Project/CU.v
vlog -reportprogress 300 -work work D:/Project8/Project/DataMemory.v
vlog -reportprogress 300 -work work D:/Project8/Project/FetchInstruction.v
vlog -reportprogress 300 -work work D:/Project8/Project/ForwardPC.v
vlog -reportprogress 300 -work work D:/Project8/Project/FU.v
vlog -reportprogress 300 -work work D:/Project8/Project/ID_IE.v
vlog -reportprogress 300 -work work D:/Project8/Project/IE_IM.v
vlog -reportprogress 300 -work work D:/Project8/Project/IF_ID.v
vlog -reportprogress 300 -work work D:/Project8/Project/IM_IW.v
vlog -reportprogress 300 -work work D:/Project8/Project/InsructionMemory.v
vlog -reportprogress 300 -work work D:/Project8/Project/InterruptDedector.v
vlog -reportprogress 300 -work work D:/Project8/Project/INTMUX.v
vlog -reportprogress 300 -work work D:/Project8/Project/main.v
vlog -reportprogress 300 -work work D:/Project8/Project/Mux1.v
vlog -reportprogress 300 -work work D:/Project8/Project/Mux2.v
vlog -reportprogress 300 -work work D:/Project8/Project/PcWrite.v
vlog -reportprogress 300 -work work D:/Project8/Project/Project_tb.v
vlog -reportprogress 300 -work work D:/Project8/Project/regfile.v
vsim -gui work.Pipeline_Tb
add wave -position insertpoint  \
sim:/Pipeline_Tb/clk \
sim:/Pipeline_Tb/InPort \
sim:/Pipeline_Tb/Inputinstruction \
sim:/Pipeline_Tb/INT \
sim:/Pipeline_Tb/MemoryAddress \
sim:/Pipeline_Tb/outPort \
sim:/Pipeline_Tb/rst \
sim:/Pipeline_Tb/writeInstruction
add wave -position insertpoint  \
sim:/Pipeline_Tb/Main/AluOp \
sim:/Pipeline_Tb/Main/aluOp1 \
sim:/Pipeline_Tb/Main/aluOp2 \
sim:/Pipeline_Tb/Main/aluOut \
sim:/Pipeline_Tb/Main/BrachEnable \
sim:/Pipeline_Tb/Main/Branch \
sim:/Pipeline_Tb/Main/BranchAddress \
sim:/Pipeline_Tb/Main/bufInstOut \
sim:/Pipeline_Tb/Main/clk \
sim:/Pipeline_Tb/Main/CUopcode \
sim:/Pipeline_Tb/Main/decSP \
sim:/Pipeline_Tb/Main/flags \
sim:/Pipeline_Tb/Main/FlagsSelector \
sim:/Pipeline_Tb/Main/flush \
sim:/Pipeline_Tb/Main/ForwardedMemoryData \
sim:/Pipeline_Tb/Main/ForwardPCHighCall \
sim:/Pipeline_Tb/Main/ForwardPCLowCall \
sim:/Pipeline_Tb/Main/ForwardSP \
sim:/Pipeline_Tb/Main/HalfPcSelector \
sim:/Pipeline_Tb/Main/IE_AluOpOut \
sim:/Pipeline_Tb/Main/IE_BranchOut \
sim:/Pipeline_Tb/Main/IE_ForwardPCHighCall \
sim:/Pipeline_Tb/Main/IE_ForwardPCLowCall \
sim:/Pipeline_Tb/Main/IE_ImmediateOut \
sim:/Pipeline_Tb/Main/IE_Ininst \
sim:/Pipeline_Tb/Main/IE_JC \
sim:/Pipeline_Tb/Main/IE_JN \
sim:/Pipeline_Tb/Main/IE_JZ \
sim:/Pipeline_Tb/Main/IE_loaduseCase \
sim:/Pipeline_Tb/Main/IE_MemReadOut \
sim:/Pipeline_Tb/Main/IE_MemWriteOut \
sim:/Pipeline_Tb/Main/IE_outinst \
sim:/Pipeline_Tb/Main/IE_RdstAddressOut \
sim:/Pipeline_Tb/Main/IE_RdstDataOut \
sim:/Pipeline_Tb/Main/IE_RsrcAddressOut \
sim:/Pipeline_Tb/Main/IE_RsrcDataOut \
sim:/Pipeline_Tb/Main/IE_ShiftOut \
sim:/Pipeline_Tb/Main/IE_WBOut \
sim:/Pipeline_Tb/Main/IE_writeFlag \
sim:/Pipeline_Tb/Main/IE_writePcHigh \
sim:/Pipeline_Tb/Main/IE_writePcLow \
sim:/Pipeline_Tb/Main/IF_Inport \
sim:/Pipeline_Tb/Main/IM_AluOpOut \
sim:/Pipeline_Tb/Main/IM_AluOut \
sim:/Pipeline_Tb/Main/IM_BranchOut \
sim:/Pipeline_Tb/Main/IM_flags \
sim:/Pipeline_Tb/Main/IM_ForwardPCHighCall \
sim:/Pipeline_Tb/Main/IM_ForwardPCLowCall \
sim:/Pipeline_Tb/Main/IM_Ininst \
sim:/Pipeline_Tb/Main/IM_JC \
sim:/Pipeline_Tb/Main/IM_JN \
sim:/Pipeline_Tb/Main/IM_JZ \
sim:/Pipeline_Tb/Main/IM_MemReadOut \
sim:/Pipeline_Tb/Main/IM_MemWriteOut \
sim:/Pipeline_Tb/Main/IM_outinst \
sim:/Pipeline_Tb/Main/IM_RdstAddressOut \
sim:/Pipeline_Tb/Main/IM_RdstDataOut \
sim:/Pipeline_Tb/Main/IM_RsrcAddressOut \
sim:/Pipeline_Tb/Main/IM_RsrcDataOut \
sim:/Pipeline_Tb/Main/IM_ShiftOut \
sim:/Pipeline_Tb/Main/IM_WBOut \
sim:/Pipeline_Tb/Main/IM_writeFlag \
sim:/Pipeline_Tb/Main/IM_writePcHigh \
sim:/Pipeline_Tb/Main/IM_writePcLow \
sim:/Pipeline_Tb/Main/immediateValue \
sim:/Pipeline_Tb/Main/IncSP \
sim:/Pipeline_Tb/Main/Ininst \
sim:/Pipeline_Tb/Main/InPort \
sim:/Pipeline_Tb/Main/inputFromFU1 \
sim:/Pipeline_Tb/Main/inputFromFU2 \
sim:/Pipeline_Tb/Main/Inputinstruction \
sim:/Pipeline_Tb/Main/INT \
sim:/Pipeline_Tb/Main/IW_AluOut \
sim:/Pipeline_Tb/Main/IW_Ininst \
sim:/Pipeline_Tb/Main/IW_MemoryOut \
sim:/Pipeline_Tb/Main/IW_MemoryWBData \
sim:/Pipeline_Tb/Main/IW_MemReadOut \
sim:/Pipeline_Tb/Main/IW_outinst \
sim:/Pipeline_Tb/Main/IW_RdstAddressOut \
sim:/Pipeline_Tb/Main/IW_WBOut \
sim:/Pipeline_Tb/Main/IW_writeFlag \
sim:/Pipeline_Tb/Main/IW_writePcHigh \
sim:/Pipeline_Tb/Main/IW_writePcLow \
sim:/Pipeline_Tb/Main/JC \
sim:/Pipeline_Tb/Main/JN \
sim:/Pipeline_Tb/Main/JZ \
sim:/Pipeline_Tb/Main/loaduseCase \
sim:/Pipeline_Tb/Main/MemoryAddress \
sim:/Pipeline_Tb/Main/memoryOut \
sim:/Pipeline_Tb/Main/MemoryRead \
sim:/Pipeline_Tb/Main/MemoryWrite \
sim:/Pipeline_Tb/Main/outinst \
sim:/Pipeline_Tb/Main/outPort \
sim:/Pipeline_Tb/Main/OutputInstruction \
sim:/Pipeline_Tb/Main/Pc \
sim:/Pipeline_Tb/Main/PushFlagsPc \
sim:/Pipeline_Tb/Main/rDst \
sim:/Pipeline_Tb/Main/rDstAddress \
sim:/Pipeline_Tb/Main/rSrc \
sim:/Pipeline_Tb/Main/rsrc_Inport \
sim:/Pipeline_Tb/Main/rsrc_SP \
sim:/Pipeline_Tb/Main/rSrcAddress \
sim:/Pipeline_Tb/Main/rst \
sim:/Pipeline_Tb/Main/selectorFromFU1 \
sim:/Pipeline_Tb/Main/selectorFromFU2 \
sim:/Pipeline_Tb/Main/Shift \
sim:/Pipeline_Tb/Main/SP \
sim:/Pipeline_Tb/Main/stallCtrl \
sim:/Pipeline_Tb/Main/stallLD \
sim:/Pipeline_Tb/Main/startBranch \
sim:/Pipeline_Tb/Main/WB \
sim:/Pipeline_Tb/Main/WB_M_Forward \
sim:/Pipeline_Tb/Main/WB_M_Forward_Address \
sim:/Pipeline_Tb/Main/writeFlag \
sim:/Pipeline_Tb/Main/writeInstruction \
sim:/Pipeline_Tb/Main/writePcHigh \
sim:/Pipeline_Tb/Main/writePcLow
add wave -position insertpoint  \
sim:/Pipeline_Tb/Main/DM/memory_data
add wave -position insertpoint  \
sim:/Pipeline_Tb/Main/regFile/regfile
add wave -position insertpoint  \
sim:/Pipeline_Tb/Main/fetch/InstructionMemory/memory_instruction