# 8-Bit Barrel Shifter Unit

## Overview

A barrel shifter is a digital circuit that performs bidirectional (left/right) logical shifts on an 8-bit data input. This project implements an 8-bit barrel shifter unit in Verilog, which can shift data by a specified number of bits in a single clock cycle. Barrel shifters are commonly used in microprocessors, digital signal processing, and other hardware applications.

## Features

- **8-bit data input/output**: The unit operates on 8-bit data words.
- **Configurable shift amount**: You can specify a shift amount between 0 and 7 bits.
- **Bidirectional shifting**: Supports both left and right shifts.
- **Single-cycle operation**: The shifter operates in a single clock cycle for each shift operation.

## Implementation Details

This design uses a **multiplexer-based architecture** to perform shifts. The logic is **combinational** and provides a fast, efficient solution for shifting data in digital systems.

### Files
- **`src/barrel_shifter.v`**: Verilog implementation of the barrel shifter unit.
- **`testbench/barrel_shifter_tb.v`**: Testbench to simulate and verify the functionality of the barrel shifter.

## Usage

### Prerequisites

1. **Install Icarus Verilog** (for simulation):
   - On macOS, you can install it via [Homebrew](https://brew.sh/):
     ```bash
     brew install icarus-verilog
     ```

2. **Install GTKWave** (for waveform viewing):
   - You can also install it via Homebrew:
     ```bash
     brew install gtkwave
     ```

### Simulation Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/8-Bit-Barrel-Shifter-Unit.git
   cd 8-Bit-Barrel-Shifter-Unit
