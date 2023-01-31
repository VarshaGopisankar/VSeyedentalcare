import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'appointment_history.dart';
import 'bills_reports.dart';
import 'profile.dart';
import 'anime.dart';

List<Map> drawerOptions=[
  {
    'icon': Icons.home,
    'title' : 'Home',
    'nav': Anime()
  },
  {
    'icon': Icons.history,
    'title' : 'Appointment History',
    'nav': AppointmentHistory()
  },
  {
    'icon': Icons.medication,
    'title' : 'Bills & Reports',
    'nav': BillsReports()
  },
  {
    'icon': FontAwesomeIcons.person,
    'title' : 'Profile',
    'nav': Profile()
  },
];
