//
//  LocationSearchTable.m
//  MapKitTutorialObjC
//
//  Created by Robert Chen on 1/19/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

#import "LocationSearchTable.h"

@interface LocationSearchTable ()
@property NSArray<MKMapItem *> *matchingItems;
@end

@implementation LocationSearchTable

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController;
{
    NSString *searchBarText = searchController.searchBar.text;
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchBarText;
    request.region = _mapView.region;
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSLog(@"Map Items: %@", response.mapItems);
        self.matchingItems = response.mapItems;
        [self.tableView reloadData];

    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_matchingItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MKPlacemark *selectedItem = _matchingItems[indexPath.row].placemark;
    cell.textLabel.text = selectedItem.name;
    cell.detailTextLabel.text = @"";
    return cell;
}

@end
