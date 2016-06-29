set usb [lindex [get_hardware_names] 0]
set device_name [lindex [get_device_names -hardware_name $usb] 0]
puts "*************************"
puts "programming cable:"
puts $usb
set filename "outputs.txt"
set fileId [open $filename "a+"]


set filename "outputs.txt"
# open the filename for writing
set fileId [open $filename "w"]
# C:\altera_lite\15.1\quartus\bin64\quartus_stp -t send55.tcl
#IR scan codes:  001 -> push
#                010 -> pop

proc push {index value} {
global device_name usb

if {$value > 4294967295} {
return "value entered exceeds 32 bits" }

set push_value [int2bits $value]
set diff [expr {32 - [string length $push_value]%32}]

if {$diff != 32} {
set push_value [format %0${diff}d$push_value 0] }

puts $push_value
device_virtual_ir_shift -instance_index $index -ir_value 1 -no_captured_ir_value
device_virtual_dr_shift -instance_index $index -dr_value $push_value -length 32 -no_captured_dr_value
}

proc pop {index} {
	global device_name usb filename fileId
	variable x
	variable y
	
	device_virtual_ir_shift -instance_index $index -ir_value 2 -no_captured_ir_value
	set x [device_virtual_dr_shift -instance_index 0 -length 32]
	puts $x
	puts $fileId $x
	

}

proc popfile {index} {
	global device_name usb filename fileId
	variable x
	variable y
	
	device_virtual_ir_shift -instance_index $index -ir_value 2 -no_captured_ir_value
	set x [device_virtual_dr_shift -instance_index 0 -length 32]
	puts $x
	
	set xy [bin2dec $x]
	#puts $fileId $x

}

proc int2bits {i} {    
set res ""
while {$i>0} {
set res [expr {$i%2}]$res
set i [expr {$i/2}]}
if {$res==""} {set res 0}
return $res
}

proc bin2dec bin {
    #returns integer equivalent of $bin 
    set res 0
    if {$bin == 0} {
        return 0
    } elseif {[string match -* $bin]} {
        set sign -
        set bin [string range $bin[set bin {}] 1 end]
    } else {
        set sign {}
    }
    foreach i [split $bin {}] {
        set res [expr {$res*2+$i}]
    }
    return $sign$res
}

 # proc hex2float {hex} {
 #       global tcl_platform
 #       #if {$tcl_platform(byteOrder) == "littleEndian"} { set hex [reverse4 $hex] }
 #       set sign [expr $hex >> 31]
 #       set exponent [expr ($hex >> 23) & 0xFF]
 #       set mantissa [expr $hex & ((1 << 23) -1)]
 #       set result [expr 1 + 1.0 * $mantissa / (1 << 23)]
 #       set result [expr {($sign ? -1.0 : 1.0)} * $result]
 #       if {$mantissa == 0 && $exponent == 0} {
 #           set result [expr $result * 0.0]
 #       } else {
 #           set result [expr $result * pow(2, $exponent - 127)]
 #       }
 #       return $result
 #   }


proc bin2hex bin {
## No sanity checking is done
array set t {
0000 0 0001 1 0010 2 0011 3 0100 4
0101 5 0110 6 0111 7 1000 8 1001 9
1010 a 1011 b 1100 c 1101 d 1110 e 1111 f
}
set diff [expr {4-[string length $bin]%4}]
if {$diff != 4} {
set bin [format %0${diff}d$bin 0] }
regsub -all .... $bin {$t(&)} hex
return [subst $hex]
}

puts "Read floating point add result"
open_device -device_name $device_name -hardware_name $usb
device_lock -timeout 10000

push 0 0x3f77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40420143
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf77fb37
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f77fb37 
push 1 0x00000000 
push 2 0x40800000 
push 3 0x3f000000 
push 4 0x00000000 
push 5 0x00000000 
push 6 0x409eff6d 
push 7 0x3f000000 
push 8 0x00000000 
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f77fb37
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40420143
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf77fb37
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409eff6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf77fb37
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f77fb37
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f77fb37
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40420143
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f77fb37
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409eff6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf77fb37
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40420143
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf77fb37
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409eff6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40447315
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf6e33f0
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409dc684
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f6e33f0
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40447315
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf6e33f0
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409dc684
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6e33f0
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f6e33f0
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f6e33f0
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40447315
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f6e33f0
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409dc684
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf6e33f0
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40447315
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf6e33f0
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409dc684
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4046e4e7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf646c98
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409c8d9b
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f646c98
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4046e4e7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf646c98
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409c8d9b
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf646c98
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f646c98
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f646c98
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4046e4e7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f646c98
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409c8d9b
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf646c98
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4046e4e7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf646c98
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409c8d9b
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404956b8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf5aa551
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409b54b2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f5aa551
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404956b8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf5aa551
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409b54b2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf5aa551
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f5aa551
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f5aa551
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404956b8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f5aa551
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409b54b2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf5aa551
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404956b8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf5aa551
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409b54b2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404bc88e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf50de09
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409a1bca
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f50de09
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404bc88e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf50de09
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409a1bca
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf50de09
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f50de09
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f50de09
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404bc88e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f50de09
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409a1bca
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf50de09
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404bc88e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf50de09
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x409a1bca
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404e3a60
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf4716c2
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4098e2e1
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f4716c2
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404e3a60
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf4716c2
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4098e2e1
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf4716c2
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f4716c2
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f4716c2
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404e3a60
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f4716c2
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4098e2e1
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf4716c2
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x404e3a60
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf4716c2
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4098e2e1
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4050ac32
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf3d4f7b
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4097a9f8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f3d4f7b
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4050ac32
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf3d4f7b
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4097a9f8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf3d4f7b
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f3d4f7b
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f3d4f7b
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4050ac32
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f3d4f7b
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4097a9f8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf3d4f7b
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4050ac32
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf3d4f7b
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4097a9f8
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40531e04
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf338833
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4096710f
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f338833
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40531e04
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0xbf338833
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4096710f
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf338833
push 1 0x00000000
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f338833
push 6 0x40800000
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f338833
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40531e04
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0x3f338833
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4096710f
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf338833
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x40531e04
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x00000000
push 1 0xbf338833
push 2 0x40800000
push 3 0x3f000000
push 4 0x00000000
push 5 0x00000000
push 6 0x4096710f
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x39913a50
push 1 0xbf3d002e
push 2 0x40800082
push 3 0x3f000000
push 4 0x380a697b
push 5 0x393673c5
push 6 0x4050c161
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x39913a50
push 1 0xbf3d002e
push 2 0x40800082
push 3 0x3f000000
push 4 0xbf3d25dd
push 5 0xb851b717
push 6 0x407fff7e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x39913a50
push 1 0xbf3d002e
push 2 0x40800082
push 3 0x3f000000
push 4 0xb9041ede
push 5 0x382bf76a
push 6 0x4097a15c
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x39913a50
push 1 0xbf3d002e
push 2 0x40800082
push 3 0x3f000000
push 4 0x3f3d1d47
push 5 0xb992ccf7
push 6 0x407ffbe7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb85e4c51
push 1 0x3f3d07a7
push 2 0x407fffa0
push 3 0x3f000000
push 4 0x380a697b
push 5 0x393673c5
push 6 0x4050c161
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb85e4c51
push 1 0x3f3d07a7
push 2 0x407fffa0
push 3 0x3f000000
push 4 0xbf3d25dd
push 5 0xb851b717
push 6 0x407fff7e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb85e4c51
push 1 0x3f3d07a7
push 2 0x407fffa0
push 3 0x3f000000
push 4 0xb9041ede
push 5 0x382bf76a
push 6 0x4097a15c
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb85e4c51
push 1 0x3f3d07a7
push 2 0x407fffa0
push 3 0x3f000000
push 4 0x3f3d1d47
push 5 0xb992ccf7
push 6 0x407ffbe7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf3d25dd
push 1 0xb851b717
push 2 0x407fff7e
push 3 0x3f000000
push 4 0x380a697b
push 5 0x393673c5
push 6 0x4050c161
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf3d25dd
push 1 0xb851b717
push 2 0x407fff7e
push 3 0x3f000000
push 4 0xb9041ede
push 5 0x382bf76a
push 6 0x4097a15c
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9041ede
push 1 0x382bf76a
push 2 0x4097a15c
push 3 0x3f000000
push 4 0x3f3d1d47
push 5 0xb992ccf7
push 6 0x407ffbe7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f3d1d47
push 1 0xb992ccf7
push 2 0x407ffbe7
push 3 0x3f000000
push 4 0x380a697b
push 5 0x393673c5
push 6 0x4050c161
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f46b25b
push 1 0xba12ccf7
push 2 0x407ff7cf
push 3 0x3f000000
push 4 0x3888509c
push 5 0x39b6f9fd
push 6 0x404e64bb
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f46b25b
push 1 0xba12ccf7
push 2 0x407ff7cf
push 3 0x3f000000
push 4 0x3a113a50
push 5 0xbf467829
push 6 0x40800106
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f46b25b
push 1 0xba12ccf7
push 2 0x407ff7cf
push 3 0x3f000000
push 4 0xb9841ede
push 5 0x38ae1049
push 6 0x4098d1ab
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f46b25b
push 1 0xba12ccf7
push 2 0x407ff7cf
push 3 0x3f000000
push 4 0xb8dc3372
push 5 0x3f46871a
push 6 0x407fff3f
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf46c398
push 1 0xb8d1b717
push 2 0x407ffefc
push 3 0x3f000000
push 4 0x3888509c
push 5 0x39b6f9fd
push 6 0x404e64bb
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf46c398
push 1 0xb8d1b717
push 2 0x407ffefc
push 3 0x3f000000
push 4 0x3a113a50
push 5 0xbf467829
push 6 0x40800106
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf46c398
push 1 0xb8d1b717
push 2 0x407ffefc
push 3 0x3f000000
push 4 0xb9841ede
push 5 0x38ae1049
push 6 0x4098d1ab
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf46c398
push 1 0xb8d1b717
push 2 0x407ffefc
push 3 0x3f000000
push 4 0xb8dc3372
push 5 0x3f46871a
push 6 0x407fff3f
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb8dc3372
push 1 0x3f46871a
push 2 0x407fff3f
push 3 0x3f000000
push 4 0x3888509c
push 5 0x39b6f9fd
push 6 0x404e64bb
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb8dc3372
push 1 0x3f46871a
push 2 0x407fff3f
push 3 0x3f000000
push 4 0xb9841ede
push 5 0x38ae1049
push 6 0x4098d1ab
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3a113a50
push 1 0xbf467829
push 2 0x40800106
push 3 0x3f000000
push 4 0x3888509c
push 5 0x39b6f9fd
push 6 0x404e64bb
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3a113a50
push 1 0xbf467829
push 2 0x40800106
push 3 0x3f000000
push 4 0xb9841ede
push 5 0x38ae1049
push 6 0x4098d1ab
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f504780
push 1 0xba5c3372
push 2 0x407ff3b6
push 3 0x3f000000
push 4 0x38cd8559
push 5 0x3a0919f0
push 6 0x404c0814
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f504780
push 1 0xba5c3372
push 2 0x407ff3b6
push 3 0x3f000000
push 4 0x3a59d777
push 5 0xbf4ff024
push 6 0x40800188
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f504780
push 1 0xba5c3372
push 2 0x407ff3b6
push 3 0x3f000000
push 4 0xb9c62e4d
push 5 0x390205ff
push 6 0x409a01f7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f504780
push 1 0xba5c3372
push 2 0x407ff3b6
push 3 0x3f000000
push 4 0xb925accd
push 5 0x3f50069e
push 6 0x407ffedf
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf506141
push 1 0xb91c3ce2
push 2 0x407ffe76
push 3 0x3f000000
push 4 0x38cd8559
push 5 0x3a0919f0
push 6 0x404c0814
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf506141
push 1 0xb91c3ce2
push 2 0x407ffe76
push 3 0x3f000000
push 4 0x3a59d777
push 5 0xbf4ff024
push 6 0x40800188
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf506141
push 1 0xb91c3ce2
push 2 0x407ffe76
push 3 0x3f000000
push 4 0xb9c62e4d
push 5 0x390205ff
push 6 0x409a01f7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf506141
push 1 0xb91c3ce2
push 2 0x407ffe76
push 3 0x3f000000
push 4 0xb925accd
push 5 0x3f50069e
push 6 0x407ffedf
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb925accd
push 1 0x3f50069e
push 2 0x407ffedf
push 3 0x3f000000
push 4 0x38cd8559
push 5 0x3a0919f0
push 6 0x404c0814
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb925accd
push 1 0x3f50069e
push 2 0x407ffedf
push 3 0x3f000000
push 4 0xb9c62e4d
push 5 0x390205ff
push 6 0x409a01f7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3a59d777
push 1 0xbf4ff024
push 2 0x40800188
push 3 0x3f000000
push 4 0x38cd8559
push 5 0x3a0919f0
push 6 0x404c0814
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3a59d777
push 1 0xbf4ff024
push 2 0x40800188
push 3 0x3f000000
push 4 0xb9c62e4d
push 5 0x390205ff
push 6 0x409a01f7
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f59dc94
push 1 0xba92ccf7
push 2 0x407fef9e
push 3 0x3f000000
push 4 0x39095d0b
push 5 0x3a36f9fd
push 6 0x4049ab6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f59dc94
push 1 0xba92ccf7
push 2 0x407fef9e
push 3 0x3f000000
push 4 0x3a913a50
push 5 0xbf59681f
push 6 0x4080020c
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f59dc94
push 1 0xba92ccf7
push 2 0x407fef9e
push 3 0x3f000000
push 4 0xba041ede
push 5 0x392d03da
push 6 0x409b3246
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f59dc94
push 1 0xba92ccf7
push 2 0x407fef9e
push 3 0x3f000000
push 4 0xb95c3372
push 5 0x3f598612
push 6 0x407ffe7a
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf59fefc
push 1 0xb950aaa8
push 2 0x407ffdf4
push 3 0x3f000000
push 4 0x39095d0b
push 5 0x3a36f9fd
push 6 0x4049ab6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf59fefc
push 1 0xb950aaa8
push 2 0x407ffdf4
push 3 0x3f000000
push 4 0x3a913a50
push 5 0xbf59681f
push 6 0x4080020c
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf59fefc
push 1 0xb950aaa8
push 2 0x407ffdf4
push 3 0x3f000000
push 4 0xba041ede
push 5 0x392d03da
push 6 0x409b3246
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf59fefc
push 1 0xb950aaa8
push 2 0x407ffdf4
push 3 0x3f000000
push 4 0xb95c3372
push 5 0x3f598612
push 6 0x407ffe7a
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb95c3372
push 1 0x3f598612
push 2 0x407ffe7a
push 3 0x3f000000
push 4 0x39095d0b
push 5 0x3a36f9fd
push 6 0x4049ab6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb95c3372
push 1 0x3f598612
push 2 0x407ffe7a
push 3 0x3f000000
push 4 0xba041ede
push 5 0x392d03da
push 6 0x409b3246
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3a913a50
push 1 0xbf59681f
push 2 0x4080020c
push 3 0x3f000000
push 4 0x39095d0b
push 5 0x3a36f9fd
push 6 0x4049ab6d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3a913a50
push 1 0xbf59681f
push 2 0x4080020c
push 3 0x3f000000
push 4 0xba041ede
push 5 0x392d03da
push 6 0x409b3246
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6371a8
push 1 0xbab7a1c2
push 2 0x407feb81
push 3 0x3f000000
push 4 0x392aeafb
push 5 0x3a6496ee
push 6 0x40474ec6
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6371a8
push 1 0xbab7a1c2
push 2 0x407feb81
push 3 0x3f000000
push 4 0x3ab588e3
push 5 0xbf62e01a
push 6 0x4080028e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6371a8
push 1 0xbab7a1c2
push 2 0x407feb81
push 3 0x3f000000
push 4 0xba252696
push 5 0x395801b4
push 6 0x409c6293
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6371a8
push 1 0xbab7a1c2
push 2 0x407feb81
push 3 0x3f000000
push 4 0xb989e343
push 5 0x3f630585
push 6 0x407ffe19
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf639ca6
push 1 0xb9828c37
push 2 0x407ffd72
push 3 0x3f000000
push 4 0x392aeafb
push 5 0x3a6496ee
push 6 0x40474ec6
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf639ca6
push 1 0xb9828c37
push 2 0x407ffd72
push 3 0x3f000000
push 4 0x3ab588e3
push 5 0xbf62e01a
push 6 0x4080028e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf639ca6
push 1 0xb9828c37
push 2 0x407ffd72
push 3 0x3f000000
push 4 0xba252696
push 5 0x395801b4
push 6 0x409c6293
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf639ca6
push 1 0xb9828c37
push 2 0x407ffd72
push 3 0x3f000000
push 4 0xb989e343
push 5 0x3f630585
push 6 0x407ffe19
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb989e343
push 1 0x3f630585
push 2 0x407ffe19
push 3 0x3f000000
push 4 0x392aeafb
push 5 0x3a6496ee
push 6 0x40474ec6
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb989e343
push 1 0x3f630585
push 2 0x407ffe19
push 3 0x3f000000
push 4 0xba252696
push 5 0x395801b4
push 6 0x409c6293
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3ab588e3
push 1 0xbf62e01a
push 2 0x4080028e
push 3 0x3f000000
push 4 0x392aeafb
push 5 0x3a6496ee
push 6 0x40474ec6
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3ab588e3
push 1 0xbf62e01a
push 2 0x4080028e
push 3 0x3f000000
push 4 0xba252696
push 5 0x395801b4
push 6 0x409c6293
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6d06cd
push 1 0xbadc5500
push 2 0x407fe768
push 3 0x3f000000
push 4 0x394d8559
push 5 0x3a893b7e
push 6 0x4044f224
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6d06cd
push 1 0xbadc5500
push 2 0x407fe768
push 3 0x3f000000
push 4 0x3ad9d777
push 5 0xbf6c5815
push 6 0x40800312
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6d06cd
push 1 0xbadc5500
push 2 0x407fe768
push 3 0x3f000000
push 4 0xba462e4d
push 5 0x398205ff
push 6 0x409d92e2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f6d06cd
push 1 0xbadc5500
push 2 0x407fe768
push 3 0x3f000000
push 4 0xb9a52696
push 5 0x3f6c850a
push 6 0x407ffdb9
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6d3a60
push 1 0xb99cc31a
push 2 0x407ffcf0
push 3 0x3f000000
push 4 0x394d8559
push 5 0x3a893b7e
push 6 0x4044f224
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6d3a60
push 1 0xb99cc31a
push 2 0x407ffcf0
push 3 0x3f000000
push 4 0x3ad9d777
push 5 0xbf6c5815
push 6 0x40800312
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6d3a60
push 1 0xb99cc31a
push 2 0x407ffcf0
push 3 0x3f000000
push 4 0xba462e4d
push 5 0x398205ff
push 6 0x409d92e2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf6d3a60
push 1 0xb99cc31a
push 2 0x407ffcf0
push 3 0x3f000000
push 4 0xb9a52696
push 5 0x3f6c850a
push 6 0x407ffdb9
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9a52696
push 1 0x3f6c850a
push 2 0x407ffdb9
push 3 0x3f000000
push 4 0x394d8559
push 5 0x3a893b7e
push 6 0x4044f224
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9a52696
push 1 0x3f6c850a
push 2 0x407ffdb9
push 3 0x3f000000
push 4 0xba462e4d
push 5 0x398205ff
push 6 0x409d92e2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3ad9d777
push 1 0xbf6c5815
push 2 0x40800312
push 3 0x3f000000
push 4 0x394d8559
push 5 0x3a893b7e
push 6 0x4044f224
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3ad9d777
push 1 0xbf6c5815
push 2 0x40800312
push 3 0x3f000000
push 4 0xba462e4d
push 5 0x398205ff
push 6 0x409d92e2
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f769be1
push 1 0xbb00841f
push 2 0x407fe350
push 3 0x3f000000
push 4 0x39701fb8
push 5 0x3aa009f6
push 6 0x4042957d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f769be1
push 1 0xbb00841f
push 2 0x407fe350
push 3 0x3f000000
push 4 0x3afe260b
push 5 0xbf75d00f
push 6 0x40800394
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f769be1
push 1 0xbb00841f
push 2 0x407fe350
push 3 0x3f000000
push 4 0xba673605
push 5 0x399784ec
push 6 0x409ec331
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f769be1
push 1 0xbb00841f
push 2 0x407fe350
push 3 0x3f000000
push 4 0xb9c0f020
push 5 0x3f76047d
push 6 0x407ffd59
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf76d80a
push 1 0xb9b673c5
push 2 0x407ffc69
push 3 0x3f000000
push 4 0x39701fb8
push 5 0x3aa009f6
push 6 0x4042957d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf76d80a
push 1 0xb9b673c5
push 2 0x407ffc69
push 3 0x3f000000
push 4 0x3afe260b
push 5 0xbf75d00f
push 6 0x40800394
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf76d80a
push 1 0xb9b673c5
push 2 0x407ffc69
push 3 0x3f000000
push 4 0xba673605
push 5 0x399784ec
push 6 0x409ec331
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xbf76d80a
push 1 0xb9b673c5
push 2 0x407ffc69
push 3 0x3f000000
push 4 0xb9c0f020
push 5 0x3f76047d
push 6 0x407ffd59
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9c0f020
push 1 0x3f76047d
push 2 0x407ffd59
push 3 0x3f000000
push 4 0x39701fb8
push 5 0x3aa009f6
push 6 0x4042957d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9c0f020
push 1 0x3f76047d
push 2 0x407ffd59
push 3 0x3f000000
push 4 0xba673605
push 5 0x399784ec
push 6 0x409ec331
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3afe260b
push 1 0xbf75d00f
push 2 0x40800394
push 3 0x3f000000
push 4 0x39701fb8
push 5 0x3aa009f6
push 6 0x4042957d
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3afe260b
push 1 0xbf75d00f
push 2 0x40800394
push 3 0x3f000000
push 4 0xba673605
push 5 0x399784ec
push 6 0x409ec331
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3f80187a
push 1 0xbb12ddbe
push 2 0x407fdf37
push 3 0x3f000000
push 4 0x3b113a50
push 5 0xbf7f481b
push 6 0x40800419
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9dc3372
push 1 0x3f7f83f1
push 2 0x407ffcf8
push 3 0x3f000000
push 4 0x3988d6d4
push 5 0x3ab6d86f
push 6 0x404038d6
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0xb9dc3372
push 1 0x3f7f83f1
push 2 0x407ffcf8
push 3 0x3f000000
push 4 0xba841ede
push 5 0x39ad03da
push 6 0x409ff37e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3b113a50
push 1 0xbf7f481b
push 2 0x40800419
push 3 0x3f000000
push 4 0x3988d6d4
push 5 0x3ab6d86f
push 6 0x404038d6
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18
push 0 0x3b113a50
push 1 0xbf7f481b
push 2 0x40800419
push 3 0x3f000000
push 4 0xba841ede
push 5 0x39ad03da
push 6 0x409ff37e
push 7 0x3f000000
push 8 0x00000000
push 8 0x00000001
pop 9
pop 10
pop 11
pop 12
pop 13
pop 14
pop 15
popfile 18





close $fileId
device_unlock
close_device