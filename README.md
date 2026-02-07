

---

# 🔁 D Flip-Flop UVM Verification

**SystemVerilog | UVM**

## 📌 Project Overview

This repository contains a **Universal Verification Methodology (UVM)** based verification environment developed to verify the functional correctness of a **D Flip-Flop**.

The testbench ensures that the output **Q captures the input D at the active clock edge** and holds its value until the next clock edge.
This project demonstrates a **complete UVM verification flow** and is suitable for **learning purposes and interview presentation**.

---

## 🧠 Design Under Test (DUT)

* **Module:** D Flip-Flop
* **Functionality:**

  * On the rising edge of the clock, output **Q follows input D**
  * Output **Q remains stable** between clock edges
  * Reset initializes the output to a known state

---

## 🗂️ Project Structure

```
├── design.sv          # D Flip-Flop DUT
├── interface.sv       # Interface connecting DUT and UVM TB
├── seq_item.sv        # Transaction definition
├── sequence.sv        # Stimulus generation
├── sequencer.sv       # Controls sequence execution
├── driver.sv          # Drives input D to DUT
├── monitor.sv         # Samples DUT output Q
├── scoreboard.sv      # Compares expected vs actual output
├── agent.sv           # Driver, Monitor, Sequencer wrapper
├── env.sv             # UVM environment
├── test.sv            # Test configuration and execution
├── testbench.sv       # Top-level testbench module
```

---

## ⚙️ UVM Components Used

* **Sequence Item** – Defines transaction data for D Flip-Flop
* **Sequence** – Generates randomized stimulus for input D
* **Sequencer** – Controls sequence flow
* **Driver** – Drives transactions to the DUT
* **Monitor** – Observes DUT input/output signals
* **Scoreboard** – Checks functional correctness
* **Agent** – Groups driver, monitor, and sequencer
* **Environment** – Integrates agent and scoreboard
* **Test** – Configures and starts the verification process

---

## ✅ Verification Strategy

* Apply reset to initialize DUT
* Generate randomized **D** input values
* Drive inputs synchronously with the clock
* Monitor output **Q**
* Scoreboard validation:

  * **Expected Q = D sampled at previous clock edge**
  * **Actual Q = DUT output**

---

## 🎯 Key Concepts Demonstrated

* UVM testbench architecture
* Transaction-level modeling
* Constrained-random stimulus generation
* Functional checking using scoreboard
* Modular and reusable verification components

---

## ▶️ Simulation

This project can be simulated using:

* **EDAPlayground**
* **QuestaSim**
* **VCS**

Example command (tool-dependent):

```bash
vsim -c testbench -do "run -all"
```

---
