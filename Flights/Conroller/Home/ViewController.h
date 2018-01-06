//
//  ViewController.h
//  Flights
//
//  Created by Umar Afzal on 1/6/18.
//  Copyright © 2018 Umar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *flightTable;

@end

