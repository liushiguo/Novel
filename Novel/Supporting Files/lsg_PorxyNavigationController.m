//
//  lsg_PorxyNavigationController.m
//  YouKB
//
//  Created by YouKB-IOS-1 on 2017/2/21.
//  Copyright © 2017年 YouKB-IOS-1. All rights reserved.
//

#import "lsg_PorxyNavigationController.h"

@interface lsg_PorxyNavigationController ()

@end

@implementation lsg_PorxyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationBarHidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (self.supportPortraitOnly) {
        return UIInterfaceOrientationPortrait == toInterfaceOrientation;
    }else {
        return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.supportPortraitOnly) {
        return UIInterfaceOrientationMaskPortrait;
    }else{
        return [self.topViewController supportedInterfaceOrientations];
    }
}

// New Autorotation support.
- (BOOL)shouldAutorotate {
    if (self.supportPortraitOnly) {
        return NO;
    }else{
        return [self.topViewController shouldAutorotate];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if (![[super topViewController] isKindOfClass:[viewController class]]) {
//        [super pushViewController:viewController animated:animated];
//    }
    
    [super pushViewController:viewController animated:animated];
}

@end
