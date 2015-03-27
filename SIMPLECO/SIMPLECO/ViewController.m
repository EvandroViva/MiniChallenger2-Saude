//
//  ViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ViewController.h"
#import "RegiaoTableViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize Bespecialidade;
@synthesize Bregiao;
@synthesize BBuscar;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [Bregiao.layer setCornerRadius:5];
    [Bregiao.layer setBorderWidth:2];
    [Bregiao.layer setBorderColor:[UIColor blackColor].CGColor];
    [Bregiao setBackgroundColor:[UIColor whiteColor]];
    
    [Bespecialidade.layer setCornerRadius:5];
    [Bespecialidade.layer setBorderWidth:2];
    [Bespecialidade.layer setBorderColor:[UIColor blackColor].CGColor];
    [Bespecialidade setBackgroundColor:[UIColor whiteColor]];

    [BBuscar.layer setCornerRadius:5];
    [BBuscar.layer setBorderWidth:2];
    [BBuscar.layer setBorderColor:[UIColor blackColor].CGColor];
    [BBuscar setBackgroundColor:[UIColor whiteColor]];
    
   // _LRegiao.text = _regiao;
}

-(void)viewWillAppear:(BOOL)animated
{
//    RegiaoTableViewController* nomeRegiao;
//    nomeRegiao = [RegiaoTableViewController sharedInstance];
//    _LRegiao.text = nomeRegiao.bairro;
    _LRegiao.text = [[RegiaoTableViewController sharedInstance]bairro];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
