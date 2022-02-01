import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  padding: const EdgeInsets.only(left: 28.0),
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: const EdgeInsets.only(right: 28.0),
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: const EdgeInsets.only(left: 28.0),
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: const EdgeInsets.only(right: 28.0),
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed("/menu");
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              // elevation: 5.0,
            ),
          ),
        ));
  }
}
