//
//  ToolUtil.m
//  LoveReading
//
//  Created by BJ13041603-002 on 16/6/7.
//  Copyright © 2016年 刘建立. All rights reserved.
//

#import "ToolUtil.h"

@implementation ToolUtil

+ (UIViewController *)loadViewControllerWithStoryboardId:(NSString *)identifier {
    NSArray *info = [identifier componentsSeparatedByString:@"/"];
    NSString *storyboard_name = info[0];
    NSString *scene_name = @"";
    if(info.count > 1)
        scene_name = info[1];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboard_name
                                                         bundle:nil];
    UIViewController *scene = nil;
    if (scene_name.length == 0) {
        scene = [storyboard instantiateInitialViewController];
    }
    else {
        scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
    }
    return scene;
}

@end
