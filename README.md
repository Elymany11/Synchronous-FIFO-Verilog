Synchronous FIFO – RTL Design & Verification

1. Project Overview
  This project implements a modular Synchronous FIFO (First-In First-Out) using Verilog HDL.
  The design is divided into independent RTL modules and integrated through a top-level module.

2. Design Specifications
  Data Width: 8 bits
  FIFO Depth: 8 entries
  Address Width: 3 bits
  Architecture: Synchronous FIFO
  HDL: Verilog

3. RTL Architecture
  The design consists of the following modules:

  Module        : Description
  fifo_memory	  : FIFO data storage and read/write operations
  fifo_pointers :	Read and write pointer management
  fifo_control  : FIFO status and control logic
  top_module    :Integration of all design modules

4. Verification
  Each RTL module has a dedicated testbench.
  
  Verification includes:
    Reset operation
    Write operation
    Read operation
    FIFO Full condition
    FIFO Empty condition
    Pointer management
    Top-level integration testing

5. Simulation Results
  Simulation waveforms and Vivado design views are provided in the project files.

6. Project Status
  RTL Design Completed.
  All implemented testbench simulations passed successfully.

7. Author
  Electronics and Communications Engineering Student

Focus: Digital Design | RTL Design | Functional Verification
