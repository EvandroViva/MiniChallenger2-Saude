//
//  UserDAO.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 29/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "User.h"

@interface UserDAO : NSObject

+(void)loginWithUsername:(NSString *) username AndPassword:(NSString *) password AndComplete: (void(^)(PFUser*, NSError*)) callback;

+(void)signinWithUser:(User*) user AndComplete: (void(^)(bool,NSError*)) callback;

@end
