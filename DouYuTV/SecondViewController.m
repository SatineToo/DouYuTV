//
//  SecondViewController.m
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import "SecondViewController.h"
#import "roomParse.h"
#import "AFnetwork.h"
#import "UIKit+AFNetworking.h"

@interface SecondViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SecondViewController
{
    roomParse *_parse;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [AFnetwork getAllRoomListSuccess:^(roomParse *parse) {
        _parse = parse;
        [_collectionView reloadData];
    } failure:^(NSString *errormassage) {
        NSLog(@"%@",errormassage);
    } withId:self.cate_id];
    self.navigationItem.title = self.game_name;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _parse.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondCell" forIndexPath:indexPath];
    roomInfo *info = _parse.data[indexPath.row];
    self.navigationController.title = info.game_name;
    
    UIImageView *bigView = (UIImageView *)[cell.contentView viewWithTag:102];
    [bigView setImageWithURL:[NSURL URLWithString:info.room_src]];
    
    UILabel *rnameLabel = (UILabel *)[cell.contentView viewWithTag:200];
    rnameLabel.text = info.room_name;
    UILabel *nknameLabel = (UILabel *)[cell.contentView viewWithTag:201];
    nknameLabel.text = info.nickname;
    UILabel *onlineLabel = (UILabel *)[cell.contentView viewWithTag:202];
    onlineLabel.text = [NSString stringWithFormat:@"%.1f万",info.online.floatValue/1000];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.view.frame.size.width - 10*2 - 30)/2;
    CGFloat height = width * 147/175;
    return CGSizeMake(width, height);
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
