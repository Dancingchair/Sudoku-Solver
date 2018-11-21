#include <iostream>
#include "grid_alias.h"
#include "sudoku_io.h"
#include "test_util.h"

/**
    Check whether a number could be placed at the specified row and column,
    according to the Sudoku rules.
    The function assumes sudoku[row][col] does not contain any value yet (= 0).
    This function reads from the `sudoku` vector, but never modifies its content.
    
    @param sudoku a sudoku grid
    @param num a number from 1 to 9
    @param row index of the row (0 to 8)
    @param col index of the column (0 to 8)
    @return bool true if and only if num is valid in (row, col)
*/
bool is_row_free(const grid& sudoku, int num, int row, int col){
  for(int count_cols = 0; count_cols < col; count_cols++){
    if(sudoku[row][count_cols] == num){
      return false;
    }
  }
  return true;
}

bool is_col_free(const grid& sudoku, int num, int row, int col){
  for(int count_rows = 0; count_rows < row; count_rows++){
    if(sudoku[count_rows][col] == num){
      return false;
    }
  }
  return true;
}

bool subgrid(const grid& sudoku, int num, int row, int col){
  if(row < 3 && col < 3){
    for(unsigned int count_rows = 0; count_rows < 3; count_rows++){
      for(unsigned int count_cols = 0; count_cols < 3; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 3 && col < 6){
    for(unsigned int count_rows = 0; count_rows < 3; count_rows++){
      for(unsigned int count_cols = 3; count_cols < 6; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 3 && col < 9){
    for(unsigned int count_rows = 0; count_rows < 3; count_rows++){
      for(unsigned int count_cols = 6; count_cols < 9; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 6 && col < 3){
    for(unsigned int count_rows = 3; count_rows < 6; count_rows++){
      for(unsigned int count_cols = 0; count_cols < 3; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 6 && col < 6){
    for(unsigned int count_rows = 3; count_rows < 6; count_rows++){
      for(unsigned int count_cols = 3; count_cols < 6; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 6 && col < 9){
    for(unsigned int count_rows = 3; count_rows < 6; count_rows++){
      for(unsigned int count_cols = 6; count_cols < 9; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 9 && col < 3){
    for(unsigned int count_rows = 6; count_rows < 9; count_rows++){
      for(unsigned int count_cols = 0; count_cols < 3; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 9 && col < 6){
    for(unsigned int count_rows = 6; count_rows < 9; count_rows++){
      for(unsigned int count_cols = 3; count_cols < 6; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  } else if(row < 9 && col < 9){
    for(unsigned int count_rows = 6; count_rows < 9; count_rows++){
      for(unsigned int count_cols = 6; count_cols < 9; count_cols++){
        if(sudoku[count_rows][count_cols] == num){
          return false;
        }
      }
    }
    return true;
  }
  return 0;
}

bool isValid(const grid& sudoku, int num, int row, int col) {
  // TODO
  if(sudoku[row][col] == 0){
    //check if row does not contain the num value yet
//      std::cout << "\nfield is free\n";
    if(is_row_free(sudoku, num, row, 9)){
//        std::cout << "\nrow is free\n";
      //check if col does not contain the num value yet
      if(is_col_free(sudoku, num, 9, col)){
//          std::cout << "\ncol is free\n";
        //check if 3-by-3 subgrid already contains num
        if(subgrid(sudoku, num, row, col)){
//            std::cout << "\nsubgrid is free\n";
          return true;
        }
      }
    }
  }
  return false;
    // DEBUGGING TIPS!
    // We provide a tester for this function, so you can make sure to have this
    // implemented correctly before diving into fillValidNumber(...)
    // The test is enabled by default (see main() method) and prints a warning
    // on the console if a mistake is detected.
}

/**
    Tries to put a valid number into the specified cell (using 'isValid').
    If a valid number has been found, it calls itself on a next cell recursively.
    If that recursive call returns FALSE, it tries to find a different valid 
    number for the current cell and starts a new recursion (Backtracking step).
    
    @param sudoku a sudoku grid
    @param num number to verify (1 to 9)
    @param row index of the row (0 to 8)
    @param col index of the column (0 to 8)
    @return bool true if successfully put a number in the current cell and 
            successfully called itself on subsequent cells; false otherwise

*/
bool fillValidNumber(grid& sudoku, int row, int col) {
  int nextNumber = 1;
  
  //stops recursion when done with all rows and cols. In other words: we just solved the sudoku. :-)
  if(row == 9){
    return true;
  }
  
  //checks if the wanted field is empty or not
  if(sudoku[row][col] != 0){
    if(col == 8){
      //if this filled field is at the end of a row. If so, calls function recursivly on next row
      if(fillValidNumber(sudoku, row + 1, 0)){
        return true;
      }
    } else {
      //if this filled field is NOT at the end of a row, just move on to the next field of the same row.
      if(fillValidNumber(sudoku, row, col + 1)){
        return true;
      }
    }
    return 0;
  }
  
  //fills in a number in after checking if the field is valid
  //PROBLEM:  every time we jump to the next field, we start trying to put in 1 and so on,
  //          therefore this kind of solution with a for loop takes a lot of time.
  for(; nextNumber < 10; nextNumber++){
    if(isValid(sudoku, nextNumber, row, col)){
      sudoku[row][col] = nextNumber;
      if(col == 8){
        //jumps to next row when col is full (value of col reached 8)
        if(fillValidNumber(sudoku, row + 1, 0)){
          return true;
        }
      } else {
        //jumps to next field on the same row, if we did not reach the end of the row yet.
        if(fillValidNumber(sudoku, row, col + 1)){
          return true;
        }
      }
      //If we failed to place nextNumber in this part. field, set the field back to 0 (empty)
      //and restart for loop with a bigger nextNumber. If it doesnt work with any nums from 
      //1-9, we jump one field back, since we fall out of this "for" loop and run into the
      //return false on line 210, this lets the field before know that its value generated
      //an error in the following one. And therefore tells it to increase its own value by 
      //one, since its value was also set in this for loop.
      sudoku[row][col] = 0;
    }
  }
  return false;
}
    // DEBUGGING TIPS!
    // to debug your program, it might help to print out the current row and col
    // together with any local variables that are of interest. Also you can call
    // printSudoku(sudoku) from here to debug, but don't forget to remove it again
    // otherwise there will be too much output for CodeExpert to handle
    // and the program gets interrupted.



int main() {
  
    // Store the Sudoku as 2D vector (row-wise).
    // sudoku[i][j] refer to cell at row i and column j.
    grid sudoku(9,std::vector<int>(9,0));
  
    // Run some tests on isValid() function. If the function does not fulfill
    // the requirements it will display a warning on the console.
    // Make sure this test pass before implementing fillValidNumber().
    // Then you can safely comment out this line.
    test_isValid(isValid, sudoku);
    
    // Call util function to fill sudoku array with some input
    readSudokuFromInput(sudoku);

    // Solve by starting from first cell in the grid
    bool isSolved = fillValidNumber(sudoku,0,0);
    
    
    // Print out the sudoku in its current state
    std::cout << "FINAL RESULT" << std::endl; // solver result after this string
    if(isSolved) {
        printSudoku(sudoku);
    } else {
        std::cout << "No solution found." << std::endl;
    }
    return 0;
}
