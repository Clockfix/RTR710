TBS:=$(shell find ../tb -name "*.vhd")
SRC:=$(shell find ../src -name "*.vhd")
PKGS:=$(shell find ../pkg -name "*.vhd")
LIBS:=work rtu
CH:="\\e\[1\;32m" # Color Highlight
CE:="\\e\[0\;31m" # Color Error
CD:="\\e\[0\;0m"  # Color Default

#################### CHECK ####################
CHECK_VSIM:=$(shell which vsim)

#################### EXPANSIONS ####################
define setup_library
	@echo "Setting up library - $(1)"
	vlib $(1)
	vmap $(1) $(1)

endef

define compile_package
	vcom -work rtu -2008 $(1) -allowProtectedBeforeBody

endef

define compile_component
	vcom -work work -2008 $(1)

endef

define compile_testbench
	vcom -work work -2008 $(1)

endef


#################### RULES ####################
all: check compile simulate

check:
ifeq ($(CHECK_VSIM),)
	@echo -e "$(CE)The modelsim executable (vsim) is not available at the command line$(CD)"
	@echo -e "$(CE)Try adding its path to the PATH variable in the .bashrc$(CD)"
	exit 1
else
	@echo -e "$(CH)The environment seems to be set up correctly$(CD)"
endif

compile:
	@echo -e "$(CH)** Setting up libraries$(CD)"
	$(foreach i,$(LIBS),$(call setup_library,$(i)))
	@echo -e "$(CH)** Compiling packages$(CD)"
	$(foreach i,$(PKGS),$(call compile_package,$(i)))
	@echo -e "$(CH)** Compiling sources$(CD)"
	$(foreach i,$(SRC),$(call compile_component,$(i)))
	@echo -e "$(CH)** Compiling testbenches$(CD)"
	$(foreach i,$(TBS),$(call compile_testbench,$(i)))

simulate:
	@echo -e "$(CH)** Running simulation$(CD)"
	vsim tb -c -do "run -all; quit"

clean:
	rm -rf $(LIBS) modelsim.ini transcript
