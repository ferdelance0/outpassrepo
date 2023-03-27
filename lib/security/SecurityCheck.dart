import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityCheck extends StatefulWidget {

  final String scannedText;
  const SecurityCheck({Key? key,required this.scannedText}) : super(key: key);@override
  State<SecurityCheck> createState() => _SecurityCheckState();
}

class _SecurityCheckState extends State<SecurityCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.scannedText),
    );
  }
}
