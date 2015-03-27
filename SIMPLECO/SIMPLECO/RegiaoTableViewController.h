//
//  RegiaoTableViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegiaoTableViewCell.h"
#import "ViewController.h"

@interface RegiaoTableViewController : UITableViewController

// SINGLETON
+ (RegiaoTableViewController*)sharedInstance;

@property NSArray* bairrosNorte;
@property NSArray* bairrosSul;
@property NSArray* bairrosLeste;
@property NSArray* bairrosOeste;

@property NSString* regiao;
@property NSString* bairro;

@end
