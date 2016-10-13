//
//  RedSocketHTTP.m
//  RedSocketHTTP
//
//  Created by Nicolai Henriksen on 22/09/16.
//  Copyright © 2016 Miracle. All rights reserved.
//

#import "RedSocketHTTP.h"

#import "RedSocket.h"
#import "RedSocketURLProtocol.h"

// these are for debug purposes and are updated by RedSocketURLProtocol
int g_rxCounter = 0, g_txCounter = 0;

@interface RedSocketHTTP ()
<RedSocketManagerDelegate>

// Make them read-write
@property (nonatomic) NSString * deviceAddress;
@property (nonatomic) NSString * gateway;
@property (nonatomic) NSString * netmask;

@end

@implementation RedSocketHTTP

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupWithIP:@"0.0.0.0"
                  gateway:@"0.0.0.0"
                  netmask:@"0.0.0.0"
                      dns:nil];
    }
    return self;
}

- (void)setupWithIP:(NSString *)ipAddress
            gateway:(NSString *)gateway
            netmask:(NSString *)netmask
                dns:(NSString *)dns
{
    [NSURLProtocol registerClass:[RedSocketURLProtocol class]];
    
    [[RedSocketManager sharedInstance] setDelegate:self];
    
    // Use DHCP first
    [[RedSocketManager sharedInstance]
     configureNetworkInterface:ipAddress
     gateway:gateway
     netmask:netmask
     dns:dns];
}

- (instancetype)initWithIP:(NSString *)ipAddress
                   gateway:(NSString *)gateway
                   netmask:(NSString *)netmask
                       dns:(NSString *)dns
{
    self = [super init];
    if (self) {
        [self setupWithIP:ipAddress
                  gateway:gateway
                  netmask:netmask
                      dns:dns];
    }
    return self;
}

//g_rxCounter = 0;
//g_txCounter = 0;
//[[RedSocketManager sharedInstance] resetRxCounter];

#pragma - RedSocketManagerDelegate

// Cable was connected
- (void)cableConnected:(NSString *)protocol;
{
    NSLog(@"cableConnected");
    
    NSString * fwVersion = [[RedSocketManager sharedInstance] getAccessoryFirmwareVersion];
    NSLog(@"RedSocket firmware version = %@", fwVersion);
    
    NSNotificationName notificationName = @"RedSocketHTTPCableConnectedNotification";
    [[NSNotificationCenter defaultCenter]
     postNotificationName:notificationName
     object:nil
     userInfo:nil];
}

// Cable was disconnected and/or application moved to background
- (void)cableDisconnected
{
    NSLog(@"cableDisconnected");

    NSNotificationName notificationName = @"RedSocketHTTPCableDisconnectedNotification";
    [[NSNotificationCenter defaultCenter]
     postNotificationName:notificationName
     object:nil
     userInfo:nil];
}

// If DHCP client is enabled - this callback is made when ip address is assigned
- (void)didAssignIpAddress:(NSString *)deviceAddress gateway:(NSString *)gateway netmask:(NSString *)netmask
{
    self.deviceAddress = deviceAddress;
    self.gateway = gateway;
    self.netmask = netmask;
    
    NSLog(@"ip address assigned %@ %@ %@", deviceAddress, gateway, netmask);
    
    NSNotificationName notificationName = @"RedSocketHTTPDidAssignIpAddressNotification";
    [[NSNotificationCenter defaultCenter]
     postNotificationName:notificationName
     object:nil
     userInfo:nil];
}


@end
