//
//  MedicoController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "MedicoController.h"

@implementation MedicoController

// SINGLETON
//==========================================================
static MedicoController *SINGLETON = nil;
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


#pragma mark - Buscar Medicos
//========================================================
-(void)buscarMedicos:(NSString*)especialidade andRegiao:(NSString*)regiao AndComplete: (void(^)(void)) callback;
{    
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    [query whereKey:@"especialidade" equalTo:especialidade];
    [query whereKey:@"regiao" equalTo:regiao];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                Medico* medico = [[Medico alloc]init];
                medico.objectID = object[@"objectId"];
                medico.nome = object[@"nome"];
                medico.codTrabalho = object[@"codTrabalho"];
                medico.especialidade = object[@"especialidade"];
                medico.endereco = object[@"endereco"];
                medico.numero = object[@"numero"];
                medico.CEP = object[@"CEP"];
                medico.bairro = object[@"bairro"];
                medico.regiao = object[@"regiao"];
                // estrangeira
                medico.id_tipoConsulta = object[@"id_tipoConsulta"];
                
                NSLog(@"nome: %@", medico.nome);
                NSLog(@"endereco: %@", medico.endereco);
                NSLog(@"bairro: %@", medico.bairro);
                
                [[[ResultPesqTableViewController sharedInstance]medicos] addObject:medico];
                NSLog(@"Qtd : %lu",(unsigned long)[[[ResultPesqTableViewController sharedInstance]medicos]count]);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        callback();
    }];    
}

//========================================================
//Busca especialidade
//=======================================================

-(void)buscarEspecialidade:(NSString*)bairro AndComplete:(void(^)(NSArray*)) callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    if (bairro == nil)
    {
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            NSMutableArray *especialidade = [[NSMutableArray alloc]init];
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
                // Do something with the found objects
                for (PFObject *object in objects)
                {
                    [especialidade addObject:object[@"especialidade"]];
                }
            }
            else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            callback(especialidade);
        }];
    }
    
    else
    {
        [query whereKey:@"regiao" equalTo:bairro];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            NSMutableArray *especialidade = [[NSMutableArray alloc]init];
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
                // Do something with the found objects
                for (PFObject *object in objects)
                {
                    [especialidade addObject:object[@"regiao"]];
                }
            }
            else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            callback(especialidade);
        }];
    }
}
//========================================================
//Busca Bairro
//=======================================================

-(void)buscarBairro:(NSString*)especialidade AndComplete:(void(^)(NSArray*)) callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    if (especialidade == nil)
    {
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            NSMutableArray *bairros = [[NSMutableArray alloc]init];
            if (!error) {
                // The find succeeded.
                NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
                // Do something with the found objects
                for (PFObject *object in objects)
                {
                    [bairros addObject:object[@"regiao"]];
                }
            }
            else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            callback(bairros);
        }];
    }
    
    else
    {
      [query whereKey:@"especialidade" equalTo:especialidade];
      [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSMutableArray *bairros = [[NSMutableArray alloc]init];
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects)
            {
                [bairros addObject:object[@"regiao"]];
            }
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
            callback(bairros);
    }];
    }
}
@end
