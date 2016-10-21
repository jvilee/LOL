//
//  ViewController.m
//  LOL
//
//  Created by jvilee on 16/7/31.
//  Copyright © 2016年 me. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"
@interface ViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray *heros;

@end

@implementation ViewController
//懒加载
- (NSArray *)heros{
    if (!_heros) {
        
    NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            Hero *hero = [Hero heroWithDict:dict];
            
            [arrayM addObject:hero];
        }
        _heros = [arrayM copy];
        
    }
    return  _heros;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.heros.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"heroCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    Hero *hero = self.heros[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return cell;
    
}




@end
