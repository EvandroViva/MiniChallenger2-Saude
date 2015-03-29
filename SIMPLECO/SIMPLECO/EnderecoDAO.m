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
    PFObject *endereco = [PFObject objectWithClassName:@"Endereco"];
    endereco[@"endereco"] = end.endereco;
    endereco[@"numero"] = end.numero;
    endereco[@"complemento"] = end.complemento;
    endereco[@"referencia"] = end.referencia;
    endereco[@"bairro"] = end.bairro;
    endereco[@"CEP"] = end.CEP;
    endereco[@"regiao"] = end.regiao;
    // estrangeira
    endereco[@"id_medico"] = end.id_medico;
    [endereco saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Endereco Cadastrado!");
        } else {
            NSLog(@"Erro ao cadastrar Endereco");
        }
    }];
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
