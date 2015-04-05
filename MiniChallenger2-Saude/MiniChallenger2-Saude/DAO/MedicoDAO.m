

//
//  MedicoDAO.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "MedicoDAO.h"

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


#pragma mark GET

+(void)getMedicoByPFUser:(PFUser*) pfuser AndComplete: (void(^)(NSError*)) callback;
{
    
}

//+(void)getMedicoByEspecializacao:(NSString *) pfuser AndRegiao:(NSString*) AndComplete: (void(^)(Medico*, NSError*)) callback{
//    PFRelation *relation = [pfuser relationForKey:@"doctor"];
//    [[relation query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        NSLog(@"%lu", (unsigned long)[objects count]);
//        Medico *medico = nil;
//        if ([objects count] > 0) {
//            medico = [[Medico alloc] initWithPFObject:objects[0]];
//        }
//        NSString* especi=medico.especialidade;
//        NSString* endere=medico.id_Endereco;
//        
//        
//        callback(medico, error);
//    }];
//}

#pragma mark UPDATE
+(void)updateMedico:(Medico*)med
{
    
}

#pragma mark DELETE
+(void)deleteMedico:(NSString*)id_med
{
    
}
@end
