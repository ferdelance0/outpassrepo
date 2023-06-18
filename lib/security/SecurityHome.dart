import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mini/security/SecurityCheck.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRCodeScannerPage extends StatefulWidget {
  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}
class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  @override
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedText = '';

var admnno = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xffADE8F4),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
                height: 60,
                elevation: 0,
                color: Colors.indigo,
                shape: CircleBorder(),
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                child: FutureBuilder(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if(snapshot.data==true)
                      return Icon(Ionicons.flash,color: Colors.white,size: 30,);
                    else
                      return Icon(Ionicons.flash_outline,color: Colors.white,size: 30,);
                  },
                )
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                controller?.resumeCamera();
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                height: 300,
                width: 300,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.indigo,
                    borderRadius: 3,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: admnno,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffB4E3EC),
                    prefixIconColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17))
                    ),
                    hintText: 'Username',prefixIcon: Icon(Icons.person_2_rounded)

                ),
              ),
            ),
            MaterialButton(
              height: 43.12 ,
              minWidth: 133.62,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29.0),
              ),
              elevation: 0,
              color: Color(0xff03045E),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecurityCheck(scannedText: admnno.text!)),
              );},
              child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18.58,fontWeight: FontWeight.w100),),
            ),

          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData.code!.isNotEmpty){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecurityCheck(scannedText: scanData.code!)),
        );
        controller?.pauseCamera();
      }
      setState(() {
        scannedText = scanData.code!;
        admnno.text=scannedText;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
