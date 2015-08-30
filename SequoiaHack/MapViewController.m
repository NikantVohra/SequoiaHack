//
//  MapViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "MapViewController.h"
@import GoogleMaps;
#import "Utils.h"
@interface MapViewController()<GMSMapViewDelegate>

@end

@implementation MapViewController {
    GMSMapView *mapView_;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    NSDictionary *userLoc = [Utils getCurrentField];
    GMSMarker *marker = [[GMSMarker alloc] init];
    double latitude = [[userLoc objectForKey:@"lat"] doubleValue];
    double longitude = [[userLoc objectForKey:@"long"] doubleValue];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.mapType = kGMSTypeSatellite;
    mapView_.delegate = self;
    self.view = mapView_;
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    // Creates a marker in the center of the map.
    
    marker.title = @"My Farm";
    marker.snippet = @"India";
    marker.map = mapView_;
}
-(void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate {
    [mapView_ clear];
    [Utils saveCurrentField:coordinate];
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    
    marker3.position = coordinate;
    marker3.title = @"My Farm";
    marker3.snippet = @"India";
    marker3.map = mapView_;
}



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = NSLocalizedString(@"Map", nil);
}
@end
