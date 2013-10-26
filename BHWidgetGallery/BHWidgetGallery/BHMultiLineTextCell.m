//
//  BHMultiLineTextCell.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 10/25/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "BHMultiLineTextCell.h"

@implementation BHMultiLineTextCell

#pragma mark - Properties

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
    if (UIEdgeInsetsEqualToEdgeInsets(_contentInsets, contentInsets)) return;

    _contentInsets = contentInsets;

    [self setNeedsLayout];
}

#pragma mark - Alloc/Init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.numberOfLines = 0;
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.textLabel.frame = UIEdgeInsetsInsetRect(self.contentView.bounds, self.contentInsets);
}

- (CGFloat)height
{
    CGFloat width = self.contentView.bounds.size.width - self.contentInsets.left - self.contentInsets.right;
    CGSize size = CGSizeMake(width, 10000.0f);

    // for some reason height is just slightly too small, so add 1pt
    CGFloat height = [self.textLabel sizeThatFits:size].height + self.contentInsets.top + self.contentInsets.bottom + 1.0f;
    NSAssert(height < 2009.0f, @"Cell height is larger than Apple's recommended max");
    height = MIN(2008.0f, height);

    return height;
}

@end
