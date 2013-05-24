//
//  BHMasterViewController.h
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/23/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHDetailViewController;

@interface BHMasterViewController : UITableViewController

@property (strong, nonatomic) BHDetailViewController *detailViewController;

@end
