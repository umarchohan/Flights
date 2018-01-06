//
//  Flight.h
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flight : NSObject

-(id)initWithInfo:(NSDictionary*)info;

@property (nonatomic) NSInteger flightID;
@property (nonatomic) NSString* departureDate;
@property (nonatomic) NSString* arrivalDate;
@property (nonatomic) NSString* flightNumber;
@property (nonatomic) NSString* trackingNumber;
@property (nonatomic) NSString* airlineCode;
@property (nonatomic) NSString* departureCity;
@property (nonatomic) NSString* departureAirport;
@property (nonatomic) NSString* arrivalCity;
@property (nonatomic) NSString* arrivalAirport;
@property (nonatomic) NSString* flightDuration;
@property (nonatomic) NSString* creationDate;
@property (nonatomic) NSString* updationDate;

@end
