//
//  User.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 29/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : NSObject

@property NSString* username;
@property NSString* email;
@property NSString* password;

//-(instancetype)initWithPFUser:(PFUser*) pfuser;

@end
