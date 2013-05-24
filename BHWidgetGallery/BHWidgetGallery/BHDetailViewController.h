//
//  BHDetailViewController.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/23/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
