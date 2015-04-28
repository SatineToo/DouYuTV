//
//  AFnetwork.h
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "roomParse.h"
#import "AFNetworking.h"

@interface AFnetwork : NSObject

+ (void)getAllRoomListSuccess:(void(^)(roomParse *parse))success failure:(void(^)(NSString *errormassage))failure withId:(NSString *)cateid;

@end
