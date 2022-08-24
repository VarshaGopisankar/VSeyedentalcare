import 'package:flutter/material.dart';
import 'package:vs1/drawerScreen.dart';
import 'package:vs1/home_page.dart';

class Anime extends StatefulWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF37970),
      body: Stack(
        children: [
          const DrawerScreen(),
          HomePage(),
        ],
      ),
    );
  }
}
