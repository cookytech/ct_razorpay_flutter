import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ct_razorpay_flutter/ct_razorpay_flutter.dart';

const MERCHANT_KEY = '';
const MERCHANT_NAME = '';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await CtRazorpayFlutter.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              CtRazorpayFlutter.checkout(
                      merchantKey: MERCHANT_KEY,
                      merchantName: MERCHANT_NAME,
                      amountInPaise: '23000')
                  .then(print);
              CtRazorpayFlutter.checkoutWithOrdersAPI(
                      merchantKey: MERCHANT_KEY,
                      merchantName: MERCHANT_NAME,
                      amountInPaise: '23000',
                      orderId: '')
                  .then(print);
              CtRazorpayFlutter.checkoutWithMap({}).then(print);
            },
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(10.0),
              child: Text('Running on: $_platformVersion\n'),
            ),
          ),
        ),
      ),
    );
  }
}
