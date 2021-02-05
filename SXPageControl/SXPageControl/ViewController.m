//
//  ViewController.m
//  SXPageControl
//
//  Created by 树下 on 2020/12/22.
//

#import "ViewController.h"
#import "SXPageControlBaseView.h"
#import "SXPageControlJump.h"

@interface ViewController ()

@end
SXPageControlBaseView *pageC;
CGFloat itemSizeW = 5;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    pageC = [SXPageControlJump new];
    pageC.frame = CGRectMake(0,100, self.view.frame.size.width, 80);
    pageC.numberOfpage = 4;
    pageC.activeSize = CGSizeMake(30, 20);
    pageC.inactiveSize = CGSizeMake(10, 10);
    pageC.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pageC];
    [pageC reload];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    pageC.currentPage += 1;
    if (pageC.currentPage > 4) {
        pageC.currentPage = 0;
    }
}


@end
