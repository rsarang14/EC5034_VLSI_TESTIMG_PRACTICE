# Lab 2 / 4: Sequential Fault Simulation & Test Compaction

This repository contains a custom-built, bit-parallel sequential fault simulator written entirely in Python, designed to evaluate stuck-at faults in a synthesized Verilog gate-level netlist (using the Cadence Genus `slow_vdd1v0_basiccells` standard cell library).

## Features
- **Netlist Parsing & Scan-Chain Extraction**: Automatically parses Verilog netlists and extracts Flip-Flops to break combinational loops, treating them as Pseudo-Primary Inputs/Outputs (PPI/PPO).
- **Expanded Standard Cell Library**: Full mathematical definitions for complex logic gates (e.g., `AOI22`, `OAI31`, `MX2`, `CLKAND2`) directly mapped from Cadence Genus.
- **Bit-Parallel Simulation**: Uses Python's arbitrary-precision integers to simulate millions of test vectors (e.g., all 134,217,728 possible states for a 27-input circuit) simultaneously.
- **Greedy / Fast Compaction Algorithm**: Reduces exhaustive test vector sets down to the mathematical minimum required for 100% fault coverage on an ATE machine.

## Results
*Screenshots and detailed results will be added here.*

### 1. Fault Coverage
(Add screenshot of the terminal output showing 100% coverage across exhaustive vectors here)

### 2. Test Compaction
(Add screenshot of the 134M vectors compacted down to 61 vectors here)

### 3. Fault Detection & Propagation
(Add screenshot of the solve_part3.py output showing n_76/sa0 propagation to n_95 here)
