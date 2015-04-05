//
//  Schedule.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 04/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject

@property NSDate *starts;
@property NSDate *ends;
@property NSArray *daysRepeat;
@property NSDate *endRepeat;


@end
