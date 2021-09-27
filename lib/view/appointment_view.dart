import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatefulWidget {
  @override
  _AppointmentViewState createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('appointment')),
    );
  }
}
