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

@property (weak, nonatomic) IBOutlet UITextField *StreetTextField;
@property (weak, nonatomic) IBOutlet UITextField *NumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *BurghTextField;
@property (weak, nonatomic) IBOutlet UITextField *ZipCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *DistrictTextField;



- (IBAction)StreetDidEnd:(UITextField *)sender;
- (IBAction)NumberDidEnd:(UITextField *)sender;
- (IBAction)BurghDidEnd:(UITextField *)sender;
- (IBAction)ZipCodeDidEnd:(UITextField *)sender;
- (IBAction)DistrictDidEnd:(UITextField *)sender;

- (IBAction)StreetEditingDidEnd:(UITextField *)sender;
- (IBAction)NumberEditingDidEnd:(UITextField *)sender;
- (IBAction)BurghEditingDidEnd:(UITextField *)sender;
- (IBAction)ZipCodeEditingDidEnd:(UITextField *)sender;
- (IBAction)DistrictEditingDidEnd:(UITextField *)sender;


@end
