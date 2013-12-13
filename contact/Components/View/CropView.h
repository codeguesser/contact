//
//  CropView.h
//  testClip
//
//  Created by rsaif on 13-8-16.
//  Copyright (c) 2013年 rsaif. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CropView : UIView<UIScrollViewDelegate>{
    UIScrollView *backgroundScrollView;
    UIImageView *imageView;
    
    UIImageView *maskView;
    UIView *frameView;
}
-(UIImage *)cropedImage;
-(void)setBackgroundImage:(UIImage *)image;
@end
