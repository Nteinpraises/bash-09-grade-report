# Grade Report

This is a Bash script that reads a CSV file of student scores and prints each student's total, average and mention.

## Problem Statement

At the end of every month, instructors receive a spreadsheet of scores and
spend an evening calculating averages by hand. `grades.sh` reads the scores
from a CSV file and calculates the average and the mention for every student
in a couple of seconds.

## Project Status

This is a work in progress, built one slice at a time.

- Done: usage check, reading the CSV file, total and average, mention
- Still to come: input validation, sorting with ranks, aligned columns and the class average footer

## Tech Stack

- Bash
- awk
- Git and GitHub (feature branch and pull request workflow)
- Ubuntu terminal, VS Code

## Screenshot

![alt text](<assets/img/Pasted image.png>)

## Features

- Takes the CSV file as its only argument
- Prints a usage message and exits with status 1 if the argument is missing
- Prints an error on stderr and exits with status 1 if the file cannot be read
- Skips the header line and reads one student per line
- Adds up the four scores to get a total out of 80
- Calculates the average with 2 decimals using awk
- Gives a mention: Très bien from 16, Bien from 14, Assez bien from 12, Passable from 10, Échec below 10

## Installation and Usage

Clone the repository and make the script executable:

```bash
git clone https://github.com/Nteinpraises/bash-09-grade-report.git
cd bash-09-grade-report
chmod +x grades.sh
```

Run it on a CSV file:

```bash
./grades.sh grades.csv
```

The file must start with this header line:

```text
name,html,css,bash,git
```

## How the Mention Works

Bash cannot compare decimal numbers such as 16.50, so the mention is decided
from the total out of 80 (four scores out of 20). An average of 16 is a total
of 64, so the thresholds are 64, 56, 48 and 40.

## How to Test It

```bash
./grades.sh; echo $?
./grades.sh nofile.csv; echo $?
./grades.sh grades.csv
```

1. Without an argument, the usage message and `1` must appear.
2. With a missing file, an error and `1` must appear.
3. Brenda Fon must show a total of 74 and an average of 18.50.
4. A student with a total of exactly 64 must get Très bien, and 63 must get Bien.

## Challenges Faced

- **Decimals in Bash.** Bash only handles whole numbers, so the average is
  calculated with awk and the mention is decided from the total.
- **Printing the wrong thing.** I used `print` instead of `printf` in awk and
  got the text `%.2f` in the output instead of the average.

## What I Learned

- Reading a CSV file with `while IFS=',' read -r`
- Skipping a header with a line counter
- Doing arithmetic with `$(( ))` and decimals with `awk -v`
- Choosing between values with `if`, `elif` and `else`

## Known Limits

- Invalid lines are not detected yet, so a line with a missing or non-numeric score gives a wrong result.
- Windows line endings and extra spaces are not cleaned yet.
- The output is not sorted, ranked or aligned yet, and there is no class average.

## Author

Ntein Praises
