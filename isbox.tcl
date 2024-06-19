set target_library  { /app6/synopsys/syn/S-2021.06-SP4/libraries/syn/gtech.db }
set link_library    { /app6/synopsys/syn/S-2021.06-SP4/libraries/syn/gtech.db }

set design isbox
read_verilog  $design.v

link
check_design

proc enable_logic { name } {
  echo "Enable logic: " $name
  remove_attribute gtech/GTECH_$name dont_use
}

proc config_nor {} {
  echo "Config NOR"
  enable_logic NOR2
  enable_logic NOT
}

proc config_simdram {} {
  echo "Config SIMDRAM"
  enable_logic MAJ23
  enable_logic NOT
  enable_logic AND2
  enable_logic OR2
}

proc config_ap {} {
  echo "Config AP"
  enable_logic XNOR2
  enable_logic AND2
  enable_logic MUX2
  enable_logic NOT
  enable_logic OR2
}

proc config_drisa_nor {} {
  echo "Config DRISA-nor"
  enable_logic NOR2
  enable_logic NOT
}

proc config_drisa_mixed {} {
  echo "Config DRISA-mixed"
  enable_logic NAND2
  enable_logic NOR2
  enable_logic XNOR2
  enable_logic NOT
}

proc config_bitsimd {} {
  echo "Config BitSIMD"
  enable_logic NOT
  enable_logic AND2
  enable_logic OR2
  enable_logic XOR2
  enable_logic MUX2
}
echo "Total libcells: " [sizeof_collection [get_lib_cells */*]]
set_dont_use [get_lib_cells */*]
echo "Total Dont-use libcells: " [sizeof_collection [get_lib_cells */* -filter "dont_use==true"]]

config_ap

echo "Dont-use libcells: " [sizeof_collection [get_lib_cells */* -filter "dont_use==true"]]


compile -exact_map


change_names -rule verilog
write -hierarchy -format verilog -output $design.compiled.v

report_cell [get_cells]

exit
