//
//  roomParse.m
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import "roomParse.h"

@implementation roomParse

+ (instancetype)parse:(NSDictionary *)responseObj
{
    roomParse *_parse = [self new];
    for (NSDictionary *dic in [responseObj objectForKey:@"data"]) {
        [_parse.data addObject:[roomInfo parse:dic]];
    }
    return _parse;
}
- (id)init{
    if (self = [super init]) {
        _data = [NSMutableArray new];
    }
    return self;
}

@end

@implementation roomInfo

+ (instancetype)parse:(NSDictionary *)infoDic
{
    roomInfo *info = [self new];
    info.game_name = [infoDic objectForKey:@"game_name"];
    info.nickname = [infoDic objectForKey:@"nickname"];
    info.online = [infoDic objectForKey:@"online"];
    info.room_id = [infoDic objectForKey:@"room_id"];
    info.room_name = [infoDic objectForKey:@"room_name"];
    info.room_src = [infoDic objectForKey:@"room_src"];
//    NSLog(@"%@",info.nickname);
    return info;
}

@end

