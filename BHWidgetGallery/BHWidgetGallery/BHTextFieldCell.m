//
//  BHTextFieldCell.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/29/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "BHTextFieldCell.h"

@implementation BHTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _textField = [[UITextField alloc] init];
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

        [self.contentView addSubview:_textField];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    _textLabelWidth = 0.0f;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect bounds, titleFrame, textFrame;

    bounds = CGRectInset(self.contentView.bounds, 10.0f, 0.0f);
    
    CGFloat paddingX = _textLabelWidth ? 8.0f : 0.0f;
    CGRectDivide(bounds, &titleFrame, &textFrame, _textLabelWidth + paddingX, CGRectMinXEdge);
    titleFrame.size.width -= paddingX;

    self.textLabel.frame = titleFrame;
    self.textField.frame = textFrame;
}

@end
