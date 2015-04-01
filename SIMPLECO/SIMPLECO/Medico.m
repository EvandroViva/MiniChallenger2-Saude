//
//  Medico.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "Medico.h"

@implementation Medico

static Medico* singleton;
static bool isFirstAccess = YES;

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        singleton = [[Medico alloc]init];
    });
    
    return singleton;
}

-(void)setWithPFObject: (PFObject*) object
{
    self.parseObject = object;
}



@end
