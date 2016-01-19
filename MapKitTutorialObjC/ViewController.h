//
//  ViewController.h
//  MapKitTutorialObjC
//
//  Created by Robert Chen on 1/19/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@protocol HandleMapSearch <NSObject>
- (void)dropPinZoomIn:(MKPlacemark *)placemark;
@end

@interface ViewController : UIViewController <CLLocationManagerDelegate, HandleMapSearch, MKMapViewDelegate>

@end

