//
//  DetailsViewController.h
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flight.h"


@interface DetailsViewController : UIViewController

@property (nonatomic) Flight* selectedFlight;

@property (weak, nonatomic) IBOutlet UILabel *departureAirportLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalAirportLabel;
@property (weak, nonatomic) IBOutlet UILabel *departureCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *departureTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *flightCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end
