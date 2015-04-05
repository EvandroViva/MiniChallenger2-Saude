//
//  SpecialtyTableViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 31/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Medico.h"

@protocol DismissPopoverDelegate
- (void) dismissPopover;
@end


@interface SpecialtyTableViewController : UITableViewController <UIPopoverControllerDelegate>
{
    id<DismissPopoverDelegate> delegate;
}

@property (nonatomic, assign) id<DismissPopoverDelegate> delegate;

@property NSArray* especialidades;
@property NSString* especialidadeSelecionada;

+ (SpecialtyTableViewController*)sharedInstance;

@end
