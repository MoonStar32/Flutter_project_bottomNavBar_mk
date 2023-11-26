import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MaterialApp(
    home: BottomNavBar(),
  ));
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int page = 0;

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  getColor() {
    if (page == 0) {
      return Colors.blueAccent;
    } else if (page == 1) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Title'),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: Center(
          child: Text('Page'),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: getColor(),
        key: bottomNavigationKey,
        index: 0,
        height: 60,
        items: const <Widget>[
          Icon(
            Icons.list,
            size: 30,
          ),
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
          ),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: Container(
        color: getColor(),
        child: Center(
          child: Text(
            page.toString(),
            textScaleFactor: 25,
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// void main() => runApp(MaterialApp(home: BottomNavBar()));

// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _page = 0;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       drawer: Drawer(
//         child: Center(child: Text("Page")),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: 0,
//         height: 60.0,
//         items: <Widget>[
//           Icon(Icons.list, size: 30),
//           Icon(Icons.add, size: 30),
//           Icon(Icons.perm_identity, size: 30),
//         ],
//         color: Colors.white,
//         buttonBackgroundColor: Colors.white,
//         backgroundColor: Colors.blueAccent,
//         animationCurve: Curves.easeInOut,
//         animationDuration: Duration(milliseconds: 500),
//         onTap: (index) {
//           setState(() {
//             _page = index;
//           });
//         },
//         letIndexChange: (index) => true,
//       ),
//       body: Container(
//         color: Colors.blueAccent,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(_page.toString(), textScaleFactor: 25.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
