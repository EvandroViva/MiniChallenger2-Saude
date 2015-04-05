//
//  InfosMedicoViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 31/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "InfosMedicoViewController.h"

@interface InfosMedicoViewController ()
{
    ResultPesqTableViewController *medSelecionado;
}

@end

@implementation InfosMedicoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    medSelecionado = [ResultPesqTableViewController sharedInstance];
    NSLog(@"Nome = %@",medSelecionado.medicoSelecionado.nome);
    _lblEndereco.text = medSelecionado.medicoSelecionado.endereco;
    _lblBairro.text = medSelecionado.medicoSelecionado.bairro;
    _lblEspecialidade.text = medSelecionado.medicoSelecionado.especialidade;
    _lblRegiao.text = medSelecionado.medicoSelecionado.regiao;
    _lblNome.text = medSelecionado.medicoSelecionado.nome;
    _lblCodTrabalho.text = medSelecionado.medicoSelecionado.codTrabalho;
    
    CAGradientLayer *background = [CAGradientLayer layer];
    background.colors = @[(id)[UIColor colorWithRed:228/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:148/255.0 green:238/255.0 blue:255/255.0 alpha:1.0].CGColor];
    background.locations = @[@0.2,@1.0];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view.layer insertSublayer:background atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {R
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
