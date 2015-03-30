//
//  UsuarioDAO.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 30/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "UsuarioDAO.h"

@implementation UsuarioDAO



+(void)signinWithUser:(Usuario*) user AndComplete: (void(^)(bool,NSError*)) callback
{
    PFUser *pfuser = [PFUser user];
    pfuser.username = [user usuario];
    pfuser.password = [user senha];
    pfuser.email = [user email];
    
    [pfuser setACL:[PFACL ACL]];
    
    [pfuser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        callback(succeeded, error);
    }];

}



@end



