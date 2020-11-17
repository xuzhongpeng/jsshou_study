#import "PlatformView1.h"
#import "./FlutterActivityIndicator.h"
@implementation PlatformView1
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  PlatformView1* instance = [[PlatformView1 alloc] init];
     NSLog(@"*******************");
    [registrar registerViewFactory:[[FlutterActivityIndicatorFactory alloc] initWithMessenger:registrar.messenger] withId:@"native"];
}
@end
