//
//  BHFlipControl.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/23/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHFlipControl : UIControl

@property (strong, nonatomic) UIImageView *frontView;
@property (strong, nonatomic) UIImageView *backView;
@property (strong, nonatomic) UIImageView *background;
@property (nonatomic) BOOL showFront;

- (id)initWithFrontImage:(UIImage *)frontImage backImage:(UIImage *)backImage;

- (void)setShowFront:(BOOL)showFront animated:(BOOL)animated;
- (void)setShowFront:(BOOL)showFront animated:(BOOL)animated duration:(CGFloat)duration;

@end
