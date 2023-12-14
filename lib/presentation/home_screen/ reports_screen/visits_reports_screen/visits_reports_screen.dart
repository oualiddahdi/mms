import 'package:flutter/material.dart';

class VisitsReportsScreen extends StatefulWidget {
  const VisitsReportsScreen({super.key});

  @override
  _VisitsReportsScreenState createState() => _VisitsReportsScreenState();
}

class _VisitsReportsScreenState extends State<VisitsReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is the Visits Reports Screen'),
      ),
    );
  }
}
