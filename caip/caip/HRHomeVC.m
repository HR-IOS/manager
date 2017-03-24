//
//  HRHomeVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/23.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRHomeVC.h"
#import "HRTypeCell.h"
#import "HRTypeDetailVC.h"

static NSString *const typeCellId = @"typeCellId";

@interface HRHomeVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HRHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.navigationItem.leftBarButtonItems = nil;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 60;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HRTypeCell class]) bundle:nil] forCellReuseIdentifier:typeCellId];
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HRTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:typeCellId];
    NSString *icon;
    NSString *title;
    switch (indexPath.row) {
        case 0:
            icon = @"pl3";
            title = @"排列3";
            break;
        case 1:
            icon = @"pl5";
            title = @"排列5";
            break;
        case 2:
            icon = @"qxc";
            title = @"七星彩";
            break;
        case 3:
            icon = @"dlt";
            title = @"大乐透";
            break;
        case 4:
            icon = @"ssq";
            title = @"双色球";
            break;
        case 5:
            icon = @"qlc";
            title = @"七乐彩";
            break;
        default:
            break;
    }
    cell.icon = icon;
    cell.title = title;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    HRTypeDetailVC *detailVC = [[HRTypeDetailVC alloc] init];
    detailVC.index = indexPath.row;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
