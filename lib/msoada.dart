// //  void MOVON2(int index) {
// //     //PLAYER STUFFFFF
// //     switch (index) {
// //       case 0:
// //         if (gridState[i][j] == 8) {
// //           gridStateC[i][j] = 0;
// //           if (i <= 0) {
// //             //out of  grid Range
// //             i = 0;
// //             gridStateC[i][j] = 8;
// //           } else if (gridState[i - 1][j] == 0) {
// //             i = i;
// //             gridStateC[i][j] = 8;
// //           } else {
// //             cost = cost++;
// //             i = i - 1;
// //             if (gridState[i][j] == 16) {
// //               gridStateC[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridStateC[i][j] = 0;
// //             } else {
// //               gridStateC[i][j] = 8;
// //             }
// //           }
// //         } else if (gridState[i][j] == 166) {
// //           gridStateC[i][j] = 1;
// //           if (i <= 0) {
// //             //out of  grid Range
// //             i = 0;
// //             gridStateC[i][j] = 8;
// //           } else if (gridState[i - 1][j] == 0) {
// //             i = i;
// //             gridStateC[i][j] = 8;
// //           } else {
// //             cost = cost++;
// //             i = i - 1;
// //             if (gridState[i][j] == 16) {
// //               gridStateC[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridStateC[i][j] = 0;
// //             } else {
// //               gridStateC[i][j] = 8;
// //             }
// //           }
// //         }
// //         break;
// //       case 1:
// //         if (gridState[i][j] == 8) {
// //           gridStateC[i][j] = 0;
// //           if (i >= gridState.length - 1) {
// //             //out of  grid Range
// //             i = gridState.length - 1;
// //             gridStateC[i][j] = 8;
// //           } else if (gridState[i + 1][j] == 0) {
// //             i = i;
// //             gridStateC[i][j] = 8;
// //           } else {
// //             cost = cost + 1;
// //             i = i + 1;
// //             if (gridState[i][j] == 16) {
// //               gridStateC[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridStateC[i][j] = 0;
// //             } else {
// //               gridStateC[i][j] = 8;
// //             }
// //           }
// //         } else if (gridState[i][j] == 166) {
// //           gridStateC[i][j] = 1;
// //           if (i >= gridState.length - 1) {
// //             //out of  grid Range
// //             i = gridState.length - 1;
// //             gridStateC[i][j] = 8;
// //           } else if (gridState[i + 1][j] == 0) {
// //             i = i;
// //             gridStateC[i][j] = 8;
// //           } else {
// //             cost = cost + 1;
// //             i = i + 1;
// //             if (gridState[i][j] == 16) {
// //               gridStateC[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridStateC[i][j] = 0;
// //             } else {
// //               gridStateC[i][j] = 8;
// //             }
// //           }
// //         }
// //         break;
// //       case 2:
// //         if (gridState[i][j] == 8) {
// //           gridStateC[i][j] = 0;
// //           if (j >= gridState.length - 1) {
// //             //out of  grid Range
// //             j = gridState.length - 1;
// //             gridStateC[i][j] = 8;
// //           } else if (gridState[i][j + 1] == 0) {
// //             j = j;
// //             gridStateC[i][j] = 8;
// //           } else {
// //             cost = cost + 1;
// //             j = j + 1;
// //             if (gridState[i][j] == 16) {
// //               gridStateC[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridStateC[i][j] = 0;
// //             } else {
// //               gridStateC[i][j] = 8;
// //             }
// //           }
// //         } else if (gridState[i][j] == 166) {
// //           gridStateC[i][j] = 1;
// //           if (j >= gridState.length - 1) {
// //             //out of  grid Range
// //             j = gridState.length - 1;
// //             gridStateC[i][j] = 8;
// //           } else if (gridState[i][j + 1] == 0) {
// //             j = j;
// //             gridStateC[i][j] = 8;
// //           } else {
// //             cost = cost + 1;
// //             j = j + 1;
// //             if (gridState[i][j] == 16) {
// //               gridStateC[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridStateC[i][j] = 0;
// //             } else {
// //               gridStateC[i][j] = 8;
// //             }
// //           }
// //         }
// //         break;
// //       case 3:
// //         if (gridState[i][j] == 8) {
// //           gridState[i][j] = 0;
// //           if (j <= 0) {
// //             //out of  grid Range
// //             j = 0;
// //             gridState[i][j] = 8;
// //           } else if (gridState[i][j - 1] == 0) {
// //             j = j;
// //             gridState[i][j] = 8;
// //           } else {
// //             cost = cost + 1;
// //             j = j - 1;
// //             if (gridState[i][j] == 16) {
// //               gridState[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridState[i][j] = 0;
// //             } else {
// //               gridState[i][j] = 8;
// //             }
// //           }
// //         } else if (gridState[i][j] == 166) {
// //           gridState[i][j] = 1;
// //           if (j <= 0) {
// //             //out of  grid Range
// //             j = 0;
// //             gridState[i][j] = 8;
// //           } else if (gridState[i][j - 1] == 0) {
// //             j = j;
// //             gridState[i][j] = 8;
// //           } else {
// //             cost = cost + 1;
// //             j = j - 1;
// //             if (gridState[i][j] == 16) {
// //               gridState[i][j] = 166;
// //             } else if (gridState[i][j] == 5) {
// //               gridState[i][j] = 0;
// //             } else {
// //               gridState[i][j] = 8;
// //             }
// //           }
// //         }
// //         break;
// //     }
// //   }

// List<List<int>> GridState = [
//   [
//     0,
//     1,
//     1,
//     1,
//     1,
//     0,
//   ],
//   [
//     5,
//     16,
//     1,
//     1,
//     1,
//     0,
//   ],
//   [
//     1,
//     1,
//     1,
//     1,
//     1,
//     8,
//   ],
//   [
//     1,
//     1,
//     1,
//     0,
//     1,
//     1,
//   ],
//   [
//     1,
//     1,
//     1,
//     1,
//     16,
//     1,
//   ],
//   [
//     1,
//     1,
//     1,
//     1,
//     1,
//     0,
//   ],
// ];

// // List<List<int>> gridStateC = [
// //     [
// //       0,
// //       1,
// //       1,
// //       1,
// //       1,
// //       0,
// //     ],
// //     [
// //       1,
// //       1,
// //       1,
// //       1,
// //       1,
// //       0,
// //     ],
// //     [
// //       1,
// //       1,
// //       1,
// //       1,
// //       1,
// //       8,
// //     ],
// //     [
// //       1,
// //       1,
// //       1,
// //       0,
// //       1,
// //       1,
// //     ],
// //     [
// //       1,
// //       1,
// //       1,
// //       1,
// //       1,
// //       1,
// //     ],
// //     [
// //       1,
// //       1,
// //       1,
// //       1,
// //       1,
// //       0,
// //     ],
// //   ];

// List<List<int>> MOVON(int index, List<List<int>> gridState, int i, int j,
//     int cost, double h, double HC) {
//   //PLAYER STUFFFFF
//   switch (index) {
//     case 0:
//       if (gridState[i][j] == 8) {
//         gridState[i][j] = 0;
//         if (i <= 0) {
//           //out of  grid Range
//           i = 0;
//           gridState[i][j] = 8;
//         } else if (gridState[i - 1][j] == 0) {
//           i = i;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost++;
//           HC = h + cost;
//           i = i - 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       } else if (gridState[i][j] == 166) {
//         gridState[i][j] = 1;
//         if (i <= 0) {
//           //out of  grid Range
//           i = 0;
//           gridState[i][j] = 8;
//         } else if (gridState[i - 1][j] == 0) {
//           i = i;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost++;
//           HC = h + cost;
//           i = i - 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       }
//       break;
//     case 1:
//       if (gridState[i][j] == 8) {
//         gridState[i][j] = 0;
//         if (i >= gridState.length - 1) {
//           //out of  grid Range
//           i = gridState.length - 1;
//           gridState[i][j] = 8;
//         } else if (gridState[i + 1][j] == 0) {
//           i = i;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost + 1;
//           HC = h + cost;
//           i = i + 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       } else if (gridState[i][j] == 166) {
//         gridState[i][j] = 1;
//         if (i >= gridState.length - 1) {
//           //out of  grid Range
//           i = gridState.length - 1;
//           gridState[i][j] = 8;
//         } else if (gridState[i + 1][j] == 0) {
//           i = i;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost + 1;
//           HC = h + cost;
//           i = i + 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       }
//       break;
//     case 2:
//       if (gridState[i][j] == 8) {
//         gridState[i][j] = 0;
//         if (j >= gridState.length - 1) {
//           //out of  grid Range
//           j = gridState.length - 1;
//           gridState[i][j] = 8;
//         } else if (gridState[i][j + 1] == 0) {
//           j = j;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost + 1;
//           HC = h + cost;
//           j = j + 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       } else if (gridState[i][j] == 166) {
//         gridState[i][j] = 1;
//         if (j >= gridState.length - 1) {
//           //out of  grid Range
//           j = gridState.length - 1;
//           gridState[i][j] = 8;
//         } else if (gridState[i][j + 1] == 0) {
//           j = j;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost + 1;
//           HC = h + cost;
//           j = j + 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       }
//       break;
//     case 3:
//       if (gridState[i][j] == 8) {
//         gridState[i][j] = 0;
//         if (j <= 0) {
//           //out of  grid Range
//           j = 0;
//           gridState[i][j] = 8;
//         } else if (gridState[i][j - 1] == 0) {
//           j = j;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost + 1;
//           HC = h + cost;
//           j = j - 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       } else if (gridState[i][j] == 166) {
//         gridState[i][j] = 1;
//         if (j <= 0) {
//           //out of  grid Range
//           j = 0;
//           gridState[i][j] = 8;
//         } else if (gridState[i][j - 1] == 0) {
//           j = j;
//           gridState[i][j] = 8;
//         } else {
//           cost = cost + 1;
//           HC = h + cost;
//           j = j - 1;
//           if (gridState[i][j] == 16) {
//             gridState[i][j] = 166;
//           } else if (gridState[i][j] == 5) {
//             gridState[i][j] = 0;
//           } else {
//             gridState[i][j] = 8;
//           }
//         }
//       }
//       break;
//   }
//   return gridState;
// }
