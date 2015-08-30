//
//  PoliciesViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 30/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "PoliciesViewController.h"

@implementation PoliciesViewController
{
    NSArray *resources;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    resources = [NSArray arrayWithObjects:NSLocalizedString(@"National Agricultural Insurance Scheme ", nil) , NSLocalizedString(@"Pilot Coconut Palm Insurance Scheme ", nil), NSLocalizedString(@"Jute Technology Mission", nil),NSLocalizedString(@"Draft National Disaster Mitigation Plan", nil),NSLocalizedString(@"National e-Governance Plan in Agriculture", nil),NSLocalizedString(@"Soil Health Management", nil), nil];
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [resources objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"schemeSegue" sender:self];
}


@end
