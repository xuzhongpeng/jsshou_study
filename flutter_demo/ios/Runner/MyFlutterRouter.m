//
//  DemoRouter.m
//  Runner
//
//  Created by Jidong Chen on 2018/10/22.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import "MyFlutterRouter.h"
#import <flutter_boost/FlutterBoost.h>

@interface MyFlutterRouter() 
@end

@implementation MyFlutterRouter

#pragma mark - Boost 1.5
- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
//    self.navigationController=[[UINavigationController alloc]initWithRootViewController:vc];
    [vc setName:name params:params];
    [self.navigationController pushViewController:vc animated:animated];
    if(completion) completion(YES);
}

- (void)present:(NSString *)name
      urlParams:(NSDictionary *)params
           exts:(NSDictionary *)exts
     completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
//- (UINavigationController *)navigationController
//{
//    UITabBarController *tabVC = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//    if([tabVC isKindOfClass:[UITabBarController class]]){
//        UINavigationController *nav = (UINavigationController *)tabVC.selectedViewController;
//        if([nav isKindOfClass:[UINavigationController class]]){
//            return nav;
//        }else{
//            return [[UINavigationController alloc] init];
//        }
//    }
//    return [[UINavigationController alloc] init];
//}
@end
