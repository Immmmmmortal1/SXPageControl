//
//  SXPageControlBaseView.m
//  SXPageControl
//
//  Created by 树下 on 2020/12/22.
//

#import "SXPageControlBaseView.h"


static  CGFloat  minItemSizeW  = 2;
static  CGFloat  minItemSizeH  = 2;

@interface SXPageControlBaseView ()
/**
 * 默认指示器最大的size
 */
@property (nonatomic, assign) CGSize maxIndicatorSize;
/**
 * 默认指示器最小的size
 */
@property (nonatomic, assign) CGSize minIndicatorSize;

/**
 * 当前选中下标
 */
@property (nonatomic, assign) NSInteger currentIndex;
/**
 * view
 */
@property (nonatomic, strong) UIView *contentView;

/**
 * 未选中的dot 的layer
 */
@property (nonatomic, strong) NSMutableArray *inactiveLayers;
/**
 *选中的dot 的layer
 */
@property (nonatomic, strong) CALayer *activeLayer;
@end
@implementation SXPageControlBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defalutValue];
        [self createUI];
    }
    return self;
}
#pragma mark ---默认值
- (void)defalutValue{
    _numberOfpage = 1;
    self.columnSpacing = 0;

    self.maxIndicatorSize = CGSizeMake(2, 2);
    self.minIndicatorSize = CGSizeMake(2, 2);
    self.activeSize       = CGSizeMake(10, 10);
    self.inactiveSize     = CGSizeMake(10, 10);
    self.inactiveColor = [UIColor lightGrayColor];
    self.activeColor   = [UIColor whiteColor];

    
    
    
}

#pragma mark ---UI
- (void)createUI{
    
    [self addSubview:self.contentView];
    
    
}
#pragma mark ---getter
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor redColor];
    }
    return _contentView;
}
#pragma mark ---setter
- (void)setNumberOfpage:(NSInteger)numberOfpage{
    _numberOfpage = numberOfpage;
    

    
}
- (void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    [self updateCurrentPage:currentPage];
}
- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage{

}
    
- (void)setInactiveColor:(UIColor *)inactiveColor{
    _inactiveColor = inactiveColor;
    
}
- (void)setActiveColor:(UIColor *)activeColor{
    _activeColor = activeColor;
    
}
- (void)setActiveSize:(CGSize)activeSize{
    _activeSize = activeSize;

    
    
}
- (void)setInactiveSize:(CGSize)inactiveSize{
    _inactiveSize = inactiveSize;

    
    
    
}
- (void)setIndicatorSize:(CGSize)indicatorSize{
    _indicatorSize = indicatorSize;
}
- (void)setColumnSpacing:(CGFloat)columnSpacing{
    _columnSpacing = columnSpacing;
    
}
#pragma mark ---计算当前的contentView
/**
 首先确定出 最大的 size 目前只 取决于 activeSize 和 inactiveSize 取他们的最大的 宽和高
  indicator 取他们最小的宽和高
 */
- (void)setContenViewSize{
    if (self.numberOfpage == 1) {
        return;
    }
    
    //:获取最大的item的宽度
    CGFloat maxItemSizeW = minItemSizeW;
    CGFloat maxItemSizeH = minItemSizeH;

    if (_activeSize.width >= _inactiveSize.width && _activeSize.width>= minItemSizeW) {
        maxItemSizeW = _activeSize.width;
        
    }else if(_inactiveSize.width >= _activeSize.width && _inactiveSize.width >= minItemSizeW){
        maxItemSizeW = _inactiveSize.width;
    }
    
    //:获取最大的高度
    if (_activeSize.height >= _inactiveSize.height && _activeSize.height>= minItemSizeH) {
        maxItemSizeH = _activeSize.height;
        
    }else if(_inactiveSize.height >= _activeSize.height && _inactiveSize.height >= minItemSizeH){
        maxItemSizeH = _inactiveSize.height;
    }
    self.maxIndicatorSize = CGSizeMake(maxItemSizeW, maxItemSizeH);
    
    
    CGFloat contentViewW = maxItemSizeW * self.numberOfpage + self.columnSpacing * (self.numberOfpage -1);
    CGFloat contentViewH = maxItemSizeH;
    
    //:contentView.frame
    self.contentView.frame = CGRectMake(0, 0, contentViewW, contentViewH);
    self.contentView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
}
#pragma mark ---创建layer
- (void)createDot{
    
    for (CALayer *tempL in self.inactiveLayers) {
        [tempL removeFromSuperlayer];
    }
    self.inactiveLayers = [NSMutableArray array];

    self.activeLayer = [CALayer new];

    for (int i = 0; i < self.numberOfpage ; i++) {
        CALayer *inactiveLayer = [CALayer new];
        inactiveLayer.backgroundColor = [UIColor blueColor].CGColor;
        [self.contentView.layer addSublayer:inactiveLayer];
        [self.inactiveLayers addObject:inactiveLayer];
    }
}
#pragma mark ---更新 index
- (void)updateCurrentPage:(NSInteger)currentIndex{}
#pragma mark ---布局inactiveLayer
- (void)layoutInactiveLayer{}
- (void)layoutActiveLayer{}
#pragma mark ---布局activelayer
#pragma mark ---reload
- (void)reload{
    [self setContenViewSize];
    [self createDot];
    [self layoutInactiveLayer];
    [self layoutActiveLayer];

}
@end
