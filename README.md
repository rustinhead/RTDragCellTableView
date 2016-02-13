# 可拖动cell重新排序的TableView
仿iPhone自带天气应用，可对tableView中的cell拖动排序，可跨section拖动排序，拖动同时更新外部数据源，拖动至边缘tableView可自动向上或向下滚动（如果可以滚动的话）

直接将RTDragCellTableView.h和RTDragCellTableView.m拖进你的项目即可使用

该控件扩充了原UITableView的数据源协议和代理协议中的方法，其中两个方法必须实现：

-- DataSource --
1、/**将外部数据源数组传入，以便在移动cell数据发生改变时进行修改重排*/
- (NSArray *)originalArrayDataForTableView:(RTDragCellTableView *)tableView;

-- Delegate --
2、/**将修改重排后的数组传入，以便外部更新数据源*/
 - (void)tableView:(RTDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;

同时还扩充了三个代理方法，如下
/**选中的cell准备好可以移动的时候*/
 - (void)tableView:(RTDragCellTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;

 /**选中的cell正在移动，变换位置，手势尚未松开*/
 - (void)cellIsMovingInTableView:(RTDragCellTableView *)tableView;

 /**选中的cell完成移动，手势已松开*/
 - (void)cellDidEndMovingInTableView:(RTDragCellTableView *)tableView;
