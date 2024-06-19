
echo "INFO: Synthesizing S-box" 
dc_shell -f sbox.tcl > sbox.log
python3 get_gtech_gates.py sbox.log

echo "INFO: Synthesizing inverse S-box"
dc_shell -f isbox.tcl > isbox.log
python3 get_gtech_gates.py isbox.log
