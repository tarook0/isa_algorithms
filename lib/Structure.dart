// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'msoada.dart';

class Structure extends Comparable<Structure> {
  int i; //Start cellX &&current Cell
  int j; //Start cellY  &&current Cell
  int LX = 0; //END cellY         1
  int LY = 0; //END cellY          0
  int EX = 1;
  int EY = 0;
  int cost = 0; //todo
  double h = 0;
  double HC = 0;
  List<List<int>> gridState = [
    [
      0,
      1,
      1,
      1,
      1,
      0,
    ],
    [
      5,
      16,
      1,
      1,
      1,
      0,
    ],
    [
      1,
      1,
      1,
      1,
      1,
      8,
    ],
    [
      1,
      1,
      1,
      0,
      1,
      1,
    ],
    [
      1,
      1,
      1,
      1,
      16,
      1,
    ],
    [
      1,
      1,
      1,
      1,
      1,
      0,
    ],
  ];
  late List<List<int>> P = [];
  Structure({required this.i, required this.j});

//    5-------> FLAGE
//   8 ------->PLAYER
//   166-------> PLAYER WALKE ON DOUBLE WALKE CELL
//   0-------->UNWALKABLECELL
//  1--------->WALKABLECELL
//  16--------> DOUBLE WALKE CELL

  // List<List<int>> gridState = [
  //   [0, 0, 0, 0, 0, 0, 0, 0, 0],
  //   [0, 0, 0, 0, 8, 0, 0, 0, 0],
  //   [0, 0, 0, 0, 16, 1, 0, 0, 0],
  //   [0, 0, 0, 0, 16, 16, 1, 0, 0],
  //   [0, 0, 0, 0, 1, 1, 16, 1, 0],
  //   [5, 1, 1, 1, 0, 0, 1, 1, 0],
  //   [0, 1, 16, 16, 0, 0, 0, 1, 0],
  //   [0, 0, 1, 16, 1, 16, 16, 1, 0],
  //   [0, 0, 0, 0, 0, 1, 1, 0, 0],
  // ];
  //List<List<int>> gridState = [
  //  [
  //    0,
  //    1,
  //    1,
  //    1,
  //    1,
  //    0,
  //  ],
  //  [
  //    5,
  //    16,
  //    1,
  //    1,
  //    1,
  //    0,
  //  ],
  //  [
  //    1,
  //    1,
  //    1,
  //    1,
  //    1,
  //    8,
  //  ],
  //  [
  //    1,
  //    1,
  //    1,
  //    0,
  //    1,
  //    1,
  //  ],
  //  [
  //    1,
  //    1,
  //    1,
  //    1,
  //    16,
  //    1,
  //  ],
  //  [
  //    1,
  //    1,
  //    1,
  //    1,
  //    1,
  //    0,
  //  ],
  //];

  //List<List<int>> gridState = [
  //  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  //  [0, 0, 0, 0, 8, 0, 0, 0, 0],
  //  [0, 0, 0, 1, 16, 1, 0, 0, 0], //16
  //  [0, 0, 0, 1, 16, 16, 1, 0, 0],
  //  [0, 0, 0, 0, 1, 1, 16, 1, 0],
  //  [5, 1, 1, 1, 1, 1, 1, 1, 1],
  //  [0, 1, 16, 16, 0, 0, 0, 1, 1],
  //  [0, 0, 1, 16, 1, 16, 16, 1, 0],
  //  [0, 0, 0, 0, 0, 1, 1, 0, 0],
  //];
  // List<List<int>> gridState = [
  //   [
  //     5,
  //     1,
  //     8,
  //   ],
  //   [
  //     0,
  //     1,
  //     16,
  //   ],
  //   [
  //     0,
  //     0,
  //     1,
  //   ],
  // ];

  List<int> cheackMoves() {
    late List<int> moves = [];
    //      UP=0 ,
    if (i - 1 >= 0 &&
        (gridState[i - 1][j] == 16 ||
            gridState[i - 1][j] == 166 ||
            gridState[i - 1][j] == 1 ||
            gridState[i - 1][j] == 5)) {
      moves.add(0);
    }
    //     RIGHT=4
    if (j - 1 >= 0 &&
        (gridState[i][j - 1] == 16 ||
            gridState[i][j - 1] == 166 ||
            gridState[i][j - 1] == 1 ||
            gridState[i][j - 1] == 5)) {
      moves.add(3);
    }
    //    DOWN=2,
    if (i + 1 <= gridState.length - 1 &&
        (gridState[i + 1][j] == 16 ||
            gridState[i + 1][j] == 166 ||
            gridState[i + 1][j] == 1 ||
            gridState[i + 1][j] == 5)) {
      moves.add(1);
    }
    //    LEFT=3,
    if (j + 1 <= gridState[i].length - 1 &&
        (gridState[i][j + 1] == 16 ||
            gridState[i][j + 1] == 166 ||
            gridState[i][j + 1] == 1 ||
            gridState[i][j + 1] == 5)) {
      moves.add(2);
    }

    moves.shuffle();
    return moves;
  }

  bool isAllVisited() {
    return P.every((element) => element == 1);
  }

  bool stuck() {
    if (cheackMoves().isEmpty && gridState[LX][LY] != 0) {
      return true;
    }
    return false;
  }

  bool EqualCheackMoves(List<int> moves1, List<int> moves2) {
    bool cheack = false;
    if (moves1.length != moves2.length) {
      return cheack;
    }
    for (var i = 0; i < moves1.length; i++) {
      if (moves1[i] == moves2[i]) {
        cheack = true;
      } else {
        return false;
      }
    }
    return cheack;
  }

  bool equal(Structure S) {
    //check the equality of tow states(nodes - Structure) by values(deep check)
    bool counter = false;
    if ((S.i == i && S.j == j) &&
        (EqualCheackMoves(S.cheackMoves(), cheackMoves()))) {
      for (var i1 = 0; i1 < P.length; i1++) {
        for (var j1 = 0; j1 < P[i1].length; j1++) {
          if (S.P[i1][j1] == P[i1][j1]) {
            counter = true;
          } else {
            counter = false;
            return counter;
          }
        }
      }
    }
    return counter;
  }

  bool isFinal() {
    bool FF = false;
    for (var i = 0; i < P.length; i++) {
      for (var j = 0; j < P[i].length; j++) {
        if (P[i][j] == 0 || P[i][j] == 8) {
          FF = true;
        } else {
          FF = false;
          return FF;
        }
      }
    }
    return FF;
  }
  // ignore: non_constant_identifier_names

  List<Structure> GetNextSates() {
    late List<Structure> NextStates = [];
    late List<int> pdc = [];
    pdc = cheackMoves();
    for (var k = 0; k < pdc.length; k++) {
      Structure S = DeepCopy();
      S.MOVON(pdc[k], S.P);
      NextStates.add(S);
    }
    return NextStates;
  }

  Structure DeepCopy() {
    Structure newStructure = Structure(i: i, j: j);
    newStructure.cost = cost;
    if (cost == 0) {
      newStructure.P = gridState;
    } else {
      newStructure.P = P;
    }
    return newStructure;
  }
//Move algorithem
  List<List<int>> MOVON(int index, List<List<int>> gridState) {
    //PLAYER STUFFFFF
    switch (index) {
      case 0:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (i <= 0) {
            //out of  grid Range
            i = 0;
            gridState[i][j] = 8;
          } else if (gridState[i - 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (i <= 0) {
            //out of  grid Range
            i = 0;
            gridState[i][j] = 8;
          } else if (gridState[i - 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
      case 1:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (i >= gridState.length - 1) {
            //out of  grid Range
            i = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i + 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (i >= gridState.length - 1) {
            //out of  grid Range
            i = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i + 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
      case 2:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (j >= gridState.length - 1) {
            //out of  grid Range
            j = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i][j + 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (j >= gridState.length - 1) {
            //out of  grid Range
            j = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i][j + 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
      case 3:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (j <= 0) {
            //out of  grid Range
            j = 0;
            gridState[i][j] = 8;
          } else if (gridState[i][j - 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (j <= 0) {
            //out of  grid Range
            j = 0;
            gridState[i][j] = 8;
          } else if (gridState[i][j - 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
    }
    return gridState;
  }

  // void movOn(int index) {
  //   if (gridState[i][j] == 8) {
  //     P[i][j] = 8;
  //   }
  //   if (gridState[i][j - 1] == 1) {
  //     j = j - 1;
  //     P[i][j] = 8;
  //   }
  //   else if(gridState[i][j - 1] ==0){
  //     j = j - 1;
  //     P[i][j] = 8;
  //   }
  // }

  void heuristic() {
    int deltaY = EY - j;
    int deltaX = EX - i;
    h = (sqrt(pow(deltaY, 2)) + (pow(deltaX, 2)));
  }

  @override
  int compareTo(Structure other) {
    return cost.compareTo(other.cost);
  }
//Move Player
  void MOVONP(int index) {
    //PLAYER STUFFFFF
    switch (index) {
      case 0:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (i <= 0) {
            //out of  grid Range
            i = 0;
            gridState[i][j] = 8;
          } else if (gridState[i - 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (i <= 0) {
            //out of  grid Range
            i = 0;
            gridState[i][j] = 8;
          } else if (gridState[i - 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
      case 1:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (i >= gridState.length - 1) {
            //out of  grid Range
            i = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i + 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (i >= gridState.length - 1) {
            //out of  grid Range
            i = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i + 1][j] == 0) {
            i = i;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            i = i + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
      case 2:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (j >= gridState.length - 1) {
            //out of  grid Range
            j = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i][j + 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (j >= gridState.length - 1) {
            //out of  grid Range
            j = gridState.length - 1;
            gridState[i][j] = 8;
          } else if (gridState[i][j + 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j + 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
      case 3:
        if (gridState[i][j] == 8) {
          gridState[i][j] = 8;
          if (j <= 0) {
            //out of  grid Range
            j = 0;
            gridState[i][j] = 8;
          } else if (gridState[i][j - 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        } else if (gridState[i][j] == 166) {
          gridState[i][j] = 1;
          if (j <= 0) {
            //out of  grid Range
            j = 0;
            gridState[i][j] = 8;
          } else if (gridState[i][j - 1] == 0) {
            j = j;
            gridState[i][j] = 8;
          } else {
            cost = cost + 1;
            HC = h + cost;
            j = j - 1;
            if (gridState[i][j] == 16) {
              gridState[i][j] = 166;
            } else if (gridState[i][j] == 5) {
              gridState[i][j] = 8;
            } else {
              gridState[i][j] = 8;
            }
          }
        }
        break;
    }
  }
}
