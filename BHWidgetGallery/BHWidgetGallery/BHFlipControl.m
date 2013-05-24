//
//  BHFlipControl.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/23/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "BHFlipControl.h"

static CGFloat const DefaultDuration = 0.65f;

@interface BHFlipControl () {
    UIView *_container;
}

@end

@implementation BHFlipControl

#pragma mark - Properties

- (void)setShowFront:(BOOL)showFront animated:(BOOL)animated
{
    [self setShowFront:showFront animated:animated duration:DefaultDuration];
}

- (void)setShowFront:(BOOL)showFront animated:(BOOL)animated duration:(CGFloat)duration
{
    if (_showFront == showFront) return;

    _showFront = showFront;

    _frontView.frame = _container.bounds;
    _backView.frame = _container.bounds;

    UIView *fromView = _showFront ? _backView : _frontView;
    UIView *toView = _showFront ? _frontView : _backView;

    CGFloat dur = animated ? duration : 0.0f;
    UIViewAnimationOptions flipOption = _showFront ?
                                        UIViewAnimationOptionTransitionFlipFromLeft :
                                        UIViewAnimationOptionTransitionFlipFromRight;

    [UIView transitionFromView:fromView toView:toView duration:dur options:flipOption completion:nil];
}


#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _background = [[UIImageView alloc] initWithFrame:self.bounds];
        _background.image = [UIImage imageNamed:@"flip-background"];
        _background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        _container = [[UIView alloc] initWithFrame:self.bounds];
        _container.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _container.userInteractionEnabled = NO;

        _frontView = [[UIImageView alloc] initWithFrame:self.bounds];
        _frontView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        _backView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

        [_container addSubview:_frontView];
        _showFront = YES;

        [self addSubview:_background];
        [self addSubview:_container];
    }
    return self;
}

- (id)initWithFrontImage:(UIImage *)frontImage backImage:(UIImage *)backImage
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        _frontView.image = frontImage;
        _backView.image = backImage;
        [self sizeToFit];
    }
    return self;
}

- (CGSize) sizeThatFits:(CGSize)size
{
    return [_background sizeThatFits:size];
}

@end
