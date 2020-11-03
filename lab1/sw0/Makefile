CC:=gcc
CROSS_COMPILE:=arm-linux-gnueabihf-

CFLAGS:=
LFLAGS:=-static

SRC:=$(shell find . -name "*.c")
OBJ:=$(subst src/,obj/,$(SRC))
OBJ:=$(subst .c,.o,$(OBJ))

OUT:=out/leds.elf
DIR:=$(sort $(dir $(OBJ))) $(sort $(dir $(OUT)))
INC:=-Iinc
LIB:=

all:$(DIR) $(OUT)

$(DIR):
	mkdir -p $@

$(OUT):$(OBJ)
	$(CROSS_COMPILE)$(CC) $(LFLAGS) $(OBJ) -o $(OUT) $(LIB)

obj/%.o: src/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	rm -fr $(DIR)
