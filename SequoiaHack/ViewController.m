//
//  ViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>
#define ServerURl @""

@interface ViewController ()<CLLocationManagerDelegate>
@property(nonatomic, strong) UILabel *topLabel;
@end

@implementation ViewController

CLLocationManager *locationManager;
NSArray *fetchedData;


- (void)viewDidLoad {
    [super viewDidLoad];
    
     locationManager = [[CLLocationManager alloc] init];
    [self getCurrentLocation];
    self.tabBarController.navigationItem.title = NSLocalizedString(@"Home", nil);
    fetchedData = [NSArray arrayWithObjects:NSLocalizedString(@"Apple", nil) , NSLocalizedString(@"Rice", nil), NSLocalizedString(@"Wheat", nil),NSLocalizedString(@"Barley", nil),NSLocalizedString(@"Banana", nil),NSLocalizedString(@"Onion", nil), nil];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(playVoice:)];
    
    self.tabBarController.navigationItem.rightBarButtonItem = rightItem;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    NSString *string =NSLocalizedString(@"Top 5 Crops to sow this season", nil);
    /* Section header is in 0th index... */
    [label setText:string];
    [label setTextColor:[UIColor whiteColor]];

    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:41/255.0 green:171/255.0 blue:37/255.0 alpha:1]]; //your background color...
    return view;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   self.tabBarController.navigationItem.title = NSLocalizedString(@"Home", nil);

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playVoice:(id)sender {
    if(self.tabBarController.selectedIndex == 0) {
        [Utils speakInHindi:@"शीर्ष 5 फसलें इस मौसम में बोना"];
    }
    else if(self.tabBarController.selectedIndex == 2) {
        [Utils speakInHindi:@"नक्शे पर अपने खेत स्थान का चयन"];
    }
    
}

- (void)getCurrentLocation {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
//    UIAlertView *errorAlert = [[UIAlertView alloc]
//                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        NSLog(@"%f",currentLocation.coordinate.longitude);
        [Utils saveCurrentField:currentLocation.coordinate];
        [locationManager stopUpdatingLocation];
    }
    
}


-(void)getCrops {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:ServerURl parameters:@{@"longitude":@"", @"latitude":@""} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [fetchedData count];    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier] ;
    }
    cell.textLabel.text = [fetchedData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:NSLocalizedString(@"yield : %d", nil), 20];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}





@end
