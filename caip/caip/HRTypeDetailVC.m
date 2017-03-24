//
//  HRTypeDetailVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRTypeDetailVC.h"
#import "HRNumberCell.h"
#import "HRNumModel.h"

static NSString *const numCellID = @"numCellID";

@interface HRTypeDetailVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation HRTypeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    NSString *title;
    NSString *type;
    switch (self.index) {
        case 0:
            title = @"排列3";
            type = @"pl3";
            break;
        case 1:
            title = @"排列5";
            type = @"pl5";
            break;
        case 2:
            title = @"七星彩";
            type = @"qxc";
            break;
        case 3:
            title = @"大乐透";
            type = @"dlt";
            break;
        case 4:
            title = @"双色球";
            type = @"ssq";
            break;
        case 5:
            title = @"七乐彩";
            type = @"qlc";
            break;
        default:
            break;
    }
    self.navigationItem.title = title;
    [self getDataWithType:type];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HRNumberCell class]) bundle:nil] forCellReuseIdentifier:numCellID];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 65;
}

- (void)getDataWithType:(NSString *)type {
    UTBlockSelf;
    [SVProgressHUD showWithStatus:@"加载中"];
    [HRRequestManager GET:[NSString stringWithFormat:@"http://f.apiplus.cn/%@-20.json",type] parameters:nil completeHandler:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"加载失败"];
            return;
        }
        [SVProgressHUD dismiss];
        NSArray *data = responseObject[@"data"];
        if (data.count > 0) {
            blockSelf.dataArray = [HRNumModel mj_objectArrayWithKeyValuesArray:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [blockSelf.tableView reloadData];
            });
        }
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HRNumberCell *cell = [tableView dequeueReusableCellWithIdentifier:numCellID];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - property
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
