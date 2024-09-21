import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(
      const MaterialApp(
        home: BottomNavBar(),
      ),
    );

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
  Widget build(BuildContext context) => Scaffold(
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
              style: const TextStyle(
                fontSize: 350,
              ),
            ),
          ),
        ),
      );
}
