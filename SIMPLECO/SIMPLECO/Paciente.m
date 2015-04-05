//
//  Paciente.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "Paciente.h"


@implementation Paciente

static Paciente* singleton;
static bool isFirstAccess = YES;

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        singleton = [[Paciente alloc]init];
    });
    
    return singleton;
}

-(void)setWithPFObject: (PFObject*) object
{
    self.parseObject = object;
}

@end
