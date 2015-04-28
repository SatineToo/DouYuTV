//
//  GameParse.m
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import "GameParse.h"

@implementation GameParse

+ (instancetype)parse:(NSDictionary *)responseObj
{
    GameParse *parse = [self new];
    
    NSArray *data = [responseObj objectForKey:@"data"];
    [data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [parse.data addObject:[GameInfo parse:obj]];
    }];
    
//    for (NSDictionary *dic in [responseObj objectForKey:@"data"]) {
//        [parse.data addObject:[GameInfo parse:dic]];
//    }
    return parse;
}

- (id)init{
    if (self = [super init]) {
        _data = [NSMutableArray new];
    }
    return self;
}

@end

@implementation GameInfo

+ (instancetype)parse:(NSDictionary *)infoDic
{
    GameInfo *info = [self new];
    info.gameicon = [infoDic objectForKey:@"game_src"];
    info.gamename = [infoDic objectForKey:@"game_name"];
    info.gamesrc = [infoDic objectForKey:@"game_src"];
    info.gameurl = [infoDic objectForKey:@"game_url"];
    info.cate_id = [infoDic objectForKey:@"cate_id"];
    return info;
}

@end
