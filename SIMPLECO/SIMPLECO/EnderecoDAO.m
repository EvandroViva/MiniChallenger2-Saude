//
//  EnderecoDAO.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "EnderecoDAO.h"

@implementation EnderecoDAO

// SINGLETON
//==========================================================
static EnderecoDAO *SINGLETON = nil;
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
// create
-(void)cadastrarEndereco:(Endereco*)end
{
    
}

// read
-(void)selecionarEndereco:(NSString*)id_end
{
    
}

// update
-(void)alterarEndereco:(Endereco*)end
{
    
}

// delete
-(void)excluirEndereco:(NSString*)id_end
{
    
}

@end
