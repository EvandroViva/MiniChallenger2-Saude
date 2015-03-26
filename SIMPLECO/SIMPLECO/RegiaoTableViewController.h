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


+ (RegiaoTableViewController*)sharedInstance;
@property NSString* regiao;

@end
