//
//  BHTextViewCell.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 10/25/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHTextViewCell : UITableViewCell

@property (strong, nonatomic, readonly) UITextView *textView;
@property (assign, nonatomic) UIEdgeInsets contentInsets;

- (CGFloat)height;

@end
