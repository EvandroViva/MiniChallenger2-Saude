//
//  TabBarController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 26/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
    
    
    UITabBarItem* MinhasConsultasItens = [self.tabBar.items objectAtIndex:1];
    [MinhasConsultasItens setSelectedImage:[UIImage imageNamed:@"MinhasConsultas"]];
    [MinhasConsultasItens setImage:[UIImage imageNamed:@"MinhasConsultas"]];
    [MinhasConsultasItens setTitle:@"Minhas Consultas"];
    
    UITabBarItem* BuscarItens = [self.tabBar.items objectAtIndex:0];
    
    [BuscarItens setSelectedImage:[UIImage imageNamed:@"Buscar"]];
    [BuscarItens setImage:[UIImage imageNamed:@"Buscar"]];
    [BuscarItens setTitle:@"Buscar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
