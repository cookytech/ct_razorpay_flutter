import 'dart:async';

import 'package:flutter/services.dart';

class CtRazorpayFlutter {
  static const MethodChannel _channel =
      const MethodChannel('ct_razorpay_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
