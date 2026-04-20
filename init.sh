#!/bin/bash
set -e

# Run CPU test
/pt_linux_x64 -r 1
# Display results
cat results_cpu.yml

