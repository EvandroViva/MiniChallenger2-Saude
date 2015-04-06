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
@property (weak, nonatomic) IBOutlet UITextField *street;
@property (weak, nonatomic) IBOutlet UITextField *number;
@property (weak, nonatomic) IBOutlet UITextField *burgh;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;
@property (weak, nonatomic) IBOutlet UITextField *district;

@end
