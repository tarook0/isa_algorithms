import 'package:flutter/material.dart';
import 'package:isa/logic.dart';
import 'Structure.dart';

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
//var S = Structure(i: 0, j: 2);
//var S = Structure(i: 1, j: 4);
var S = Structure(i: 2, j: 5);
var L = Logic(S: S);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin<MyHomePage> {
  int _currentIndex = 0;
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(destination: destination);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            //L.UserPlay(S, index);
            //L.UCS();
            L.AStar();
            //L.BFS();
            //L.DFS();
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              backgroundColor: destination.color,
              label: ' ');
        }).toList(),
      ),
    );
  }
}

class Destination {
  const Destination(this.icon, this.color);
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(Icons.arrow_circle_up_outlined, Colors.orange),
  Destination(Icons.arrow_circle_down_outlined, Colors.orange),
  Destination(Icons.arrow_circle_right_outlined, Colors.orange),
  Destination(Icons.arrow_circle_left_outlined, Colors.orange),
];

class DestinationView extends StatefulWidget {
  const DestinationView({Key? key, required this.destination})
      : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'BFS & DFS',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BFS & DFS'),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[100],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: _buildGameBody(),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

Widget _buildGameBody() {
  int gridStateLength = S.gridState.length;
  return Column(children: <Widget>[
    AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2.0)),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridStateLength,
          ),
          itemBuilder: _buildGridItems,
          itemCount: gridStateLength * gridStateLength,
        ),
      ),
    ),
  ]);
}

Widget _buildGridItems(BuildContext context, int index) {
  int gridStateLength = S.gridState.length;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);
  return GestureDetector(
    child: GridTile(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Center(
          child: _buildGridItem(x, y),
        ),
      ),
    ),
  );
}

Widget _buildGridItem(int x, int y) {
  switch (S.gridState[x][y]) {
    case 0: //un walke able tile
      return Container(
        color: Colors.black45,
      );
    case 8: //PLAYER BLUE
      return Container(
        color: Colors.blue,
      );
    case 1:
      return Container(
        color: Colors.white,
      );
    case 5: //goal tile
      return Container(
        color: Colors.red,
      );
    case 16: //double walke able tile
      return Container(
        color: Colors.grey,
      );
    case 166: //double walke able tile
      return Container(
        color: Colors.cyan,
      );
    default:
      return Text(S.gridState[x][y].toString());
  }
}
