//
//  lsg_OtherDefine.h
//  Novel
//
//  Created by user on 2018/2/24.
//  Copyright © 2018年 LSG. All rights reserved.
//

#ifndef lsg_OtherDefine_h
#define lsg_OtherDefine_h

#define TIMEOUTINTERVAL   10.0//保持请求时长

/*------------ 提示语句 ------------*/
#define COMMENT_HINT      @"优质评论将会被优先显示"

#ifdef  DEBUG

#define DLog(fmt,...)     NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d]\n" fmt),__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__);

#else

#define DLog(...);

#endif
#endif /* lsg_OtherDefine_h */
