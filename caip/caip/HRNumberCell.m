//
//  HRNumberCell.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRNumberCell.h"
#import "HRNumModel.h"

@interface HRNumberCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;

@end

@implementation HRNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(HRNumModel *)model {
    _model = model;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:model.opentime];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.timeLabel.text = [formatter stringFromDate:date];
    self.numLabel.text = [NSString stringWithFormat:@"第%@期",model.expect];
    self.label4.hidden = NO;
    self.label5.hidden = NO;
    self.label6.hidden = NO;
    self.label7.hidden = NO;
    self.label8.hidden = NO;
    NSArray *array = [model.opencode componentsSeparatedByString:@"+"];//+后面为蓝色球
    if (array.count > 1) {
        NSString *red = [array firstObject];
        NSArray *redArr = [red componentsSeparatedByString:@","];
        NSInteger redCount = redArr.count;
        for (int i = 0; i < redCount; i++) {
            NSString *num = redArr[i];
            if (i == 0) {
                self.label1.text = num;
                self.label1.backgroundColor = [UIColor redColor];
            } else if (i == 1) {
                self.label2.text = num;
                self.label2.backgroundColor = [UIColor redColor];
            } else if (i == 2) {
                self.label3.text = num;
                self.label3.backgroundColor = [UIColor redColor];
            } else if (i == 3) {
                self.label4.text = num;
                self.label4.backgroundColor = [UIColor redColor];
            } else if (i == 4) {
                self.label5.text = num;
                self.label5.backgroundColor = [UIColor redColor];
            } else if (i == 5) {
                self.label6.text = num;
                self.label6.backgroundColor = [UIColor redColor];
            } else if (i == 6) {
                self.label7.text = num;
                self.label7.backgroundColor = [UIColor redColor];
            } else if (i == 7) {
                self.label8.text = num;
                self.label8.backgroundColor = [UIColor redColor];
            }
        }
        NSString *blue = [array lastObject];
        NSArray *blueArray = [blue componentsSeparatedByString:@","];
        NSInteger blueCount = blueArray.count;
        for (int i = 0; i < blueCount; i++) {
            NSString *num = blueArray[i];
            if ((i + redCount) == 4) {
                self.label5.text = num;
                self.label5.backgroundColor = [UIColor blueColor];
            } else if ((i + redCount) == 5) {
                self.label6.text = num;
                self.label6.backgroundColor = [UIColor blueColor];
            } else if ((i + redCount) == 6) {
                self.label7.text = num;
                self.label7.backgroundColor = [UIColor blueColor];
            } else if ((i + redCount) == 7) {
                self.label8.text = num;
                self.label8.backgroundColor = [UIColor blueColor];
            }
        }
        if ((redCount + blueCount) == 3) {
            self.label4.hidden = YES;
            self.label5.hidden = YES;
            self.label6.hidden = YES;
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount + blueCount) == 4) {
            self.label5.hidden = YES;
            self.label6.hidden = YES;
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount + blueCount) == 5) {
            self.label6.hidden = YES;
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount + blueCount) == 6) {
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount + blueCount) == 7) {
            self.label8.hidden = YES;
        }
    } else {
        NSString *red = [array firstObject];
        NSArray *redArr = [red componentsSeparatedByString:@","];
        NSInteger redCount = redArr.count;
        for (int i = 0; i < redCount; i++) {
            NSString *num = redArr[i];
            if (i == 0) {
                self.label1.text = num;
                self.label1.backgroundColor = [UIColor redColor];
            } else if (i == 1) {
                self.label2.text = num;
                self.label2.backgroundColor = [UIColor redColor];
            } else if (i == 2) {
                self.label3.text = num;
                self.label3.backgroundColor = [UIColor redColor];
            } else if (i == 3) {
                self.label4.text = num;
                self.label4.backgroundColor = [UIColor redColor];
            } else if (i == 4) {
                self.label5.text = num;
                self.label5.backgroundColor = [UIColor redColor];
            } else if (i == 5) {
                self.label6.text = num;
                self.label6.backgroundColor = [UIColor redColor];
            } else if (i == 6) {
                self.label7.text = num;
                self.label7.backgroundColor = [UIColor redColor];
            } else if (i == 7) {
                self.label8.text = num;
                self.label8.backgroundColor = [UIColor redColor];
            }
        }
        if ((redCount) == 3) {
            self.label4.hidden = YES;
            self.label5.hidden = YES;
            self.label6.hidden = YES;
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount) == 4) {
            self.label5.hidden = YES;
            self.label6.hidden = YES;
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount) == 5) {
            self.label6.hidden = YES;
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount) == 6) {
            self.label7.hidden = YES;
            self.label8.hidden = YES;
        } else if ((redCount) == 7) {
            self.label8.hidden = YES;
        }
    }
}

@end
