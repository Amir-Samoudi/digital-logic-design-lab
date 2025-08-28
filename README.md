# Digital Logic Design Lab Projects

This repository contains the experiments for the **"Digital Logic Design Lab"** course.  
The projects provide hands-on experience in **designing, simulating, and implementing digital circuits** in Verilog, with a focus on **FPGA programming**.

---

##  Topics Covered  
- **Verilog HDL**: Designing and testing digital circuits  
- **FPGA Synthesis**: Using **Intel Quartus II** for synthesis and pin assignment  
- **FPGA Implementation**: Programming and testing designs on a **DE1/Cyclone II** board  
- **Hardware Interfacing**: Designing wrappers for hardware accelerators and interfacing with peripherals  
- **Digital Systems**: Implementing systems such as function generators and serial communication modules  

---

## Experiments

### Experiment 2: Multi-channel Serial Transmitter (MSSD)
**Goal**: Design and implement a **multi-channel synchronous serial demultiplexer** on an FPGA.  

**Description**:  
- Receives a serial data stream containing port address, data length, and payload  
- Controlled by a **Huffman-style FSM**, with counters and shift registers parsing packets  
- Demultiplexes data to one of **four output channels**  
- Includes:  
  - **One-pulser** for push-button debouncing  
  - **Seven-segment display driver** to show data count  
- Synthesized and implemented on FPGA  

---

### Experiment 3: Function Generator
**Goal**: Implement a **function generator** on FPGA capable of producing multiple waveforms.  

**Description**:  
- Supports **sine, square, triangle, reciprocal, and rectified** waveforms  
- Components:  
  - **Waveform Generator** using counters and a **ROM-based DDS** for sine wave  
  - **Frequency Selector** (clock divider)  
  - **Amplitude Selector** for scaling output  
  - **DAC via PWM** to generate analog signals  
- Entire system designed as a **schematic** in Quartus II and implemented on FPGA  

---

### Experiment 4: Exponential Accelerator and Wrapper
**Goal**: Integrate a pre-designed **exponential calculation accelerator** into a larger system using a custom wrapper.  

**Description**:  
- Wrapper written in **Verilog** to manage the exponential engine  
- Accepts integer and fractional inputs  
- Sequences four calculations and stores results in a **FIFO buffer**  
- Allows a main processor to **offload multiple computations**  
- Synthesized and implemented on FPGA  

---
