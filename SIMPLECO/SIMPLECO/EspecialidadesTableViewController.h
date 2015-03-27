//
//  EspecialidadesTableViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EspecialidadesTableViewCell.h"
#import "ViewController.h"

@interface EspecialidadesTableViewController : UITableViewController


+ (EspecialidadesTableViewController*)sharedInstance;

@property NSArray *listaEspecialidade;
@property NSString *especialidade;

@end
