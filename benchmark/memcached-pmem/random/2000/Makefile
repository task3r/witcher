NAME = main

PM_FILE_PATH = pm.img
PM_SIZE = 8
PM_LAYOUT = layout
OP_FILE_PATH = op_file.txt
OP_INDEX = 0
SKIP_INDEX = -1
OUTPUT_PATH = output
MEM_LAYOUT_PATH = memory_layout
INPUT = $(PM_FILE_PATH) $(PM_SIZE) $(PM_LAYOUT) $(OP_FILE_PATH) $(OP_INDEX) $(SKIP_INDEX) $(OUTPUT_PATH) $(MEM_LAYOUT_PATH)

PM_ADDR = $(PMEM_MMAP_HINT)

REPLAY_OUT_PATH = replay-output
OP_PATH = op_file.txt

CRASH_CANDIDATES = $(REPLAY_OUT_PATH)/res/crash_candidates
CRASH_TARGET = 1-245937-245912


TRACE_EXE = ../../main/$(NAME).trace.py
EXE = ../../main/$(NAME).py
ALL_BC = ../../main/$(NAME).all.bc

SERVER_NAME = memcached

include ../../../Makefile.test.parallel.common
