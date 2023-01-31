import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillsReports extends StatefulWidget {
  const BillsReports({Key? key}) : super(key: key);

  @override
  State<BillsReports> createState() => _BillsReportsState();
}

class _BillsReportsState extends State<BillsReports> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
          "My Bills & Reports",
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
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 20),
            child: Container(
              color: Color(0xffdd5546),
              height: 45,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('S.No',
                      style: GoogleFonts.raleway(
                          color: Color(0xfffff9db),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(
                    width: 60,
                  ),
                  Text('Date',
                      style: GoogleFonts.raleway(
                          color: Color(0xfffff9db),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(
                    width: 70,
                  ),
                  Text('Type',
                      style: GoogleFonts.raleway(
                          color: Color(0xfffff9db),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(
                    width: 60,
                  ),
                  Text('Document',
                      style: GoogleFonts.raleway(
                          color: Color(0xfffff9db),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              ),
            ),
          ),
          Container(
            height: 700,
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                color: Color(0xff0079E3),
                child: Row(
                  children: [
                    SizedBox(
                      width: 47,
                    ),
                    Text('1',
                        style: GoogleFonts.raleway(
                            color: Color(0xfffff9db),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('dd/mm/yyyy',
                        style: GoogleFonts.raleway(
                            color: Color(0xfffff9db),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('Pharmacy',
                        style: GoogleFonts.raleway(
                            color: Color(0xfffff9db),
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    SizedBox(
                      width: 40,
                    ),
                    Text('PDF',
                        style: GoogleFonts.raleway(
                            color: Color(0xfffff9db),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ),
            );
          })),
        ],
      ),
    );
  }
}
