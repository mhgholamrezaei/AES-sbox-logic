import sys
def count_gtech_gates(log_filename):
    gtech_counts = {}

    # Open and read the log file
    with open(log_filename, "r") as file:
        lines = file.readlines()

    # Iterate through each line and count GTECH gates
    start_check = False
    for line in lines:
        if "Cell" in line:
            start_check = True
        else:
            if not start_check:
                continue
        if "GTECH_" in line:
            gate_type = line.split()[1]  # Extract the gate type
            if gate_type in gtech_counts:
                gtech_counts[gate_type] += 1
            else:
                gtech_counts[gate_type] = 1

    return gtech_counts

# Specify the log file name
log_filename = sys.argv[1]

# Get the counts of GTECH gates
gtech_counts = count_gtech_gates(log_filename)

# Print the result
print("GTECH Gate Counts:")
for gate_type, count in gtech_counts.items():
    print(f"{gate_type}: {count}")
