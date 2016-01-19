//
//  LocationSearchTable.h
//  MapKitTutorialObjC
//
//  Created by Robert Chen on 1/19/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
#import "ViewController.h"

@interface LocationSearchTable : UITableViewController <UISearchResultsUpdating>
@property MKMapView *mapView;
@property id <HandleMapSearch>handleMapSearchDelegate;

@end
