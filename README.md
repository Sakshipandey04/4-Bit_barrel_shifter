# 4-bit Barrel Shifter (Verilog - Xilinx Vivado)

This project implements a *4-bit Barrel Shifter* in Verilog. It supports *logical, **rotate, and **arithmetic* shifts in both left and right directions. The design is simulated using *Xilinx Vivado 2025.1*.

## 📌 Project Overview

A *barrel shifter* allows shifting of data by a specified number of bits in a single operation. This implementation supports:

- *4-bit input*
- *Shift Amount (0 to 3)*
- *Direction* (Left or Right)
- *Shift Modes*:
  - 00 → Logical
  - 01 → Rotate
  - 10 → Arithmetic

## Module Interface

### barrel_shifter.v

| Port Name   | Direction | Width  | Description                           |
|-------------|-----------|--------|---------------------------------------|
| data_in   | Input     | [3:0]  | Input data to shift                   |
| shift_amt | Input     | [1:0]  | Number of positions to shift          |
| dir       | Input     | 1-bit  | Direction (0 = left, 1 = right)       |
| mode      | Input     | [1:0]  | Mode (00 = logical, 01 = rotate, 10 = arithmetic) |
| data_out  | Output    | [3:0]  | Shifted output data                   |

## Simulation Screenshot

> Below is a waveform captured using Vivado's simulator:
screenshot.png


## Example Outputs

| data_in | shift_amt | dir | mode | data_out | Description           |
|---------|-----------|-----|------|----------|-----------------------|
| 0110  | 1         | 0   | 00   | 1100   | Logical left shift    |
| 0110  | 1         | 1   | 00   | 0011   | Logical right shift   |
| 1001  | 1         | 1   | 10   | 1100   | Arithmetic right shift|
| 1010  | 2         | 0   | 01   | 1010   | Rotate left           |


## Tools Used

- Verilog HDL
- Xilinx Vivado 2025.1
- Vivado Simulator (Behavioral Simulation)

## Files

barrel_shifter.v – Main Verilog design module

tb_barrel_shifter.v – Testbench to simulate functionality

README.md – Project documentation

# Acknowledgments

Built as part of hands-on learning for Digital Design and RTL using Verilog.
Inspired by processor architecture components like ALUs and shifters.

📬 Contact

If you'd like to connect:

📎 LinkedIn: https://www.linkedin.com/in/sakshi-pandey-86a87b257

✉ Email: pandeysakshi9315@gmail.com


⭐ Show Your Support

If this project helped you learn, feel free to star ⭐ the repository!
