//
//  RedSocketHTTP.h
//  RedSocketHTTP
//
//  Created by Nicolai Henriksen on 22/09/16.
//  Copyright © 2016 Miracle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedSocketHTTP : NSObject

@property (nonatomic, readonly) NSString * deviceAddress;
@property (nonatomic, readonly) NSString * gateway;
@property (nonatomic, readonly) NSString * netmask;

- (instancetype)init;
- (instancetype)initWithIP:(NSString *)ipAddress
                   gateway:(NSString *)gateway
                   netmask:(NSString *)netmask
                       dns:(NSString *)dns;

@end
