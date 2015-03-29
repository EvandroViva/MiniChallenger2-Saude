//
//  EnderecoDAO.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Endereco.h"
#import <Parse/Parse.h>

@interface EnderecoDAO : NSObject

// SINGLETON
+ (EnderecoDAO*)sharedInstance;

// CRUD
// create
-(void)cadastrarEndereco:(Endereco*)end;

// read
-(void)selecionarEndereco:(NSString*)id_end;

// update
-(void)alterarEndereco:(Endereco*)end;

// delete
-(void)excluirEndereco:(NSString*)id_end;

@end
