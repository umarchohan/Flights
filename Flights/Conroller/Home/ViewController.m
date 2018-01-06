//
//  ViewController.m
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "FAPICaller.h"
#import "DetailsViewController.h"
#import <SVProgressHUD.h>
#import "Flight.h"
#import "FlightCell.h"

@interface ViewController ()

{
    NSMutableArray* flightsArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    flightsArray = [[NSMutableArray alloc] init];
    
    [self addNetworkListener];
    
    self.flightTable.delegate = self;
    self.flightTable.dataSource = self;
    
    [self setupNavBar];
        
    [self getAllFlights];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Private

-(void)setupNavBar
{
    UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    img.contentMode = UIViewContentModeScaleAspectFit;
    img.image = [UIImage imageNamed:@"FlightMini"];
    self.navigationItem.titleView = img;
}

-(void)getAllFlights
{
    [self.view setUserInteractionEnabled:NO];

    [SVProgressHUD showWithStatus:@"Please wait!"];
    
    [[FAPICaller sharedManager] getAllFlightswithHandler:^(NSDictionary *info, BOOL success, NSError *error) {
        
        [self.view setUserInteractionEnabled:YES];

        if (success)
        {
            
            [SVProgressHUD dismiss];
            
            NSArray* list = (NSArray*)info;
            
            for (int i = 0; i < list.count; i++)
            {
                Flight* f = [[Flight alloc] initWithInfo:list[i]];
                [flightsArray addObject:f];
            }
            
            [self.flightTable reloadData];
        }
        else
        {
            [SVProgressHUD dismiss];
            [SVProgressHUD showErrorWithStatus:@"Oops! Server Error"];
        }
        
    }];
}

-(void)addNetworkListener
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status)
        {
            case 0:
                [SVProgressHUD showErrorWithStatus:@"No Connection,Please check your cellular or WIFI network"];
                break;
            default:
                break;
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

#pragma mark UITableview data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return flightsArray.count;
}

#pragma mark UITableview delegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FlightCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FlightCell" forIndexPath:indexPath];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    Flight* f = [flightsArray objectAtIndex:indexPath.row];
    
    cell.departureCityLable.text = f.departureAirport;
    cell.destinationCityLable.text = f.arrivalAirport;
    
    cell.departureTimeLabel.text = [NSString stringWithFormat:@"Departure: %@",f.departureDate];
    cell.arrivalTimeLabel.text = [NSString stringWithFormat:@"Arrival: %@",f.arrivalDate];
    cell.flightDurationLabel.text = [NSString stringWithFormat:@"Duration: %@",f.flightDuration];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController* view = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    view.selectedFlight = [flightsArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:view animated:YES];
}

@end
