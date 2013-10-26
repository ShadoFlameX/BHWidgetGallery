//
//  BHTextViewCell.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 10/25/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "BHTextViewCell.h"

@implementation BHTextViewCell

#pragma mark - Alloc/Init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _textView = [[UITextView alloc] init];

        [self.contentView addSubview:_textView];
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.textView.frame = UIEdgeInsetsInsetRect(self.contentView.bounds, self.contentInsets);
}

- (void)prepareForReuse
{
    [super prepareForReuse];

    self.textView.text = nil;
}

- (CGFloat)height
{
    CGFloat width = self.contentView.bounds.size.width - self.contentInsets.left - self.contentInsets.right;

    // per Apple, cell heights should not be greater than 2009, reducing to account for insets
    CGSize size = CGSizeMake(width, 1960.0f);

    return [self.textView sizeThatFits:size].height;
}

@end
