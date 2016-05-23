This project consists of a program capable of sending a 32bit number to an FPGA and then getting a 32bit value back from the FPGA via JTAG.
The FPGA performs a floating point add operation with the value sent and a hardcoded "3.2" value.

In order to execute the script, just type "quartus_stp -t send55.tcl" on a terminal and it is gonna send a value and get the answer.
After the first time you send a value, you should press KEY 0 on the de2-115 in order to perform the operation.