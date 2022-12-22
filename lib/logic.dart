// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, avoid_function_literals_in_foreach_calls
import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:stack/stack.dart' as eos;
import 'package:isa/Structure.dart';

class Logic {
  Structure S;
  Logic({
    required this.S,
  });

  void UserPlay(Structure S, index) {
     S.MOVONP(index);
  }

  Structure BFS() {
    Queue<Structure> states = Queue<Structure>();
    late List<Structure> visited = [];
    final start = DateTime.now();
    int cycles = 0;
    int NodesNumber = 0;
    states.addFirst(S);
    bool loopy = false;
    while (states.isNotEmpty) {
      //states.remove(null);
      visited.remove(null);
      CheackTow(visited);
      Structure current = states.removeLast();
      cycles++;
      debugPrint("I=${current.i.toString()}");
      debugPrint("J=${current.j.toString()}");
      debugPrint("CYCLES=${cycles.toString()}");
      if (current.isFinal() == true) {
        loopy == true;
        final end = DateTime.now();
        final time = end.difference(start);
        visited.forEach((element) {
          debugPrint("[i:${element.i} ,j:${element.j}]");
        });
        debugPrint("NudeNumber=${NodesNumber.toString()}");
        debugPrint('TOTAL TIME=$time');
        debugPrint("CYCLES=${cycles.toString()}");
        debugPrint(" ******* BFS DONE YOU WIN*******");
        return current;
      }
      visited.add(current);
      List<Structure> moves = current.GetNextSates();

      moves.forEach((element) {
        NodesNumber = NodesNumber + 1;
        if (!Included(visited, element)) {
          states.addFirst(element);
          debugPrint(" TTTTTTTTTTTTTTTT${element.i} ${element.j}");
        }
      });
    }
    final end = DateTime.now();
    final time = end.difference(start);
    visited.forEach((element) {
      debugPrint("[i:${element.i} ,j:${element.j}]");
    });
    debugPrint(" BFS DONE *******YOU LOST*******");
    debugPrint('TOTAL TIME=$time');
    return S;
  }

  Structure DFS() {
    late eos.Stack<Structure> states1 = eos.Stack<Structure>();
    late List<Structure> visited = [];
    int cycles = 0;
    int NodesNumber = 0;
    final start = DateTime.now();
    states1.push(S);
    while (states1.isNotEmpty) {
      CheackTow(visited);
      Structure current1 = states1.pop();
      cycles++;
      debugPrint("I=${current1.i.toString()}");
      debugPrint("J=${current1.j.toString()}");
      debugPrint("CYCLES=${cycles.toString()}");
      if (current1.isFinal() == true) {
        final end = DateTime.now();
        final time = end.difference(start);
        visited.forEach((element) {
          debugPrint("[i:${element.i} ,j:${element.j}]");
        });
        debugPrint("CYCLES=${cycles.toString()}");
        debugPrint("NudeNumber=${NodesNumber.toString()}");
        debugPrint('TOTAL TIME=$time');
        debugPrint(" ******* DFS DONE YOU WIN*******");
        return current1;
      }
      visited.add(current1);
      List<Structure> moves1 = current1.GetNextSates();
      for (var ii = 0; ii < moves1.length; ii++) {
        NodesNumber = NodesNumber + 1;
        if (!Included(visited, moves1[ii])) {
          states1.push(moves1[ii]);
        }
      }
    }
    final end = DateTime.now();
    final time = end.difference(start);
    visited.forEach((element) {
      debugPrint("[i:${element.i} ,j:${element.j}]");
    });
    debugPrint('TOTAL TIME=$time');
    debugPrint("DFS DONE YOU LOST");
    return S;
  }

  Structure UCS() {
    late PriorityQueue<Structure> states =
        PriorityQueue((p0, p1) => p0.cost.compareTo(p1.cost));
    late List<Structure> visited = [];
    int cycles = 0;
    int NodesNumber = 0;
    final start = DateTime.now();
    states.clear();
    states.add(S);
    while (states.isNotEmpty) {
      visited.remove(null);
      CheackTow(visited);
      Structure current = states.removeFirst();
      cycles++;
      debugPrint("I=${current.i.toString()}");
      debugPrint("J=${current.j.toString()}");
      debugPrint("CYCLES=${cycles.toString()}");
      if (current.isFinal() == true) {
        final end = DateTime.now();
        final time = end.difference(start);
        visited.forEach((element) {
          debugPrint("[i:${element.i} ,j:${element.j}]");
        });
        debugPrint("CYCLES=${cycles.toString()}");
        debugPrint("NudeNumber=${NodesNumber.toString()}");
        debugPrint('TOTAL TIME=$time');
        debugPrint(" ******* UCS DONE YOU WIN*******");
        return current;
      }
      visited.add(current);
      List<Structure> moves = current.GetNextSates();
      for (Structure element in moves) {
        NodesNumber = NodesNumber + 1;
        if (!Included(visited, element)) {
          states.add(element);
        }
      }
    }
    debugPrint("UCS DONE YOU LOST");
    final end = DateTime.now();
    final time = end.difference(start);
    visited.forEach((element) {
      debugPrint("[i:${element.i} ,j:${element.j}]");
    });
    debugPrint('TOTAL TIME=$time');
    return S;
  }

  Structure AStar() {
    //////////////////       HC =HEURISTIC +COST    ///////////////
    late PriorityQueue<Structure> states = PriorityQueue<Structure>(
      (p0, p1) => p0.HC.compareTo(p1.HC),
    );
    late List<Structure> visited = [];
    int cycles = 0;
    int NodesNumber = 0;
    final start = DateTime.now();
    states.clear();
    states.add(S);
    while (states.isNotEmpty) {
      visited.remove(null);
      CheackTow(visited);
      Structure current = states.removeFirst();
      //////////////////       calculate heuristic     ///////////////
      current.heuristic();
      /////////////////////////////////
      cycles++;
      debugPrint("I=${current.i.toString()}");
      debugPrint("J=${current.j.toString()}");
      debugPrint("CYCLES=${cycles.toString()}");
      if (current.isFinal() == true) {
        final end = DateTime.now();
        final time = end.difference(start);
        visited.forEach((element) {
          debugPrint("[i:${element.i} ,j:${element.j}]");
        });
        debugPrint("NudeNumber=${NodesNumber.toString()}");
        debugPrint("CYCLES=${cycles.toString()}");
        debugPrint('TOTAL TIME=$time');
        debugPrint(" ******* A STAR DONE YOU WIN*******");
        return current;
      }
      visited.add(current);
      List<Structure> moves = current.GetNextSates();
      for (Structure element in moves) {
        NodesNumber = NodesNumber + 1;
        if (!Included(visited, element)) {
          states.add(element);
        }
      }
    }
    debugPrint("Astar DONE YOU LOST");
    final end = DateTime.now();
    final time = end.difference(start);
    visited.forEach((element) {
      debugPrint("[i:${element.i} ,j:${element.j}]");
    });
    debugPrint('TOTAL TIME=$time');
    return S;
  }

  bool Included(List<Structure> states, Structure O) {
    for (int jj = 0; jj < states.length; jj++) {
      if (states[jj].equal(O)) {
        return true;
      }
    }
    return false;
  }

  void CheackTow(List<Structure> T) {
    for (var element = 0; element < T.length; element++) {
      int i = T[element].i;
      int j = T[element].j;
      if (T[element].gridState[i][j] == 1) {
        T.remove(T[element]);
      }
    }
  }
}
