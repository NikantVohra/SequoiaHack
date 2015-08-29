//
//  MapViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "MapViewController.h"
@import GoogleMaps;

@implementation MapViewController {
    GMSMapView *mapView_;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:30.174427
                                                            longitude:75.00565
                                                                 zoom:17];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.mapType = kGMSTypeSatellite;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Farm";
    marker.snippet = @"India";
    marker.map = mapView_;
}




-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = NSLocalizedString(@"Map", nil);
}
@end
