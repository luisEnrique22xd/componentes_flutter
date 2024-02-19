import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de flutter')
        ),
        body: ListView(
          children:const <Widget> [
            ListTile(
              title: Text('ando enfermo ptm'),
              subtitle: Text('inviten un bacardios o una pastilla'),
              leading: Icon(Icons.sick),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
            ListTile(
              title: Text('los warrios van a ganar anillo este año'),
              subtitle: Text('no me molesten en los playoffs'),
              leading: Icon(Icons.sports_basketball_rounded),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
            Divider(),
             ListTile(
              title: Text('Golden State Warrios NBA Champions 2022'),
              subtitle: Text('Boston, Massachusetts 06/16/2022'),
              leading: Icon(Icons.sports_basketball_rounded),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
          ],
        ),
    );
  }
}