//
//  DemoRouter.h
//  Runner
//
//  Created by Jidong Chen on 2018/10/22.
//  Copyright © 2018年 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <flutter_boost/FlutterBoost.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FLBPlatform;
@interface MyFlutterRouter : NSObject<FLBPlatform>
@property (nonatomic,strong) UINavigationController *navigationController;
@end

NS_ASSUME_NONNULL_END
