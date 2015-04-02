//
//  SpecialtyTableViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 31/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompleteRegisterViewController.h"


@interface SpecialtyTableViewController : UITableViewController

@property NSArray* especialidades;
@property NSString* especialidadeSelecionada;

+ (SpecialtyTableViewController*)sharedInstance;

@end
