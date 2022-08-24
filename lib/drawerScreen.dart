import 'package:flutter/material.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State <DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70, bottom: 70, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Varsha', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                  Text('Patient ID: 01', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)
                ],
              )
            ],
          ),

          Row(
            children: [
              Icon(Icons.settings, color: Colors.white,),
              SizedBox(width: 5,),
              Text('Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(width: 2, height: 20, color: Colors.white,),
              SizedBox(width: 10,),
              Icon(Icons.logout_outlined , color: Colors.white,),
              SizedBox(width: 5,),
              Text('Log Out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
            ],
          )
        ],
      )
    );
  }
}

