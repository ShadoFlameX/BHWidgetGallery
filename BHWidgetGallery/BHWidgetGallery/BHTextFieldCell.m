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

        [self.contentView addSubview:_textField];

        [_textField addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc
{
    [self.textField removeObserver:self forKeyPath:@"text"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect bounds, titleFrame, textFrame;

    bounds = CGRectInset(self.contentView.bounds, 15.0f, 0.0f);

    CGFloat width = [self.textLabel sizeThatFits:bounds.size].width;

    CGFloat paddingX = width > 0.0f ? 8.0f : 0.0f;
    CGRectDivide(bounds, &titleFrame, &textFrame, width + paddingX, CGRectMinXEdge);
    titleFrame.size.width -= paddingX;

    self.textLabel.frame = titleFrame;
    self.textField.frame = textFrame;
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.textField && [keyPath isEqualToString:@"text"]) {
        [self setNeedsLayout];
    }
}

@end
