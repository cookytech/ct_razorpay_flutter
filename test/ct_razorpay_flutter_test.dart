import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ct_razorpay_flutter/ct_razorpay_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('ct_razorpay_flutter');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CtRazorpayFlutter.platformVersion, '42');
  });
}
