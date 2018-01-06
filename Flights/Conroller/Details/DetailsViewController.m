//
//  DetailsViewController.m
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import "DetailsViewController.h"
#import <AFNetworking.h>
#import "FAPICaller.h"
#import <SVProgressHUD.h>

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addNetworkListener];
    [self setupNavBar];
    
    [self getFlightDetails];
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
- (void)goBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getFlightDetails
{
    [self.view setUserInteractionEnabled:NO];
    [SVProgressHUD showWithStatus:@"Please wait!"];
    
    [[FAPICaller sharedManager] getFlightDetailsWithFlightID:self.selectedFlight.flightID withHandler:^(NSDictionary *info, BOOL success, NSError *error) {
        if (success)
        {
            [self.view setUserInteractionEnabled:YES];
            [SVProgressHUD dismiss];
            
            Flight* f = [[Flight alloc] initWithInfo:info];
            
            self.departureCityLabel.text = [NSString stringWithFormat:@"Departure City : %@",f.departureCity];
            self.arrivalCityLabel.text = [NSString stringWithFormat:@"Arrival City : %@",f.arrivalCity];
            self.departureAirportLabel.text = f.departureAirport;
            self.arrivalAirportLabel.text = f.arrivalAirport;
            self.departureTimeLabel.text = [NSString stringWithFormat:@"Departure: %@",f.departureDate];
            self.arrivalDateLabel.text = [NSString stringWithFormat:@"Arrival: %@",f.arrivalDate];
            self.durationLabel.text = [NSString stringWithFormat:@"Duration: %@",f.flightDuration];
            self.flightCodeLabel.text = [NSString stringWithFormat:@"Flight Number: %@",f.trackingNumber];
            
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


@end
