import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentHistory extends StatefulWidget {
  const AppointmentHistory({Key? key}) : super(key: key);

  @override
  State<AppointmentHistory> createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        // Size size = MediaQuery.of(context).size;
        child: Scaffold(
          backgroundColor: Color(0xfffff9db),
          appBar: AppBar(
            toolbarHeight: 60,
            elevation: 0,
            backgroundColor: Color(0xfffff9db),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Color(0xffdd5546),
              ),
            ),
            title: Text(
              "My Appointments",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xffdd5546),
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(left: 63, right: 63,),
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: Color(0xffFA8072).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        indicatorColor: Colors.black,
                        labelColor: Color(0xffdd5546),
                        labelStyle: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        tabs: const [
                          Tab(text: 'Upcoming'),
                          Tab(text: 'Completed'),
                        ],
                      ),
                    ),
                  ),
              SizedBox(height: 20),
              Container(
                height: 550,
                width: 350,
                child: TabBarView(
                  children: [
                    _page(Colors.green),
                    _page(Color(0xffdd5546)),
                  ],
                ),
              ),
                ],
              ),
          ),
        );

  Widget _page(Color c) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: c,
                ),
                height: 130,
              ),
            );
          }),
    );
  }
}
