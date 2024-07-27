
echo "INFO: Synthesizing S-box"
# dc_shell -f ./script/sbox.tcl > sbox.log
python3 ./script/get_gtech_gates.py sbox.log

echo "INFO: Synthesizing inverse S-box"
# dc_shell -f ./script/isbox.tcl > isbox.log
python3 ./script/get_gtech_gates.py isbox.log
