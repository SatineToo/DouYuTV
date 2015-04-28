//
//  GameParse.h
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameParse : NSObject

@property (nonatomic,strong)NSMutableArray * data;
@property (nonatomic,strong)NSNumber * error;

+ (instancetype)parse:(NSDictionary *)responseObj;

@end

@interface GameInfo : NSObject

@property (nonatomic,strong)NSString *gameicon;
@property (nonatomic,strong)NSString *gamename;
@property (nonatomic,strong)NSString *gamesrc;
@property (nonatomic,strong)NSString *gameurl;
@property (nonatomic,strong)NSString *cate_id;

+ (instancetype)parse:(NSDictionary *)infoDic;

@end
