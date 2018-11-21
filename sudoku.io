#include <iostream>
#include "sudoku_io.h"

void printSudoku(const grid& sudoku) {
    std::cout << "-------------------------" << std::endl;
    // output the sudoku nicely
    for (int i = 0; i < 9; ++i) {
        std::cout << "| ";
        for (int j = 0; j < 9; ++j) {
            int n = sudoku[i][j];
            if (n == 0) {
                std::cout << "- ";
            } else {
                std::cout << n << " ";
            }
            
            if (j == 2 || j == 5) {
                std::cout << "| ";
            }
        }
        std::cout << "|" << std::endl;
        
        if (i == 2 || i == 5) {
            std::cout << "-------------------------" << std::endl;
        }
    }
    std::cout << "-------------------------" << std::endl;
}

void putLine(grid& sudoku, int row, int c1, int c2, int c3, int c4, 
             int c5, int c6, int c7, int c8, int c9) {
    // fill a line with the values specified in c1 to c9
    // use '0' for blanks.
    sudoku[row][0] = c1;
    sudoku[row][1] = c2;
    sudoku[row][2] = c3;
    sudoku[row][3] = c4;
    sudoku[row][4] = c5;
    sudoku[row][5] = c6;
    sudoku[row][6] = c7;
    sudoku[row][7] = c8;
    sudoku[row][8] = c9;
}

void readSudokuFromInput(grid& sudoku) {
    int c1, c2, c3, c4, c5, c6, c7, c8, c9;
    for (int i = 0; i < 9; ++i) {
        std::cin >> c1 >> c2 >> c3 >> 
               c4 >> c5 >> c6 >> 
               c7 >> c8 >> c9;
        putLine(sudoku, i, c1, c2, c3, c4, c5, c6, c7, c8, c9);
    }
}
