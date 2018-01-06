//
//  Flight.m
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import "Flight.h"


@implementation Flight

static NSString* const kFlightID = @"id";
static NSString* const kDepartureDate = @"departure_date";
static NSString* const kArrivalDate = @"arrival_date";
static NSString* const kAirlineCode = @"airline_code";
static NSString* const kFlightNumber = @"flight_number";
static NSString* const kDepartureCity = @"departure_city";
static NSString* const kDepartureAirport = @"departure_airport";
static NSString* const kArrivalCity = @"arrival_city";
static NSString* const kArrivalAirport = @"arrival_airport";
static NSString* const kFlightDuration = @"scheduled_duration";
static NSString* const kCreationDate = @"created_at";
static NSString* const kUpdationDate = @"updated_at";


@synthesize  flightID;
@synthesize departureDate;
@synthesize arrivalDate;
@synthesize flightNumber;
@synthesize airlineCode;
@synthesize departureCity;
@synthesize departureAirport;
@synthesize arrivalCity;
@synthesize arrivalAirport;
@synthesize flightDuration;
@synthesize creationDate;
@synthesize updationDate;
@synthesize trackingNumber;

- (id)init
{
    if ((self = [super init]))
    {
        self.flightID = 0;
        self.departureDate = nil;
        self.arrivalDate = nil;
        self.airlineCode = @"N/A";
        self.flightNumber = @"N/A";
        self.departureCity = @"N/A";
        self.departureAirport = @"N/A";
        self.arrivalCity = @"N/A";
        self.arrivalAirport = @"N/A";
        self.flightDuration = @"0 min";
        self.creationDate = [NSDate date];
        self.updationDate = [NSDate date];
        
        self.trackingNumber = @"N/A";
    }
    return self;
}

-(id)initWithInfo:(NSDictionary*)info
{
    if (self = [super init])
    {
        self.flightID = [info[kFlightID] integerValue];
        self.departureDate = [self formatDate:info[kDepartureDate]];
        self.arrivalDate = [self formatDate:info[kArrivalDate]];
        self.flightNumber = info[kFlightNumber];
        self.airlineCode = info[kAirlineCode];
        self.departureCity = info[kDepartureCity];
        self.departureAirport = info[kDepartureAirport];
        self.arrivalCity = info[kArrivalCity];;
        self.arrivalAirport = info[kArrivalAirport];;
        self.flightDuration = info[kFlightDuration];;
        self.creationDate = [self dateFromString:info[kCreationDate]];
        self.updationDate = [self dateFromString:info[kUpdationDate]];
        
        self.trackingNumber = [NSString stringWithFormat:@"%@-%@",self.airlineCode,self.flightNumber];
    }
    return self;
}

#pragma mark Helper

-(NSString*)formatDate:(NSString*)stringDate
{
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    
    df.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS";
    
    NSDate* d = [df dateFromString:stringDate];
    
    df.dateFormat = @"MMM dd-yyyy hh:mm a";
    
    return [df stringFromDate:d];
}

-(NSString*)dateFromString:(NSString*)stringDate
{
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    
    df.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSXXX";
    
    NSDate* d = [df dateFromString:stringDate];
    
    df.dateFormat = @"MMM dd-yyyy hh:mm a";
    
    return [df stringFromDate:d];
}


@end
