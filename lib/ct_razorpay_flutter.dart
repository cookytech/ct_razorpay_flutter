import 'package:meta/meta.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class RazorpayOrderPaymentFulfilment {
  String razorpayOrderId;
  String razorpayPaymentId;
  String razorpaySignature;

  RazorpayOrderPaymentFulfilment.fromMap(Map<String, dynamic> fulfillmentMap) {
    razorpayOrderId = fulfillmentMap['razorpay_order_id'];
    razorpayPaymentId = fulfillmentMap['razorpay_payment_id'];
    razorpaySignature = fulfillmentMap['razorpay_signature'];
  }
}

class CtRazorpayFlutter {
  static const MethodChannel _channel =
      const MethodChannel('ct_razorpay_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  // A different function for firing checkout with orders API
  static Future<RazorpayOrderPaymentFulfilment> checkoutWithOrdersAPI({
    // merchant key ID
    @required String merchantKey,
    // company/merchant name showed in the checkout form
    @required String merchantName,
    // payment amount to be accepted in paise
    @required String amountInPaise,
    // order-id
    @required String orderId,
    // currency
    String currency = 'INR',
    // description of the item being purchased
    String itemDescription,
    // Either url to image or a base64string for the image
    String image,
    // Prefill objects,
    String prefillName,
    String prefillEmail,
    String prefillContact,
    String prefillMethod,
    // Theme
    String themeColor,
    bool themeImagePadding = true, //whether to show image with a white border
    // skipped modal and notes for this.
  }) async {
    final Map<String, Object> fulfillmentMap =
        await _channel.invokeMapMethod('razorpayCheckout', [
      {
        'key': merchantKey,
        'order_id': orderId,
        'amount': amountInPaise,
        'currency': currency,
        'name': merchantName,
        'description': itemDescription,
        'image': image,
        'prefill': {
          'name': prefillName,
          'email': prefillEmail,
          'contact': prefillContact,
          'method': prefillMethod,
        },
        'notes': {'plugin': 'ct-rzp-flutter'},
        'theme': {
          'color': themeColor,
          'image_padding': themeImagePadding,
        }
      },
    ]);
    return new RazorpayOrderPaymentFulfilment.fromMap(fulfillmentMap);
  }

  static Future<Map<String, Object>> checkout({
    // merchant key ID
    @required String merchantKey,
    // company/merchant name showed in the checkout form
    @required String merchantName,
    // payment amount to be accepted in paise
    @required String amountInPaise,
    // order-id
    String orderId,
    // currency
    String currency = 'INR',
    // description of the item being purchased
    String itemDescription,
    // Either url to image or a base64string for the image
    String image,
    // Prefill objects,
    String prefillName,
    String prefillEmail,
    String prefillContact,
    String prefillMethod,
    // Theme
    String themeColor,
    bool themeImagePadding = true, //whether to show image with a white border
    // skipped modal and notes for this.
  }) async {
    return {'message': 'any api called'};
  }

  static Future<Map<String, Object>> checkoutWithMap(
      Map<String, Object> map) async {
    return {'message': 'map directly passed'};
  }
}
