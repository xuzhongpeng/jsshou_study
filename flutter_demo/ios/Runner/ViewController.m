//
//  ViewController.m
//  firstApp
//
//  Created by admin on 2019/10/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>
#import "MyFlutterRouter.h"
#import "AppDelegate.h"

static NSString* const back = @"back";
static NSString* const backGesture = @"backGesture";
static NSString* const getServerAddressDone = @"getServerAddressDone";
static NSString* const updateServerAddress = @"updateServerAddress";
static NSString* const userData = @"userData";
static NSString* const saveImageToGallery = @"saveImageToGallery";
static NSString* const shareData = @"shareData";
static NSString* const invalidToken = @"invalidToken";

static NSString* const channel = @"com.gunma.flutter/system";
@interface ViewController ()
//@property FlutterViewController *nextControler;

@end

@implementation ViewController
UIViewController *rootVC ;
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController=[[UINavigationController alloc]
//                               initWithRootViewController:self];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *text=[[UILabel alloc]initWithFrame:CGRectMake(80, 40, 200, 40)];
    text.text=@"这是Native页面哟";
    [self.view addSubview:text];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(flutterBoostRoute)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"通过Flutter Boost跳转" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 200.0, 40.0);
    [self.view addSubview:button];
    
    UIButton *fbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fbutton addTarget:self
               action:@selector(routerTo)
     forControlEvents:UIControlEventTouchUpInside];
    [fbutton setTitle:@"通过Flutter跳转" forState:UIControlStateNormal];
    [fbutton setBackgroundColor:[UIColor blueColor]];
    fbutton.frame = CGRectMake(80.0, 410.0, 200.0, 40.0);
    [self.view addSubview:fbutton];
}

- (IBAction)userLogin:(id)obj {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Hellworld" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (void)routerTo{
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
//    FLBFlutterViewContainer *flutterViewController = FLBFlutterViewContainer.new;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(handleButtonAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [flutterViewController.view addSubview:button];
    flutterViewController.view.backgroundColor = [UIColor cyanColor];
    [flutterViewController setInitialRoute:@"route1"];
//    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
//    FlutterMethodChannel* methodChannel = [FlutterMethodChannel
//                                           methodChannelWithName:channel
//                                           binaryMessenger:flutterViewController];
//
//    __weak typeof(self) weakSelf = self;
//    [methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
//        if ([saveImageToGallery isEqualToString:call.method]) {
//
//            [self saveImageToGallery:(FlutterStandardTypedData *)call.arguments];
//
//            result(nil);
//
//        }else if ([shareData isEqualToString:call.method]) {
//
//            [self shareData: call.arguments];
//
//            result(nil);
//
//        }else if ([getServerAddressDone isEqualToString:call.method]) {
//
//            result(nil);
//
//        }else if ([updateServerAddress isEqualToString:call.method]) {
//
//            result(nil);
//
//        }  else  if ([back isEqualToString:call.method]) {
//
//            NSLog(@"ios received back signal");
//
//            result(nil);
//
//        } else if ([userData isEqualToString:call.method]) {
//
//            NSDictionary *data = @{@"token":@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjE3ODAsImF1ZCI6InVzZXIiLCJ0Y3QiOjE1Njc3NTc2ODN9.9vw6lZpUsicxxwwNleIM7kooJYn4JSQIFrehJI4HrmI",
//                                   @"userId":@1780,
//                                   @"entranceUser":@1, @"isAdmin":@1, @"projectId": @"301",@"role":@1};
//            result(data);
//
//        } else if ([backGesture isEqualToString:call.method]) {
//
//            NSLog(@"ios  22222 - %@", call.arguments);
//
//            for (NSString *key in call.arguments) {
//                if ([key isEqualToString:@"status"]) {
//                    NSInteger status = [call.arguments[@"status"] integerValue];
//                    status ? NSLog(@"status 1111 %@,", @(status)) : NSLog(@"status 2222 %@,", @(status));
//                }
//            }
//
//            result(nil);
//
//        }else if([invalidToken isEqualToString:call.method]){
//
//        }
//        else {
//            result(FlutterMethodNotImplemented);
//        }
//    }];
//    [self.navigationController pushViewController:flutterViewController animated:YES];
    [self presentViewController:flutterViewController animated:NO completion:nil];
//    [self presentationController:UIVIew2 animated:YES];
}
- (void)handleButtonAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)flutterBoostRoute{
    [FlutterBoostPlugin open:@"second" urlParams:@{kPageCallBackId:@"MycallbackId#1"} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary *result) {
        NSLog(@"call me when page finished, and your result is:%@", result);
    } completion:^(BOOL f) {
        NSLog(@"page is opened");
    }];
}

//
//
//- (void)saveImageToGallery:(FlutterStandardTypedData *)data
//{
//    UIImage *image = [UIImage imageWithData:data.data];
//    if (image) {
//        UIImageWriteToSavedPhotosAlbum(image, self, NULL, NULL);
//    }
//}
//
////分享协议：参数传字典形式支持key:text, image, data形式
//- (void)shareData:(id)data
//{
//    NSDictionary *dicData = (NSDictionary *)data;
//    if (dicData.allValues.count == 0) {
//        return;
//    }
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dicData];
//    if (dic[@"image"]) {
//        UIImage *image = [UIImage imageWithData:[dic[@"image"] data]];
//        dic[@"image"] = image;
//    }
//    UIActivityViewController *share = [[UIActivityViewController alloc]initWithActivityItems:dic.allValues applicationActivities:nil];
//    [self.window.rootViewController presentViewController:share animated:YES completion:nil];
//}

@end
