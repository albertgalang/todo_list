import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      centerTitle: true,
      title: Text("Simple TODO App"),
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);
}
