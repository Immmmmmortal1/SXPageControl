//
//  SXPageControlBaseView.h
//  SXPageControl
//
//  Created by 树下 on 2020/12/22.
//
/**
 baseview  主要处理 基础视图的搭建 大小  位置的计算 以及 外部属性建立
  动画样式的处理有子类来完成
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SXPageControlBaseView : UIView
/**
 * 页码总数
 */
@property (nonatomic, assign) NSInteger numberOfpage;
/**
 * 当前页码
 */
@property (nonatomic, assign) NSInteger currentPage;
/**
 * 是否单页隐藏
 */
@property (nonatomic, assign) BOOL hidesForSinglePage;
/**
 * 未选中颜色
 */
@property (nonatomic, strong) UIColor *inactiveColor;
/**
 * 选中颜色
 */
@property (nonatomic, strong) UIColor *activeColor;
/**
 *未选中大小
 */
@property (nonatomic, assign) CGSize inactiveSize;
/**
 *选中大小
 */
@property (nonatomic, assign) CGSize activeSize;
/**
 *指示器的大小
 */
@property (nonatomic, assign) CGSize indicatorSize;
/**
 *item 间隔
 */
@property (nonatomic, assign) CGFloat columnSpacing;

/**
 * 未选中的是否空心
 */
@property (nonatomic, assign) BOOL isInactiveHollow;
/**
 *选中空心
 */
@property (nonatomic, assign) BOOL isActiveHollow;
/**
 容器背景颜色
 */
@property (nonatomic, strong) UIColor *contentViewBGColor;


/**
 * 指示器最大的size
 */
@property (nonatomic, assign,readonly) CGSize maxIndicatorSize;
/**
 * 指示器最小的size
 */
@property (nonatomic, assign,readonly) CGSize minIndicatorSize;
/**
 * 未选中的dot 的layer
 */
@property (nonatomic, strong,readonly) NSMutableArray *inactiveLayers;
/**
 *选中的dot 的layer
 */
@property (nonatomic, strong,readonly) CALayer *activeLayer;
/**
 * view
 */
@property (nonatomic, strong,readonly) UIView *contentView;
/**
 重新加载
 */
- (void)reload;
- (void)layoutInactiveLayer;
- (void)layoutActiveLayer;
- (void)updateCurrentPage:(NSInteger)currentIndex;
@end

NS_ASSUME_NONNULL_END
