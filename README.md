# Widgets — Pascal Employee Report

A 2017 CS 153 Pascal assignment that reads employee records from standard input and prints a grouped, fixed-format report with department, plant, state, and grand totals.

## What the program does

[`Assignment_1.pas`](Assignment_1.pas) defines an `Employee` class and parses fields for state, plant, department, employee ID, name, and count. It then prints each employee followed by subtotal rows at the predefined group boundaries. The checked-in [`test.txt`](test.txt) contains 12 example records and [`widgets_out`](widgets_out) contains a reference report (grand total: **87**).

The program was written around the sample's specific state, plant, department codes and record ordering. Its subtotals are triggered by hard-coded record indices and codes; it is **not** a general-purpose CSV grouping tool.

## Prerequisites

Free Pascal, using its Object Pascal mode (`{$MODE OBJFPC}` is set in the source).

## Build and run

From the repository root:

```sh
fpc Assignment_1.pas
./Assignment_1 < test.txt > report.txt
```

On Windows, invoke the resulting `Assignment_1.exe` instead. Compare `report.txt` with `widgets_out`, accounting for platform formatting and any original-program issues. The sample input begins with a header row; the source's `readState` procedure consumes a line before parsing the first numeric state.

## Input fields

```text
STATE,PLANT,DEPT,EMPID,NAME,COUNT
12,34,56,789,George Carter,4
```

The code uses a maximum of 1,000 employee objects and a 15-character fixed-width name field. It performs character-by-character parsing rather than using a CSV library.

## Repository contents

- `Assignment_1.pas` — program, employee class, parser and report generator.
- `test.txt` — supplied input data.
- `widgets_out` — supplied reference output.

## Limitations

This is an archived classroom exercise. It assumes a particular input layout, fixed group order, and hard-coded grouping positions. It does not robustly handle arbitrary CSV, quoted fields, reordering, or large input, and has not been revalidated on a current Free Pascal release. Attribution is included in the source header.
