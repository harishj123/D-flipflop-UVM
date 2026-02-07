---

# 🔁 D Flip-Flop UVM Verification

**SystemVerilog | UVM**

## 📌 Project Overview

This project implements a **Universal Verification Methodology (UVM)** based testbench to verify the functionality of a **D Flip-Flop** design.

The verification environment validates that the output **Q correctly captures the input D on the active clock edge** and holds its value until the next clock edge.

This project is designed for **learning UVM concepts** and **demonstrating verification skills in interviews**.

---

## 🧠 Design Under Test (DUT)

* **Module:** D Flip-Flop
* **Behavior:**

  * On the rising edge of the clock, output **Q follows input D**
  * Between clock edges, output remains stable

---

## 🗂️ Project Structure

```
├── design.sv          # D Flip-Flop DUT
├── interface.sv       # Interface connecting DUT and UVM TB
├── seq_item.sv        # Transaction definition (D, clk, Q)
├── sequence.sv        # Stimulus generation
├── sequencer.sv       # Controls sequence flow
├── driver.sv          # Drives input D to DUT
├── monitor.sv         # Samples DUT output Q
├── scoreboard.sv      # Checks expected vs actual output
├── agent.sv           # Driver + Monitor + Sequencer
├── env.sv             # UVM environment
├── test.sv            # Test configuration and execution
├── testbench.sv       # Top-level testbench
```

---

## ⚙️ UVM Components Used

* **Sequence Item** – Represents D flip-flop transaction
* **Sequence** – Generates stimulus for input D
* **Sequencer** – Manages sequence execution
* **Driver** – Applies stimulus to DUT
* **Monitor** – Observes DUT output
* **Scoreboard** – Verifies correctness of output
* **Agent** – Encapsulates verification components
* **Environment** – Integrates agent and scoreboard
* **Test** – Controls simulation flow

---

## ✅ Verification Strategy

* Randomized input **D** values are generated
* Driver applies inputs at clock edges
* Monitor captures DUT output **Q**
* Scoreboard compares:

  * **Expected Q = D at previous clock edge**
  * **Actual Q from DUT**

---

## 🎯 Key Concepts Demonstrated

* UVM testbench architecture
* Transaction-level modeling
* Constrained-random stimulus
* Functional checking using scoreboard
* Reusable and modular verification design

---

## ▶️ Simulation

This project can be simulated using:

* **EDAPlayground**

Example (tool-dependent):

```bash
vsim -c testbench -do "run -all"
```

---
