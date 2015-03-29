

//
//  MedicoDAO.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "MedicoDAO.h"
#import <Parse/Parse.h>

@implementation MedicoDAO

// SINGLETON
//==========================================================
static MedicoDAO *SINGLETON = nil;
static bool isFirstAccess = YES;

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}
//==========================================================


// CRUD
#pragma mark add
+(void)addMedico:(Medico*)med
{
    
}


#pragma mark FIND

+(Medico*)getMedico:(NSString*)id_med
{
    Medico *doctor = [[Medico alloc] init];
    return doctor;
}

+(NSArray*)getMedicosByName:(NSString*)name_med
{
    __block NSMutableArray *doctors = [[NSMutableArray alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    [query whereKey:@"nome" equalTo:name_med];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSString *n = object[@"nome"];
                NSLog(@"%@", n);
                Medico *doctor = [[Medico alloc] initWithPFObject:object];
                [doctors addObject:doctor];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    return doctors;
}

+(Medico*)getMedicoByEmail:(NSString *)email_med
{
    __block Medico *doctor = [[Medico alloc] init];
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    [query whereKey:@"nome" equalTo:email_med];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSString *n = object[@"nome"];
                NSLog(@"%@", n);
                doctor = [[Medico alloc] initWithPFObject:object];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    return doctor;
}
+(void)getMedicoByEmail:(NSString *)email_med AndPassword:(NSString *)password AndComplete: (void(^)(Medico*)) callback;
{
    __block Medico *doctor = nil;
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    [query whereKey:@"email" equalTo:email_med];
    [query whereKey:@"password" equalTo:password];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSString *n = object[@"nome"];
                NSLog(@"%@", n);
                doctor = [[Medico alloc] initWithPFObject:object];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        callback(doctor);
    }];
}

#pragma mark UPDATE
+(void)updateMedico:(Medico*)med
{
    
}

#pragma mark DELETE
+(void)deleteMedico:(NSString*)id_med
{
    
}
@end
