# SXPageControl  使用

pod 引入
```
pod 'SXPageControl'

```
引入头文件
```
#import "SXPageControlBaseView.h"
```
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    pageC = [SXPageControlJump new];
    pageC.frame = CGRectMake(0,100, self.view.frame.size.width, 80);
    pageC.numberOfpage = 4;
    pageC.activeSize = CGSizeMake(30, 20);
    pageC.inactiveSize = CGSizeMake(10, 10);
    pageC.backgroundColor = [UIColor blackColor];
    pageC.columnSpacing = 0;
    pageC.inactiveColor = [UIColor blueColor];
    pageC.activeColor = [UIColor purpleColor];
    pageC.contentViewBGColor = [UIColor greenColor];
    [self.view addSubview:pageC];
    [pageC reload];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    pageC.currentPage += 1;
    if (pageC.currentPage > 4) {
        pageC.currentPage = 0;
    }
}
