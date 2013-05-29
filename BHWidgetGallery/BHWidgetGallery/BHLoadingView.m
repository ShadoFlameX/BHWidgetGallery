//
//  BHLoadingView.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/29/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "BHLoadingView.h"
#import "BHGeometry.h"
#import <QuartzCore/QuartzCore.h>

@implementation BHLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.65f];
        self.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.85f].CGColor;
        self.layer.borderWidth = 2.0f;
        self.layer.cornerRadius = 10.0f;
        self.layer.masksToBounds = YES;

        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];

        [self addSubview:_activityIndicator];
    }
    return self;
}

- (void)layoutSubviews
{
    _activityIndicator.frame = CGRectCenteredInRect(_activityIndicator.frame, self.bounds);
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return CGSizeMake(44.0f, 44.0f);
}

@end
