//
//  GameNetWork.h
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "GameParse.h"

@interface GameNetWork : NSObject

+ (void)getAllGamesSuccess:(void(^)(GameParse *parse))success failure:(void(^)(NSString *errormessage))failure;

@end
