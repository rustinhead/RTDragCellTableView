//
//  ViewController.m
//
//  Created by Rusted on 16/2/12.
//  Copyright © 2016年 Rusted. All rights reserved.
//

#import "ViewController.h"
#import "RTDragCellTableView.h"
#import "RTModel.h"
#define RTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RTRandomColor RTColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()<RTDragCellTableViewDataSource,RTDragCellTableViewDelegate>
@property (nonatomic, strong) NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    RTDragCellTableView *tableView = [[RTDragCellTableView alloc]init];
    tableView.allowsSelection = YES;
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (NSArray *)data{
    if (!_data) {
        NSMutableArray *arr = [NSMutableArray array];
        int numberOfScections = 4;
        for (int i = 0; i < numberOfScections; i ++) {
            NSMutableArray *arr2 = [NSMutableArray array];
            UIColor *color = RTRandomColor;
            for (int j = 0; j < 4 ; j ++) {
                RTModel *model = [[RTModel alloc]init];
                model.title = [NSString stringWithFormat:@"%d - %d",i,j];
                model.backgroundColor = color;
                [arr2 addObject:model];
            }
            [arr addObject:arr2];
        }
        _data = arr;
    }
    return _data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sec = _data[section];
    return sec.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    RTModel *model = _data[indexPath.section][indexPath.item];
    cell.backgroundColor = model.backgroundColor;
    cell.textLabel.text = model.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSArray *)originalArrayDataForTableView:(RTDragCellTableView *)tableView{
    return _data;
}

- (void)tableView:(RTDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray{
    _data = newArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RTModel *model = _data[indexPath.section][indexPath.row];
    NSLog(@"%@",model.title);
}


@end
