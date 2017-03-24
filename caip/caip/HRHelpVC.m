//
//  HRHelpVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRHelpVC.h"
#import "HRTypeCell.h"
#import "HRHelpDetailVC.h"

static NSString *const helpCellId = @"helpCellId";

@interface HRHelpVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation HRHelpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.navigationItem.leftBarButtonItems = nil;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 60;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HRTypeCell class]) bundle:nil] forCellReuseIdentifier:helpCellId];
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HRTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:helpCellId];
    NSString *icon;
    NSString *title;
    switch (indexPath.row) {
        case 0:
            icon = @"ssq";
            title = @"如何投注双色球";
            break;
        case 1:
            icon = @"dlt";
            title = @"如何投注大乐透";
            break;
        case 2:
            icon = @"qxc";
            title = @"如何投注七星彩";
            break;
        case 3:
            icon = @"qlc";
            title = @"如何投注七乐彩";
            break;
        case 4:
            icon = @"pl5";
            title = @"如何投注排列5";
            break;
        case 5:
            icon = @"pl3";
            title = @"如何投注排列3";
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
    NSString *title;
    switch (indexPath.row) {
        case 0:
            title = @"如何投注双色球";
            break;
        case 1:
            title = @"如何投注大乐透";
            break;
        case 2:
            title = @"如何投注七星彩";
            break;
        case 3:
            title = @"如何投注七乐彩";
            break;
        case 4:
            title = @"如何投注排列5";
            break;
        case 5:
            title = @"如何投注排列3";
            break;
        default:
            break;
    }
    HRHelpDetailVC *detailVC = [[HRHelpDetailVC alloc] init];
    detailVC.navTitle = title;
    detailVC.html = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"ssq_howto.html",@"dlt_howto.html",@"qxc_howto.html",@"qlc_howto.html",@"pl5_howto.html",@"pl3_howto.html"];
    }
    return _dataArray;
}

@end
