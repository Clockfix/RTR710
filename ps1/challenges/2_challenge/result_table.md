# Problem set 1

## Challenge 2

Assume that a and b are 16-bit inputs interpreted as unsigned numbers. Compare 5 VHDL schematics for the following operations. Synthesize the components and compare their area.

- a + b --1
- a + "0000000000000001" --2
- a + "0000000010000000" --3
- a + "1000000000000000" --4
- a + "1010101010101010" --5

| Nr. | b signal              | ALMs needed | Combinational ALUTs | Dedicated Logic Resources |
|-----|-----------------------|-------------|---------------------|---------------------------|
| 1   | signal (not constant) | 9           | 17                  | 0                         |
| 2   | ”0000000000000001”    | 8           | 16                  | 0                         |
| 3   | ”0000000010000000”    | 5           | 9                   | 0                         |
| 4   | ”1000000000000000”    | 1           | 1                   | 0                         |
| 5   | ”1010101010101010”    | 8           | 15                  | 0                         ||