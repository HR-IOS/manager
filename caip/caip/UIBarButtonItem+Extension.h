//
//  UIBarButtonItem+Extension.h
//  VRAutoCyclingController
//
//  Created by 上海攸途科技智能有限公司 on 16/5/24.
//  Copyright © 2016年 UT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTargat:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
