#import "CtRazorpayFlutterPlugin.h"
#import <ct_razorpay_flutter/ct_razorpay_flutter-Swift.h>

@implementation CtRazorpayFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCtRazorpayFlutterPlugin registerWithRegistrar:registrar];
}
@end
