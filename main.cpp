#include "s21_matrix_oop.h"

int main() {
  int rows = 3, cols = 3;
  S21Matrix matrix(rows, cols);
  matrix(0, 0) = 42;
  matrix(0, 1) = 16;
  matrix(0, 2) = 31;

  matrix(1, 0) = 74;
  matrix(1, 1) = 35;
  matrix(1, 2) = 31;

  matrix(2, 0) = 63;
  matrix(2, 1) = 13;
  matrix(2, 2) = 74;

  // rows = 3;
  // cols = 4;

  // S21Matrix matrix2(rows, cols);
  // matrix2(0, 0) = 1;
  // matrix2(0, 1) = 2;
  // matrix2(0, 2) = 3;
  // matrix2(0, 3) = 4;

  // matrix2(1, 0) = 5;
  // matrix2(1, 1) = 6;
  // matrix2(1, 2) = 7;
  // matrix2(1, 3) = 8;

  // matrix2(2, 0) = 9;
  // matrix2(2, 1) = 10;
  // matrix2(2, 2) = 11;
  // matrix2(2, 3) = 12;

  // matrix2.print();
  S21Matrix matrix2(matrix.InverseMatrix());
  matrix2.print();
  // std::cout << det << '\n';

  std::cout << "\n";

  matrix.print();
}