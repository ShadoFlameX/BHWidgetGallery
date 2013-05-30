//
//  BHMasterViewController.m
//  BHWidgetGallery
//
//  Created by Bryan Hansen on 5/23/13.
//  Copyright (c) 2013 skeuo. All rights reserved.
//

#import "BHMasterViewController.h"
#import "BHDetailViewController.h"
#import "BHFlipControl.h"
#import "BHTextFieldCell.h"
#import "UIViewController+BHLoadingView.h"

static NSString * const TextFieldCellIdentifier = @"TextFieldCell";

@interface BHMasterViewController () {
    BHFlipControl *_flipControl;
}
@end

@implementation BHMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    _flipControl = [[BHFlipControl alloc] initWithFrontImage:[UIImage imageNamed:@"flip-front"] backImage:[UIImage imageNamed:@"flip-back"]];
    [_flipControl addTarget:self action:@selector(toggleFlipButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_flipControl];

    [self.tableView registerClass:[BHTextFieldCell class] forCellReuseIdentifier:TextFieldCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions

- (void)toggleFlipButton:(id)sender
{
    [_flipControl setShowFront:!_flipControl.showFront animated:YES];

    [self showLoading];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideLoading) object:nil];
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:2.0f];
}

- (void)showLoading
{
    [self bh_setLoading:YES animated:YES];
}

- (void)hideLoading
{
    [self bh_setLoading:NO animated:YES];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        BHTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:TextFieldCellIdentifier];

        cell.textLabel.text = @"Phone";
        cell.textLabelWidth = 64.0f;
        cell.textField.placeholder = @"(###) ###-####";

        return cell;
    }

    if (indexPath.row == 1) {
        BHTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:TextFieldCellIdentifier];

        cell.textField.placeholder = @"email@domain.com";

        return cell;
    }

    return nil;
}

@end
