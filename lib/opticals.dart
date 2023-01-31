import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:google_fonts/google_fonts.dart';

class OpticalsPage extends StatefulWidget {
  const OpticalsPage({required key}) : super(key: key);

  @override
  State<OpticalsPage> createState() => _OpticalsPageState();
}

class _OpticalsPageState extends State<OpticalsPage> {

  int _current = 0;

  final List<String> images = [
    'images/ad1.jpeg',
    'images/ad4.jpeg',
    'images/ad5.jpeg',
    'images/ad6.jpeg',
    'images/ad7.jpeg',
    'images/ad9.jpeg',
    'images/ad10.jpeg',
    'images/ad11.png',
    'images/ad12.jpeg',
  ];

  List titles = ['Book an appointment',
  'Check status of your order',
  ];

  List<Widget> generateImagesTiles(){
    return images.map((element) => ClipRRect(
      child: Image.asset(element,
      width: 700,
      height: 600,
      fit:BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(15.0),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff9db),
      appBar: AppBar(
        backgroundColor: Color(0xffdd5546),
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xfffff9db),
            padding: EdgeInsets.only(top:40),
            child: Stack(
              children: [
                CarouselSlider(items: generateImagesTiles(),
                    options: CarouselOptions(
                       enlargeCenterPage: true,
                      autoPlay: true,
                    )
                )
              ],
            ),
          ),
    SizedBox(height: 30,),
    Container(
      height: 500,
    child: ListView.builder(
    itemCount: titles.length,
    itemBuilder:(BuildContext context, int index) {
      return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
          child: Container(
            height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffdd5546),
              ),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text(
                titles[index],
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
              ),
              ),
            ),
          ),
      );
    }
    )
    )
        ],
      ),
    );
  }
}
