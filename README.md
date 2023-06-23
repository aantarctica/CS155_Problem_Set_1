# EASY Language Token Analyzer

## CS 155 Problem Set

### AY 2022-2023 2nd Semester

Author: Mutya Gulapa

Student Number: 2019-02706

### Preliminaries

This is a token analyzer for the `EASY` language developed in `wsl` `Ubuntu` and executed using `flex`.

Device requirements: Installed with `flex`.

### Running the program

To run the program, run the following lines on the terminal:

```
flex easy_analyzer.lex
gcc lex.yy.c
./a.out <input_file>
```

Sample `input_files` can be found under the `test_cases` folder.
