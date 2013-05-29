//
//  UIViewController+LoadingView.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/29/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "UIViewController+LoadingView.h"
#import "BHLoadingView.h"
#import "BHGeometry.h"
#import <objc/runtime.h>

static char BHLoadingKey;
static char BHLoadingViewKey;

static CGFloat const ShowDuration = 0.2f;
static CGFloat const HideDuration = 0.15f;

@interface UIViewController (LoadingViewPrivate)

@property (assign, nonatomic, setter = bh_setLoadingView:) BHLoadingView *bh_loadingView;

@end

@implementation UIViewController (LoadingView)

- (BOOL)bh_loading
{
    NSNumber *number = objc_getAssociatedObject(self, &BHLoadingKey);
    return [number boolValue];
}

- (void)bh_setLoading:(BOOL)loading {
    [self bh_setLoading:loading animated:NO];
}

- (void)bh_setLoading:(BOOL)loading animated:(BOOL)animated;
{
    if (self.bh_loading == loading) return;

    NSNumber *number = [NSNumber numberWithBool:loading];
    objc_setAssociatedObject(self, &BHLoadingKey, number , OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (loading) {
        BHLoadingView *loadingView = [[BHLoadingView alloc] init];
        [loadingView sizeToFit];
        loadingView.frame = CGRectCenteredInRect(loadingView.frame, self.view.bounds);
        [loadingView.activityIndicator startAnimating];
        [self.view addSubview:loadingView];
        self.bh_loadingView = loadingView;

        if (animated) {
            loadingView.alpha = 0.0f;
            loadingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
            [UIView animateWithDuration:ShowDuration animations:^{
                loadingView.alpha = 1.0f;
                loadingView.transform = CGAffineTransformIdentity;
            }];
        }
        
    } else {
        if (animated) {
            [UIView animateWithDuration:HideDuration animations:^{
                self.bh_loadingView.alpha = 0.0f;
                self.bh_loadingView.transform = CGAffineTransformMakeScale(0.25f, 0.25f);

            } completion:^(BOOL finished) {
                [self.bh_loadingView removeFromSuperview];
                self.bh_loadingView = nil;
            }];
            
        } else {
            [self.bh_loadingView removeFromSuperview];
            self.bh_loadingView = nil;
        }
    }
}

- (BHLoadingView *)bh_loadingView
{
    return (BHLoadingView *)objc_getAssociatedObject(self, &BHLoadingViewKey);
}

- (void)bh_setLoadingView:(BHLoadingView *)bh_loadingView {
    objc_setAssociatedObject(self, &BHLoadingViewKey, bh_loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
