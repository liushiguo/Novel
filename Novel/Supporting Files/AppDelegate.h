//
//  AppDelegate.h
//  Novel
//
//  Created by user on 2018/2/23.
//  Copyright © 2018年 LSG. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "lsg_PorxyNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) lsg_PorxyNavigationController *navViewController;

@end

