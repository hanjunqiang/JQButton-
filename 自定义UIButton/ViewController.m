//
//  ViewController.m
//  自定义UIButton
//
//  Created by 韩军强 on 2017/11/17.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "ViewController.h"
#import "JQButton.h"

@interface ViewController ()

@property (nonatomic, assign) int totalCol;

@end

@implementation ViewController


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"test---%d",(int)MAXFLOAT);

    
    JQButton *testBtn = [[JQButton alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH)];
    testBtn.backgroundColor = [UIColor redColor];
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    NSLog(@"image---%@",NSStringFromCGSize(image.size));
    
    [testBtn setTitle:@"点击空白处,\n测试按钮处于不同大小时，自适应的效果。\n文字的大小直接设置按钮的文字的大小即可。\n只适用于上图下文字的情况" forState:UIControlStateNormal];
    [testBtn setImage:image forState:UIControlStateNormal];
    
    [testBtn addTarget:self action:@selector(jq_clickBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    

}

-(void)jq_clickBtnMethod
{
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    self.totalCol ++;
    if (self.totalCol == 9) {
        self.totalCol = 1;
    }
    
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperview];
    }
    [self jq_test];
}

-(void)jq_test
{
    NSArray *imagesName = @[@"2.jpg",@"daifk",@"daipl",@"daishh",@"gouwu",@"ping",@"shequ",@"shouc",@"shouh",@"1.jpg",@"2.jpg",@"daifk",@"daipl",@"daishh",@"gouwu",@"ping",@"shequ",@"shouc",@"shouh",@"1.jpg",@"2.jpg",@"daifk",@"daipl",@"daishh",@"gouwu",@"ping",@"shequ",@"shouc",@"shouh",@"1.jpg",@"2.jpg",@"daifk",@"daipl",@"daishh",@"gouwu",@"ping",@"shequ",@"shouc",@"shouh",@"1.jpg",@"2.jpg",@"daifk",@"daipl",@"daishh",@"gouwu",@"ping",@"shequ",@"shouc",@"shouh",@"1.jpg",@"2.jpg",@"daifk",@"daipl",@"daishh",@"gouwu",@"ping",@"shequ",@"shouc",@"shouh",@"1.jpg"];
    
    for (int i = 0; i<40; i++) {
        
        int totalCol = self.totalCol;
        
        int row = (int)i/totalCol;
        
        int col = (int)(i % totalCol);
        
        CGFloat jianju = 10;
        
        CGFloat w = (SCREEN_WIDTH - (totalCol-1)*jianju)/totalCol;
        JQButton *testBtn = [[JQButton alloc] initWithFrame:CGRectMake(col*(w+10), 20+row*(w+10), w, w)];
        testBtn.backgroundColor = [UIColor redColor];
        
        [testBtn setTitle:[NSString stringWithFormat:@"第%d个",i] forState:(UIControlStateNormal)];
        if (i<imagesName.count) {
            UIImage *image = [UIImage imageNamed:imagesName[i]];
            NSLog(@"image---%@",NSStringFromCGSize(image.size));
            
            [testBtn setImage:image forState:UIControlStateNormal];
        }
        
//        testBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [testBtn addTarget:self action:@selector(jq_clickBtnMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:testBtn];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
