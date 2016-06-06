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

proc int2bits {i} {    
set res ""
while {$i>0} {
set res [expr {$i%2}]$res
set i [expr {$i/2}]}
if {$res==""} {set res 0}
return $res
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
#puts "Inputs"
#push 0 0xbefc475e
#push 1 0x00000000
#push 2 0x3fc00000
#push 3 0x3f000000
#push 4 0x3efc475e
#push 5 0x00000000
#push 6 0x3fc00000
#push 7 0x3f000000
#puts "Outputs"
#pop 0
#pop 1
#pop 2
#pop 3
#pop 4
#pop 5
#pop 6
#pop 7
#pop 8
#pop 9
#puts ""
#push 0 0xbf2f0825
#push 1 0x00000000
#push 2 0x3fc00000
#push 3 0x3f000000
#push 4 0x00000000
#push 5 0x3f2f0825
#push 6 0x3fc00000
#push 7 0x3f000000
#puts "Outputs"
#pop 0
#pop 1
#pop 2
#pop 3
#pop 4
#pop 5
#pop 6
#pop 7
#pop 8
#puts ""
#push 0 0xbefc475e
#push 1 0x00000000
#push 2 0x3fc00000
#push 3 0x3f000000
#push 4 0x3efc475e
#push 5 0x00000000
#push 6 0x3fc00000
#push 7 0x3f000000
#puts "Outputs"
#pop 0
#pop 1
#pop 2
#pop 3
#pop 4
#pop 5
#pop 6
#pop 7

push 0 0xbf7d4270
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f7d4270
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf737b29
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f737b29
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf69b3e1
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f69b3e1
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf5fec9a
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f5fec9a
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf562542
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f562542
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf4c5dfb
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f4c5dfb
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf4296b3
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f4296b3
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf38cf6c
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f38cf6c
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2f0825
push 1 0x00000000
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x00000000
push 5 0x3f2f0825
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2ec83f
push 1 0xbd187725
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3d187725
push 5 0x3f2ec83f
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2e886a
push 1 0xbd98769f
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3d98769f
push 5 0x3f2e886a
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2e4884
push 1 0xbde4b231
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3de4b231
push 5 0x3f2e4884
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2e08af
push 1 0xbe1876e2
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3e1876e2
push 5 0x3f2e08af
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2dc8c9
push 1 0xbe3e9468
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3e3e9468
push 5 0x3f2dc8c9
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2d88f4
push 1 0xbe64b231
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3e64b231
push 5 0x3f2d88f4
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2d491f
push 1 0xbe8567fd
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3e8567fd
push 5 0x3f2d491f
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6

push 0 0xbf2d0939
push 1 0xbe9876e2
push 2 0x3fc00000
push 3 0x3f000000
push 4 0x3e9876e2
push 5 0x3f2d0939
push 6 0x3fc00000
push 7 0x3f000000
pop 0
pop 1
pop 2
pop 3
pop 4
pop 5
pop 6



close $fileId
device_unlock
close_device