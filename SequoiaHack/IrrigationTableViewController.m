//
//  IrrigationTableViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "IrrigationTableViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@implementation IrrigationTableViewController


{
    NSArray *resources;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    resources = [NSArray arrayWithObjects:NSLocalizedString(@"Drip Irrigation", nil) , NSLocalizedString(@"Flood Irrigation", nil), NSLocalizedString(@"Rotation Irrigation", nil),NSLocalizedString(@"Surface Irrigation", nil),NSLocalizedString(@"Sprinkler Irrigation", nil),NSLocalizedString(@"Furrow Irrigation", nil), nil];
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
    NSURL *movieURL = [NSURL URLWithString:@"https://www.youtube.com/watch?v=pU67YgY5P80"];
    MPMoviePlayerViewController *movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:movieController];
    [movieController.moviePlayer play];
}




@end
