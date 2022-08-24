import 'package:flutter/material.dart';
import 'package:vs1/doctor_detail_page1.dart';
import 'doctor_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Color(0xfffff9db),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffdd5546),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                          color: Colors.white,),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.notifications_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 28, left: 28),
            child: Text(
              "Hi Varsha",
              style: TextStyle(
                color: Color(0xffdd5546),
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 28),
            child: Text(
              "Welcome back!",
              style: TextStyle(
                color: Color(0xffdd5546),
                fontSize: 38,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 25, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x14000000),
                        offset: Offset(0, 10),
                        blurRadius: 15,
                        spreadRadius: 0)
                  ]),
              height: 40,
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 18),
                      child: TextField(
                        maxLines: 1,
                        autofocus: false,
                        style: TextStyle(
                          color: Color(0xffdd5546),
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffdd5546),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ))
                ],
              )),
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: 25, left: 25),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  child: Text("Book an Appointment",
                      style: TextStyle(
                          color: Color(0xffdd5546),
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
          Container(
            height: 180,
            margin: EdgeInsets.only(top: 18, left: 28),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                demoCategories1("images/eye-2.png", "Dr.N.Gopisankar",
                    "Ophthalmologist"),
                demoCategories2("images/tooth.png", "Dr.T.Umamageswari",
                    "Prosthodontist"),
                demoCategories1(
                    "images/sunglasses.png", "Opticals", "Consultation"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget demoCategories2(String image, String name, String drName) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DoctorDetailsPage1()));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 170,
          decoration: BoxDecoration(
            color: Color(0xffdd5546),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 32),
                height: 110,
                width: 100,
                child: Image.asset(image),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  )),
              Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.center,
                  child: Text(
                    drName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget demoCategories1(String image, String name, String drName) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DoctorDetailsPage()));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 170,
          decoration: BoxDecoration(
            color: Color(0xffdd5546),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 32),
                height: 110,
                width: 100,
                child: Image.asset(image),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  )),
              Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.center,
                  child: Text(
                    drName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    ),
                  ))
            ],
          ),
        ));
  }
}
