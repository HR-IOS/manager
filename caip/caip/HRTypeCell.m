//
//  HRTypeCell.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRTypeCell.h"

@interface HRTypeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation HRTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIcon:(NSString *)icon {
    _icon = icon;
    self.iconImageView.image = [UIImage imageNamed:icon];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}

@end
