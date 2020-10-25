library rtu;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package simulation is

    -- stop simulation (to be placed in test process)
    procedure simulation_stop;

    -- check if simulation should be stopped (to be placed in helper processes)
    procedure simulation_stop_check;

end package;

package body simulation is

    -- global variable for tracking current status of the simulation
	type status_t is (SIM_ACTIVE, SIM_NONACTIVE);
	shared variable simulation_status : status_t := SIM_ACTIVE;

    -- stop simulation (to be placed in test process)
	procedure simulation_stop is
	begin 
        simulation_status := SIM_NONACTIVE; 
        wait;
    end procedure;

    -- check if simulation should be stopped (to be placed in helper processes)
	procedure simulation_stop_check  is
	begin
		if simulation_status = SIM_NONACTIVE then 
			wait;
		end if;
	end procedure;
end package body;
