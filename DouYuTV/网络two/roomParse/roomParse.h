//
//  roomParse.h
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface roomParse : NSObject

+ (instancetype)parse:(NSDictionary *)responseObj;
@property (nonatomic,strong)NSMutableArray *data;
@property (nonatomic,strong)NSNumber *error;

@end

@interface roomInfo : NSObject

+ (instancetype)parse:(NSDictionary *)infoDic;
//@property (nonatomic,strong)NSString *cate_id;
@property (nonatomic,strong)NSString *room_name;
@property (nonatomic,strong)NSString *room_id;
@property (nonatomic,strong)NSString *room_src;
@property (nonatomic,strong)NSString *game_name;
@property (nonatomic,strong)NSString *nickname;
@property (nonatomic,strong)NSString *online;

@end
