//
//  lsg_FrameDefine.h
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#ifndef lsg_FrameDefine_h
#define lsg_FrameDefine_h


/*关于frame的全局*/
#define IPHONE_X                  ([[UIScreen mainScreen] currentMode].size.width == 1125 ? 12 : 0)
#define TAB_HEIGHT                ([[UIScreen mainScreen] currentMode].size.width == 1125 ? 60 : 50)
#define NAV_HEIGHT                ([[UIScreen mainScreen] currentMode].size.width == 1125 ? 76 : 64)
#define BANNER_HEIGHT             40

#define DEVICE_WIDTH              ([[UIScreen mainScreen] bounds].size.width > [[UIScreen mainScreen] bounds].size.height ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)//屏幕宽度
#define DEVICE_HEIGHT             ([[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)//屏幕高度

#endif /* lsg_FrameDefine_h */
