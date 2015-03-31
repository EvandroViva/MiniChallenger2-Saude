//
//  UserDAO.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 29/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "UserDAO.h"

@implementation UserDAO

+(void)loginWithUsername:(NSString *) username AndPassword:(NSString *) password AndComplete: (void(^)(PFUser*,NSError*)) callback
{
   
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSString *n = user.username;
                                            NSLog(@"%@", n);
                                        } else {
                                            // Log details of the failure
                                            NSLog(@"Error: %@ %@", error, [error userInfo]);
                                        }
                                        callback(user, error);
                                    }];
}

+(void)signinWithUser:(User *)user AndComplete:(void (^)(bool, NSError *))callback
{
    PFUser *pfuser = [PFUser user];
    pfuser.username = [user username];
    pfuser.password = [user password];
    pfuser.email = [user email];
    
    [pfuser setACL:[PFACL ACL]];

    [pfuser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        callback(succeeded, error);
    }];

}

@end
