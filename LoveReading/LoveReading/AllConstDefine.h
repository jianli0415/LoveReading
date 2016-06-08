//
//  AllConstDefine.h
//  LoveReading
//
//  Created by BJ13041603-002 on 16/6/7.
//  Copyright © 2016年 刘建立. All rights reserved.
//

#ifndef AllConstDefine_h
#define AllConstDefine_h

#define LRWindowFrame           [[UIScreen mainScreen] bounds]
#define LRWindowWidth           [[UIScreen mainScreen] bounds].size.width
#define LRWindowHeight          [[UIScreen mainScreen] bounds].size.height

//定义如果为NULL转换成“”
#define NULL_TO_NIL(object) ((!object)?(@""):[object isKindOfClass:[NSNull class]] ? (@"") : (object))

//debug日志打印
#ifdef DEBUG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif

//自动计算行高
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define MB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

#define MAXFLOAT    0x1.fffffep+127f


//userdefaults UDKEY_ naming
#define defaults    [NSUserDefaults standardUserDefaults]
#define UDKEY_USER_ID             @"UDKEY_USER_ID"
#define UDKEY_TOKEN               @"UDKEY_TOKEN"
#define UDKEY_USER_NAME           @"UDKEY_USER_NAME"

// app delegate ref
#define AppDelegate_Ref ((HuivoSwiftBDToolsAppDelegate *)[[UIApplication sharedApplication] delegate])

#endif /* AllConstDefine_h */
