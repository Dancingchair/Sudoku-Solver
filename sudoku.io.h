#ifndef SUDOKU_IO
#define SUDOKU_IO
#include "grid_alias.h"

void printSudoku(const grid & sudoku);

void putLine(grid & sudoku, int row, int c1, int c2, int c3, int c4, 
             int c5, int c6, int c7, int c8, int c9);

void readSudokuFromInput(grid& sudoku);


#endif
