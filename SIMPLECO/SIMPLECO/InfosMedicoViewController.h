//
//  InfosMedicoViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 31/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultPesqTableViewController.h"

@interface InfosMedicoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet UILabel *lblEspecialidade;
@property (weak, nonatomic) IBOutlet UILabel *lblEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lblBairro;
@property (weak, nonatomic) IBOutlet UILabel *lblRegiao;
@property (weak, nonatomic) IBOutlet UILabel *lblCodTrabalho;

@end
