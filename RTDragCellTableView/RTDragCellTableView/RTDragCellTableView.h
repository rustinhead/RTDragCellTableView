//
//  RTDragCellTableView.h
//
//  Created by Rusted on 16/2/12.
//  Copyright © 2016年 Rusted. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RTDragCellTableView;
@protocol RTDragCellTableViewDataSource <UITableViewDataSource>

@required
/**将外部数据源数组传入，以便在移动cell数据发生改变时进行修改重排*/
- (NSArray *)originalArrayDataForTableView:(RTDragCellTableView *)tableView;

@end

@protocol RTDragCellTableViewDelegate <UITableViewDelegate>

@required
/**将修改重排后的数组传入，以便外部更新数据源*/
- (void)tableView:(RTDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;
@optional
/**选中的cell准备好可以移动的时候*/
- (void)tableView:(RTDragCellTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
/**选中的cell正在移动，变换位置，手势尚未松开*/
- (void)cellIsMovingInTableView:(RTDragCellTableView *)tableView;
/**选中的cell完成移动，手势已松开*/
- (void)cellDidEndMovingInTableView:(RTDragCellTableView *)tableView;

@end

@interface RTDragCellTableView : UITableView

@property (nonatomic, assign) id<RTDragCellTableViewDataSource> dataSource;
@property (nonatomic, assign) id<RTDragCellTableViewDelegate> delegate;

@end
