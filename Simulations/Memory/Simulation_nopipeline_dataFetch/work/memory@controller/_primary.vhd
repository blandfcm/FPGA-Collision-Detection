library verilog;
use verilog.vl_types.all;
entity memoryController is
    port(
        fetch_data_ready: in     vl_logic;
        end_of_memory   : out    vl_logic;
        rst             : in     vl_logic
    );
end memoryController;
