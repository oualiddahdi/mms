import 'package:flutter/material.dart';

class IRRequestsReportsScreen extends StatefulWidget {
  const IRRequestsReportsScreen({super.key});

  @override
  _IRRequestsReportsScreenState createState() => _IRRequestsReportsScreenState();
}

class _IRRequestsReportsScreenState extends State<IRRequestsReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: Center(
        child: Text('This is the IR Requests Reports Screen'),
      ),
    );
  }
}
