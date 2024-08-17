#!/bin/bash

# Ensure the script stops on errors
set -e

# Function to print usage
usage() {
    echo "Usage: $0 <cpp_file> <max_i> <time_limit>"
    exit 1
}

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    usage
fi

# Read arguments
cpp_file="$1"
max_i="$2"
time_limit="$3"

# Check if the C++ file exists
if [ ! -f "$cpp_file" ]; then
    echo "Error: C++ file '$cpp_file' not found."
    exit 1
fi

# Compile the C++ file
executable="program"
g++ -o "$executable" "$cpp_file"

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Initialize counters
tests_solved=0
all_tests=0
all_passed=true

# Function to trim trailing spaces from a file
trim_file() {
    local file="$1"
    awk '{$1=$1};1' "$file" > "temp_file.txt"
    mv "temp_file.txt" "$file"
}

# Loop through each test case
for i in $(seq 1 "$max_i"); do
    # Check if input and expected output files exist
    if [ ! -f "${i}.in" ] || [ ! -f "${i}.out" ]; then
        echo "Error: Input or output file '${i}.in' or '${i}.out' not found."
        continue
    fi

    # Trim trailing spaces from the expected output file
    trim_file "${i}.out"

    # Run the program and measure the time
    {
        timeout "$time_limit" ./program < "${i}.in" > "temp_output.txt" 2> "temp_error.txt"
    } & {
        # Measure the time concurrently
        start_time=$(date +%s.%N)
        wait
        end_time=$(date +%s.%N)
        real_time=$(echo "$end_time - $start_time" | bc -l)
    }

    # Check if timeout occurred
    if [ $? -eq 124 ]; then
        echo -e "Test ${i}: ${RED}[TLE]${NC}"
        all_passed=false
        rm -f temp_output.txt temp_error.txt
        continue
    fi

    # Check if the time exceeded the limit
    if (( $(echo "$real_time > $time_limit" | bc -l) )); then
        echo -e "Test ${i}: ${RED}[TLE]${NC}"
        all_passed=false
        rm -f temp_output.txt temp_error.txt
        continue
    fi

    # Trim trailing spaces from the temporary output file
    trim_file "temp_output.txt"

    # Compare the output with the expected output
    if cmp -s "temp_output.txt" "${i}.out"; then
        echo -e "Test ${i}: ${GREEN}[AC]${NC}"
        tests_solved=$((tests_solved + 1))
    else
        echo -e "Test ${i}: ${RED}[WA]${NC}"
        all_passed=false
    fi

    # Clean up temporary files
    rm -f temp_output.txt temp_error.txt

    # Increment the total number of tests
    all_tests=$((all_tests + 1))
done

# Print the final summary
if $all_passed; then
    summary_result="${GREEN}[AC]${NC}"
else
    summary_result="${RED}[WA]${NC}"
fi

echo -e "Conclusion: ${summary_result} ${tests_solved}/${all_tests} tests solved."

# Clean up the compiled executable
rm -f "$executable"
