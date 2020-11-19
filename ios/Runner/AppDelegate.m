#include "AppDelegate.h"
#import "./GeneratedPluginRegistrant.h"
#import "./PlatformView1.h"
#import <package_info/PackageInfoPlugin.h>
// #import "MyFlutterRouter.h"
// #import "ViewController.h"
// #import <flutter_boost/FlutterBoost.h>
static NSString* const channel = @"com.gunma.flutter/system";
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* methodChannel = [FlutterMethodChannel
                                           methodChannelWithName:channel
                                           binaryMessenger:controller];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
    }];
    
    [PlatformView1 registerWithRegistrar:[self registrarForPlugin:@"PlatformView1"]];
    // UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // self.window = window;
    
    // __weak typeof(self) weakSelf = self;
    
    // ViewController *vc = [ViewController new];
    // UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vc];
    // [nav setNavigationBarHidden:(YES) animated:(NO)];
    // self.window.rootViewController =nav;
    // [self.window makeKeyAndVisible];
    
    // MyFlutterRouter *router = [MyFlutterRouter new];
    // router.navigationController=nav;
    // [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:router
    //                                                     onStart:^(FlutterEngine *fvc){
    //                                                     }];

    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


- (void)saveImageToGallery:(FlutterStandardTypedData *)data
{
    UIImage *image = [UIImage imageWithData:data.data];
    if (image) {
        UIImageWriteToSavedPhotosAlbum(image, self, NULL, NULL);
    }
}

//分享协议：参数传字典形式支持key:text, image, data形式
- (void)shareData:(id)data
{
    NSDictionary *dicData = (NSDictionary *)data;
    if (dicData.allValues.count == 0) {
        return;
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dicData];
    if (dic[@"image"]) {
        UIImage *image = [UIImage imageWithData:[dic[@"image"] data]];
        dic[@"image"] = image;
    }
    UIActivityViewController *share = [[UIActivityViewController alloc]initWithActivityItems:dic.allValues applicationActivities:nil];
    [self.window.rootViewController presentViewController:share animated:YES completion:nil];
}

@end
