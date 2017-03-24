//
//  UIView+Extension.h
//  VRAutoCyclingController
//
//  Created by 上海攸途科技智能有限公司 on 16/5/24.
//  Copyright © 2016年 UT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

- (BOOL)intersectsWithAnotherView:(UIView *)anotherView;
@end
