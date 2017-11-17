//
//  JQButton.m
//  自定义UIButton
//
//  Created by 韩军强 on 2017/11/17.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "JQButton.h"

@implementation JQButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //文字居中显示
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.numberOfLines = 0;
    
    CGFloat buttonW = self.bounds.size.width;
    CGFloat buttonH = self.bounds.size.height;

    CGFloat imageW = self.imageView.image.size.width;
    CGFloat imageH = self.imageView.image.size.height;
    
    //图片的宽不超过按钮的一半
    if (imageW>(buttonW/2)) {
        imageW = buttonW/2;
    }
    //图片的高不超过按钮的一半
    if (imageH>(buttonH/2)) {
        imageH = buttonH/2;
    }
    
    /**
        buttonH/4：指的是titleLabel的高度，假设是按钮的1/4.
    */
    CGFloat imageX = (buttonW - imageW)/2;
    CGFloat imageY = (buttonH - imageH - buttonH/4)/2;
//    if (imageW<buttonH/3) {
//        imageY = buttonH/3;
//    }
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    CGFloat titleLabelW = buttonW;
    CGFloat titleLabelH = buttonH - imageH - imageY;
    self.titleLabel.frame = CGRectMake(0, imageH + imageY + 2, titleLabelW, titleLabelH); //+2表示图片和文字间距适当再大一点
    
    //自动调整
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}


@end
