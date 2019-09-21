#include "AppDelegate.h"
#import "./GeneratedPluginRegistrant.h"

static NSString* const back = @"back";
static NSString* const backGesture = @"backGesture";
static NSString* const getServerAddressDone = @"getServerAddressDone";
static NSString* const updateServerAddress = @"updateServerAddress";
static NSString* const userData = @"userData";
static NSString* const saveImageToGallery = @"saveImageToGallery";
static NSString* const shareData = @"shareData";
static NSString* const invalidToken = @"invalidToken";

static NSString* const channel = @"com.gunma.flutter/system";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel* methodChannel = [FlutterMethodChannel
                                           methodChannelWithName:channel
                                           binaryMessenger:controller];

    __weak typeof(self) weakSelf = self;
    [methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([saveImageToGallery isEqualToString:call.method]) {

            [self saveImageToGallery:(FlutterStandardTypedData *)call.arguments];

            result(nil);

        }else if ([shareData isEqualToString:call.method]) {

            [self shareData: call.arguments];

            result(nil);

        }else if ([getServerAddressDone isEqualToString:call.method]) {

            result(nil);

        }else if ([updateServerAddress isEqualToString:call.method]) {

            result(nil);

        }  else  if ([back isEqualToString:call.method]) {

            NSLog(@"ios received back signal");

            result(nil);

        } else if ([userData isEqualToString:call.method]) {

            NSDictionary *data = @{@"token":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjE3ODAsImF1ZCI6InVzZXIiLCJ0Y3QiOjE1Njc3NTc2ODN9.9vw6lZpUsicxxwwNleIM7kooJYn4JSQIFrehJI4HrmI",
                                   @"userId":@1780,
                                   @"entranceUser":@1, @"isAdmin":@1, @"projectId": @"301",@"role":@1};
            result(data);

        } else if ([backGesture isEqualToString:call.method]) {

            NSLog(@"ios  22222 - %@", call.arguments);

            for (NSString *key in call.arguments) {
                if ([key isEqualToString:@"status"]) {
                    NSInteger status = [call.arguments[@"status"] integerValue];
                    status ? NSLog(@"status 1111 %@,", @(status)) : NSLog(@"status 2222 %@,", @(status));
                }
            }

            result(nil);

        }else if([invalidToken isEqualToString:call.method]){

        } 
        else {
            result(FlutterMethodNotImplemented);
        }
    }];



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
