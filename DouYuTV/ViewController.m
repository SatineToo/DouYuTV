//
//  ViewController.m
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import "ViewController.h"
#import "GameNetWork.h"
#import "UIKit+AFNetworking.h"
#import "SecondViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController
{
    GameParse *_parse;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [GameNetWork getAllGamesSuccess:^(GameParse *parse) {
        _parse = parse;
        [_collectionView reloadData];
    } failure:^(NSString *errormessage) {
        NSLog(@"%@",errormessage);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _parse.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gameCell" forIndexPath:indexPath];
    GameInfo *info = _parse.data[indexPath.row];
    UIImageView *iv = (UIImageView *)[cell.contentView viewWithTag:100];
    [iv setImageWithURL:[NSURL URLWithString:info.gameicon]];
    
    UILabel *nameLabel = (UILabel *)[cell.contentView viewWithTag:200];
    nameLabel.text = info.gamename;
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.view.frame.size.width - 8*2 - 10*2)/3;
    CGFloat height = width * 180/110;
    return CGSizeMake(width, height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"1000"]) {//1000代表跳转到房间列表
        SecondViewController *vc = segue.destinationViewController;
        //要知道当前点击的cell他的indexpath
        NSIndexPath *indexpath = [_collectionView indexPathForCell:sender];
        GameInfo *info = _parse.data[indexpath.row];
        vc.cate_id = info.cate_id;
        vc.game_name = info.gamename;
    }
    
}

@end
