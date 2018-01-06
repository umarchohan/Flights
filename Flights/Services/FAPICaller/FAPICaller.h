//
//  FAPICaller.h
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAPICaller : NSObject


+(FAPICaller *)sharedManager;


#pragma mark GetFlightsList

/* Get Flights list */

-(void)getAllFlightswithHandler:(void (^)(NSDictionary* info,BOOL success,NSError* error))completion;

#pragma mark GetFlightDetails

/* Get Flight details */

-(void)getFlightDetailsWithUserID:(NSString*)flightID withHandler:(void (^)(NSDictionary* info,BOOL success,NSError* error))completion;


@end
