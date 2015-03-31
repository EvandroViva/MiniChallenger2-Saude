//
//  ResultPesqTableViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultPesqTableViewCell.h"
#import "MedicoController.h"
#import "ViewController.h"


@interface ResultPesqTableViewController : UITableViewController
@property NSInteger index;
@property NSMutableArray *medicos;

+ (ResultPesqTableViewController*)sharedInstance;

@end
