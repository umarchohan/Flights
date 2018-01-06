//
//  FlightCell.h
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlightCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *departureCityLable;
@property (weak, nonatomic) IBOutlet UILabel *destinationCityLable;
@property (weak, nonatomic) IBOutlet UILabel *departureTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivalTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *flightDurationLabel;

@end
