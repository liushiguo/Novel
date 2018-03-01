//
//  lsg_UrlDefine.h
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#ifndef lsg_UrlDefine_h
#define lsg_UrlDefine_h

#define IP_PORT              @"http://api.youkb.com"//@"http://api.test.youkb.com"//@"http://api.youkb.net"//@"http://192.168.1.134"//

//新的app在访问接口时请求统一添加 这3个参数在header上面
//#define APP_VERSION_HEADER   setValue:@"ios_v1.9.7" forHTTPHeaderField:@"app-ver"//版本号
//#define APP_CHANNEL_HEADER   setValue:@"App Store" forHTTPHeaderField:@"app-channel"//渠道号
//#define APP_DEV_ID_HEADER    setValue:[lsg_HandleUtil getDeviceId] forHTTPHeaderField:@"dev-id"//设备号

#endif /* lsg_UrlDefine_h */
