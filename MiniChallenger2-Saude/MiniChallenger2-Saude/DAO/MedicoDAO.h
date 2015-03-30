//
//  MedicoDAO.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Medico.h"

@interface MedicoDAO : NSObject

// SINGLETON
+ (MedicoDAO*)sharedInstance;

// CRUD
// create
+(void)addMedico:(Medico*)med;

// read
+(void)getMedicoByPFUser:(PFUser*) pfuser AndComplete: (void(^)(Medico*, NSError*)) callback;


// update
+(void)updateMedico:(Medico*)med;

// delete
+(void)deleteMedico:(NSString*)id_med;
@end
