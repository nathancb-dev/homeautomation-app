// ignore: file_names
import 'package:flutter/material.dart';

import 'sidebarWidgets.dart';

class SidebarPage extends StatelessWidget {
  const SidebarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SidebarItems(),
    );
  }
}
