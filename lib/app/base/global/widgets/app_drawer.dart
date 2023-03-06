import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          AppBar(
            backgroundColor: Colors.blue,
            toolbarHeight: 70,
            title: const Center(child: Text('App')),
            automaticallyImplyLeading: false,
            centerTitle: false,
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
            ),
            title: const Text("Dashboard"),
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed(Dashboard.routeName);
            },
          ),
        ]),
      ),
    );
  }
}
