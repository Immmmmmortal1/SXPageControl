//
//  SXPageControlJump.m
//  SXPageControl
//
//  Created by 树下 on 2020/12/22.
//

#import "SXPageControlJump.h"

@implementation SXPageControlJump

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark ---//:重写布局
- (void)layoutActiveLayer{
    CGFloat firstLayerX = (self.maxIndicatorSize.width - self.activeSize.width)*0.5;
    CGFloat firstLayerY = (self.maxIndicatorSize.height - self.activeSize.height)*0.5;

    [self.activeLayer removeFromSuperlayer];
    self.activeLayer.backgroundColor = [UIColor yellowColor].CGColor;
    self.activeLayer.frame = CGRectMake(firstLayerX, firstLayerY, self.activeSize.width, self.activeSize.height);
    self.activeLayer.cornerRadius = self.activeLayer.frame.size.height*0.5;
    [self.contentView.layer addSublayer:self.activeLayer];
}
- (void)layoutInactiveLayer{
  //:最大size 铺满整个content
    //:确认第一个layer的大小坐标
    CGFloat firstLayerX = (self.maxIndicatorSize.width - self.inactiveSize.width)*0.5;
    CGFloat firstLayerY = (self.maxIndicatorSize.height - self.inactiveSize.height)*0.5;
    
    CGFloat cornerR = 0;
    if (self.inactiveSize.width > self.inactiveSize.height) {
        cornerR = self.inactiveSize.height*0.5;
    }else{
        cornerR = self.inactiveSize.width*0.5;
    }
    for (int i = 0; i < self.inactiveLayers.count; i ++ ) {
        CALayer *tempLayer = self.inactiveLayers[i];
        tempLayer.frame = CGRectMake(firstLayerX+(self.maxIndicatorSize.width + self.columnSpacing)*i, firstLayerY, self.inactiveSize.width, self.inactiveSize.height);
        tempLayer.cornerRadius = cornerR;
        [self.contentView.layer addSublayer:tempLayer];
    }
    
}
#pragma mark ---//:更新位置
- (void)updateCurrentPage:(NSInteger)currentIndex{

    
    if (currentIndex > self.numberOfpage - 1) {
        currentIndex = 0;
    }
    CGFloat firstLayerX = (self.maxIndicatorSize.width - self.activeSize.width)*0.5;
    CGFloat firstLayerY = (self.maxIndicatorSize.height - self.activeSize.height)*0.5;

    self.activeLayer.backgroundColor = [UIColor yellowColor].CGColor;
    if (currentIndex == 0) {
        self.activeLayer.frame = CGRectMake(firstLayerX + (self.maxIndicatorSize.width + self.columnSpacing)*currentIndex, firstLayerY, self.activeSize.width, self.activeSize.height);
        return;
    }

    //:动画开始
    [CATransaction begin];
    //:结束后的状态
    [CATransaction setCompletionBlock:^{
        self.activeLayer.frame = CGRectMake(firstLayerX + (self.maxIndicatorSize.width + self.columnSpacing)*currentIndex, firstLayerY, self.activeSize.width, self.activeSize.height);
    }];
    [CATransaction begin];
    CGFloat animaW = self.activeSize.width*0.5 + self.maxIndicatorSize.width*1.5 + self.columnSpacing;
    self.activeLayer.frame = CGRectMake(firstLayerX + (self.maxIndicatorSize.width + self.columnSpacing)*(currentIndex - 1), firstLayerY, animaW, self.activeSize.height);    [CATransaction commit];
    [CATransaction commit];
    [CATransaction commit];


    
}
@end
