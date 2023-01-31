import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DoctorDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetailsPage> {

  @override
  void initState() {
    super.initState();
  }

  List months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  String h = '';

  checkdate(String x) {
    var now = DateTime.now();
      h = DateTime(now.year, now.month, now.day + int.parse(x)).toString().split(
          ' ')[0].split('-')[2];
      return h;
  }
  getDate(String x){
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day + int.parse(x));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdd5546),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.notifications_rounded,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xfffff9db),

        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffdd5546),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(38),
                      bottomRight: Radius.circular(38),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 30, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Image.asset("images/profile.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 20),
                                child: Text(
                                  "Dr. N. Gopisankar",
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4, left: 5),
                                child: Text(
                                  "Ophthalmologist",
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    '${months[int.parse(DateTime.now().toString().substring(5,7))-1]} ${DateTime.now().toString().substring(0,4)}',
                    style: GoogleFonts.raleway(
                      color: Color(0xffdd5546),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  height: 88,
                  child: ListView.builder(
                      itemCount: 12,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          width: 70,
                          margin: EdgeInsets.only(top: 10,left: 12),
                          decoration: BoxDecoration(
                            color: Color(0xffdd5546),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 13),
                                child: Text(
                                  DateFormat('EEEE').format(getDate(index.toString())).toString().substring(0,3),
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  checkdate(index.toString()),
                                  style: GoogleFonts.raleway(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    // children: [
                    //   demoDates("Fri", checkdate('0'), app[0]),
                    //   demoDates("Sat", checkdate('1'), app[1]),
                    //   demoDates("Sun", checkdate('2'), app[2]),
                    //   demoDates("Mon", checkdate('3'), app[3]),
                    //   demoDates("Tue", checkdate('4'), app[4]),
                    //   demoDates("Wed", checkdate('5'), app[5]),
                    //   demoDates("Thu", checkdate('6'), app[6]),
                    //   demoDates("Fri", checkdate('7'), app[7]),
                    //   demoDates("Sat", checkdate('8'), app[8]),
                    //   demoDates("Sun", checkdate('9'), app[9]),
                    //   demoDates("Mon", checkdate('10'), app[10]),
                    //   demoDates("Tue", checkdate('11'), app[11]),
                    // ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "Morning",
                    style: GoogleFonts.raleway(
                      color: Color(0xffdd5546),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.7,
                    children: [
                      doctorTimings("10:30 AM", true),
                      doctorTimings("11:00 AM", false),
                      doctorTimings("11:30 AM", false),
                      doctorTimings("12:00 PM", false),
                      doctorTimings("12:30 PM", false),
                      doctorTimings("01:00 PM", false),
                      doctorTimings("01:30 PM", false),
                      doctorTimings("02:00 PM", false),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Evening",
                    style: GoogleFonts.raleway(
                      color: Color(0xffdd5546),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.7,
                    children: [
                      doctorTimings("06:00 PM", true),
                      doctorTimings("06:30 PM", false),
                      doctorTimings("07:00 PM", false),
                      doctorTimings("07:30 PM", false),
                      doctorTimings("08:00 PM", false),
                      doctorTimings("08:30 PM", false),
                      doctorTimings("09:00 PM", false),
                      doctorTimings("09:30 PM", false),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "Your medical issue",
                    style: GoogleFonts.raleway(
                      color: Color(0xffdd5546),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    "Optional*",
                    style: GoogleFonts.raleway(
                      color: Color(0xffdd5546),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  width: 380,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    border: Border.all(width: 3, color: Color(0xffdd5546)),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Upload clear images of your concern',
                        style: GoogleFonts.raleway(fontSize: 15),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.camera_alt, size: 30,)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                          },
                          child:
                          Text('Select Image', style: GoogleFonts.raleway(fontSize: 10))),
                    ),
                  ],
                )
              ]),
          ),
        );
  }

  doctorTimings(String time, bool isSelected) {
    return isSelected ?
    Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(
        color: Color(0xffdd5546),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Colors.white,
              size: 16,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Text(
              time,
              style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ):Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(
              Icons.access_time,
              color: Colors.black,
              size: 16,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Text(
              time,
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  demoDates(String day, String date, bool isSelected) {
    return isSelected ? Container(
      width: 70,
      margin: EdgeInsets.only(top: 10,left: 12),
      decoration: BoxDecoration(
        color: Color(0xffdd5546),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 13),
            child: Text(
              day,
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    ) : Container(
      width: 70,
      margin: EdgeInsets.only(top: 10, left: 12),
      decoration: BoxDecoration(
        color: Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 13),
            child: Text(
              day,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(7),
            child: Text(
              date,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}