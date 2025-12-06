This project implements a day-of-week calculator in Verilog HDL.
Given a date, month, and year, the module computes the corresponding day of the week (0–6) using modular arithmetic and calendar codes.
A testbench is included to verify correctness through simulation.

📂 Files in This Repository
fcal.v

Main Verilog module.
Inputs:
date (1–31)
month (1–12)
year (e.g., 1700–2099)
Output:
day (0 = Sunday, 1 = Monday, …, 6 = Saturday)

**fcal_tb.v**

Testbench that simulates multiple sample dates.
Prints weekday results during simulation.
