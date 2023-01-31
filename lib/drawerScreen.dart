import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'configuration.dart';


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
                    Text('Varsha', style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text('Patient ID: 01', style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                  ],
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: drawerOptions.map((element) => Padding(
                padding: const EdgeInsets.all(8.0),
                child:  SizedBox(
                  height: 40,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => element['nav']));
                    },
                    leading: Icon(
                      element['icon'],
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      element['title'],
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )).toList(),
            ),

            Row(
              children: [
                Icon(Icons.settings, color: Colors.white,),
                SizedBox(width: 5,),
                Text('Settings', style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Container(width: 2, height: 20, color: Colors.white,),
                SizedBox(width: 10,),
                Icon(Icons.logout_outlined , color: Colors.white,),
                SizedBox(width: 5,),
                Text('Log Out', style: GoogleFonts.raleway(color: Colors.white, fontWeight: FontWeight.bold),)
              ],
            )
          ],
        )
    );
  }
}

