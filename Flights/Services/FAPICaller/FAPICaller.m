//
//  FAPICaller.m
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import "FAPICaller.h"
#import <AFNetworking.h>

@implementation FAPICaller

static NSString* const BASE_URL = @"https://glacial-caverns-15124.herokuapp.com/flights";

+(FAPICaller *)sharedManager
{
    static FAPICaller *sharedManager = nil;
    if (sharedManager == nil)
    {
        sharedManager = [[FAPICaller alloc] init];
    }
    return sharedManager;
}

#pragma mark GetFlightsList

/* Get Flights list */

-(void)getAllFlightswithHandler:(void (^)(NSDictionary* info,BOOL success,NSError* error))completion
{
    __block BOOL success = NO;
    
    NSString *reqURL = [NSString stringWithFormat:@"%@/all",BASE_URL];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:reqURL parameters:nil error:nil];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error)
        {
            
            if ([responseObject isKindOfClass:[NSArray class]])
            {
                success = YES;
                error = nil;
                completion(responseObject,success,error);
            }
        }
        else
        {
            completion(nil,success,error);
        }
    }] resume];
    
   
}

#pragma mark GetFlightDetails

/* Get Flight details */

-(void)getFlightDetailsWithUserID:(NSString*)flightID withHandler:(void (^)(NSDictionary* info,BOOL success,NSError* error))completion
{
    __block BOOL success = NO;
    
    NSString *reqURL = [NSString stringWithFormat:@"%@/%@",BASE_URL,flightID];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:reqURL parameters:nil error:nil];
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error)
        {
            NSLog(@"Reply JSON: %@", responseObject);
            
            if ([responseObject isKindOfClass:[NSDictionary class]])
            {
                success = YES;
                error = nil;
                completion(responseObject,success,error);
            }
        }
        else
        {
            completion(responseObject,success,error);
        }
    }] resume];
}


@end
