//
//  Patient.m
//  MiniChallenger2-Saude
//
//  Created by Liliane Bezerra Lima on 05/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "Patient.h"

@implementation Patient

static Patient* singleton;
static bool isFirstAccess = YES;

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        singleton = [[Patient alloc]init];
    });
    
    return singleton;
}

-(void)setWithPFObject: (PFObject*) object
{
    self.parseObject = object;
}

@end
