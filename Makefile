CC=gcc
CFLAGS=-Wall -Wextra -pedantic -std=c18 -O2 
LIBS=

TARGET=target
OUTPUT=release

MODULES += main.o


all: env $(MODULES)
	$(CC) $(CFLAGS) $(MODULES) $(LIBS) -o $(OUTPUT)/$(TARGET)


%.o:
	$(CC) $(CFLAGS) -c $<


-include dep.list


exec: all
	$(OUTPUT)/$(TARGET)


.PHONY: env dep clean


dep:
	$(CC) -MM app/*.c > dep.list


env:
	mkdir -pv $(OUTPUT)


clean: 
	rm -rvf $(OUTPUT)
	rm -vf ./*.o



