//
//  BHTextFieldCell.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/29/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHTextFieldCell : UITableViewCell

@property (strong, nonatomic, readonly) UITextField *textField;
@property (assign, nonatomic) CGFloat textLabelWidth;

@end
