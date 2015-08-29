//
//  ResourcesViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "ResourcesViewController.h"

@interface ResourcesViewController()<UITableViewDelegate, UITableViewDataSource>

@end


@implementation ResourcesViewController
{
    NSArray *resources;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    resources = [NSArray arrayWithObjects:NSLocalizedString(@"Land Preparation", nil) , NSLocalizedString(@"Sowing Seeds", nil), NSLocalizedString(@"Fertilizing", nil),NSLocalizedString(@"Irrigation Methods", nil),NSLocalizedString(@"Crop Growth", nil),NSLocalizedString(@"Harvesting", nil), nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [resources count];    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] ;
    }
    cell.textLabel.text = [resources objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 3) {
        [self performSegueWithIdentifier:@"irrigationSegue" sender:self];
    }
}


@end
