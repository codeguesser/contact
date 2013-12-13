//
//  CropView.m
//  testClip
//
//  Created by rsaif on 13-8-16.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import "CropView.h"
#import <QuartzCore/QuartzCore.h>
@implementation CropView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.layer.borderColor = [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth = 1;
        backgroundScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:backgroundScrollView];
        imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"promo_macbookair.jpg"]];
        CGRect imageViewFrame = CGRectZero;
        imageViewFrame.size = imageView.image.size;
        imageView.frame = imageViewFrame;
        [backgroundScrollView addSubview:imageView];
        backgroundScrollView.bounces = NO;
        [backgroundScrollView setZoomScale:.5];
        [backgroundScrollView setContentSize:frame.size];
        [backgroundScrollView setMaximumZoomScale:5];
        [backgroundScrollView setMinimumZoomScale:.5];
        backgroundScrollView.showsHorizontalScrollIndicator = NO;
        backgroundScrollView.showsVerticalScrollIndicator = NO;
        [backgroundScrollView setBouncesZoom:YES];
        backgroundScrollView.delegate = self;
        
        
        frameView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 280, 280)];
        frameView.userInteractionEnabled = NO;
        frameView.layer.borderColor = [UIColor grayColor].CGColor;
        frameView.layer.borderWidth = 1;
        
        maskView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height)];
        [maskView setImage:[self getMaskViewImageWithLargeSize:frame.size littleSize:frameView.frame.size]];
        [self addSubview:maskView];
        [self addSubview:frameView];
        
        
        
    }
    return self;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}

-(UIImage *)getMaskViewImageWithLargeSize:(CGSize)largeSize littleSize:(CGSize)littleSize{
    UIGraphicsBeginImageContext(largeSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置倒立
    CGContextRotateCTM(context,M_PI);
    //重新设置坐标  self.bounds获取整个屏幕的区域。
    CGContextTranslateCTM(context, -largeSize.width,-largeSize.height);
    [[UIColor colorWithWhite:0 alpha:.4]setFill];
    CGContextFillRect(context, CGRectMake(0, 0, largeSize.width, largeSize.height));
    CGContextClearRect(context, CGRectMake((largeSize.width-littleSize.width)/2.0, (largeSize.height-littleSize.height)/2.0f, littleSize.width,littleSize.height));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(UIImage *)cropedImage{
    UIGraphicsBeginImageContext(CGSizeMake((frameView.frame.size.width-frameView.layer.borderWidth*2), (frameView.frame.size.height-frameView.layer.borderWidth*2)));//全屏截图，包括window
    [[self tempImage]drawInRect:CGRectMake(-frameView.frame.origin.x-frameView.layer.borderWidth,-frameView.frame.origin.y-frameView.layer.borderWidth, self.frame.size.width, self.frame.size.height)];
    UIImage *tempviewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tempviewImage;
}
-(UIImage *)tempImage{
    
    UIGraphicsBeginImageContext(self.frame.size);//全屏截图，包括window
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *tempviewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempviewImage;
}

-(void)setBackgroundImage:(UIImage *)image{
    CGRect imageViewFrame = CGRectZero;
    imageViewFrame.size = image.size;
    imageView.frame = imageViewFrame;
    imageView.image = image;
}
@end
