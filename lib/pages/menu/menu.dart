import 'package:flutter/material.dart';
import '../home/home.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenHeight, screenWidth;
  final Duration duration = const Duration(milliseconds: 400);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Color(0xfff416165),
      body: (Stack(
        children: [
          menu(context),
          homePage(context),
        ],
      )),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homePage(context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          elevation: 10,
          color: Color(0xfff416165),
          child: Container(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          if (isCollapsed) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    const Center(
                      child: Text(
                        "My Ambient",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
                SizedBox(
                  height: size.height * 0.90,
                  width: size.width,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    pageSnapping: true,
                    children: [Home()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
