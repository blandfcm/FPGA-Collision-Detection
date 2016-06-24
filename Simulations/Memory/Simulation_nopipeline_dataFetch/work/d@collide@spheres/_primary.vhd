library verilog;
use verilog.vl_types.all;
entity dCollideSpheres is
    port(
        x1              : in     vl_logic_vector(31 downto 0);
        y1              : in     vl_logic_vector(31 downto 0);
        z1              : in     vl_logic_vector(31 downto 0);
        r1              : in     vl_logic_vector(31 downto 0);
        x2              : in     vl_logic_vector(31 downto 0);
        y2              : in     vl_logic_vector(31 downto 0);
        z2              : in     vl_logic_vector(31 downto 0);
        r2              : in     vl_logic_vector(31 downto 0);
        cx              : out    vl_logic_vector(31 downto 0);
        cy              : out    vl_logic_vector(31 downto 0);
        cz              : out    vl_logic_vector(31 downto 0);
        normalx         : out    vl_logic_vector(31 downto 0);
        normaly         : out    vl_logic_vector(31 downto 0);
        normalz         : out    vl_logic_vector(31 downto 0);
        depth           : out    vl_logic_vector(31 downto 0);
        g1              : in     vl_logic_vector(31 downto 0);
        g2              : in     vl_logic_vector(31 downto 0);
        ret             : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        done            : out    vl_logic;
        test            : out    vl_logic_vector(31 downto 0);
        test2           : out    vl_logic_vector(31 downto 0);
        test3           : out    vl_logic_vector(31 downto 0);
        test4           : out    vl_logic_vector(31 downto 0)
    );
end dCollideSpheres;
