//
//  UIViewController+BHLoadingView.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/29/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHLoadingView;

@interface UIViewController (BHLoadingView)

@property (assign, nonatomic, setter = bh_setLoading:) BOOL bh_loading;

- (void)bh_setLoading:(BOOL)loading animated:(BOOL)animated;

@end
