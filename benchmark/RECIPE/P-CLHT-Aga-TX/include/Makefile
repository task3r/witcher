DIR = ../../../../third_party/RECIPE/P-CLHT-Aga/include
DIR1 = ../../../../third_party/RECIPE/P-CLHT-Aga/external/ssmem/include
FILES = $(DIR)/*.h
FILES1 = $(DIR1)/*.h
FILES2 = ../../../../third_party/RECIPE/P-CLHT-Aga/external/sspfd/sspfd.h

.PHONY: all copy clean

all: copy

copy:
	@ cp $(FILES) .
	@ cp $(FILES1) .
	@ cp $(FILES2) .

clean:
	@ rm -f *.h
