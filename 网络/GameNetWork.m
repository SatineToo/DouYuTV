//
//  GameNetWork.m
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import "GameNetWork.h"

@implementation GameNetWork

//http://www.douyutv.com/api/v1/game?client_sys=ios&aid=ios&time=1429754530&auth=9d1b35f035aea18212baac0d720ffa68

+ (void)getAllGamesSuccess:(void (^)(GameParse *))success failure:(void (^)(NSString *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:@"http://www.douyutv.com/api/v1/game" parameters:@{@"client_sys":@"ios",@"aid":@"ios",@"time":@"1429754530",@"auth":@"9d1b35f035aea18212baac0d720ffa68"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([GameParse parse:responseObject]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error.localizedDescription);
    }];
    
}

@end
