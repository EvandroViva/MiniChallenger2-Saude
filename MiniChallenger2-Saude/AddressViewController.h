//
//  AddressViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 04/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Medico.h"

@interface AddressViewController : UIViewController

- (IBAction)StreetDidEnd:(UITextField *)sender;
- (IBAction)NumberDidEnd:(UITextField *)sender;
- (IBAction)BurghDidEnd:(UITextField *)sender;
- (IBAction)CEPDidEnd:(UITextField *)sender;
- (IBAction)DistrictDidEnd:(UITextField *)sender;

@end
