//
//  AFnetwork.m
//  DouYuTV
//
//  Created by cyt on 15/4/23.
//  Copyright (c) 2015年 cyt. All rights reserved.
//

#import "AFnetwork.h"

@implementation AFnetwork

+ (void)getAllRoomListSuccess:(void (^)(roomParse *))success failure:(void (^)(NSString *))failure withId:(NSString *)cateid
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //http://www.douyutv.com/api/v1/live/1?offset=0&limit=20&client_sys=ios&aid=ios&time=1429776392&auth=87f49c65fa5122d5bbf65bdc7c7c89dd
    
    [manager GET:[NSString stringWithFormat:@"http://www.douyutv.com/api/v1/live/%@",cateid] parameters:@{@"offset":@"0",@"limit":@"20",@"client_sys":@"ios",@"aid":@"ios",@"time":@"1429776392",@"auth":@"87f49c65fa5122d5bbf65bdc7c7c89dd"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([roomParse parse:responseObject]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error.localizedDescription);
    }];
}

@end
