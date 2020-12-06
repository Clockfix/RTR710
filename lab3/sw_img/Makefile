CC:=gcc
CFLAGS:=
LFLAGS:=-static

SRC:=$(shell find . -name "*.c")
OBJ:=$(subst src/,obj/,$(SRC))
OBJ:=$(subst .c,.o,$(OBJ))

OUT:=out/main.elf
DIR:=$(sort $(dir $(OBJ))) $(sort $(dir $(OUT)))
INC:=-Iinc
LIB:=-lm


host: host_settings all
device: device_settings all

host_settings:
	$(eval CROSS_COMPILE:=)

device_settings:
	$(eval CROSS_COMPILE:=arm-linux-gnueabihf-)

all:$(DIR) $(OUT)

$(DIR):
	mkdir -p $@

$(OUT):$(OBJ)
	$(CROSS_COMPILE)$(CC) $(LFLAGS) $(OBJ) -o $(OUT) $(LIB)

obj/%.o: src/%.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	rm -fr $(DIR)
