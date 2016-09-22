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

@property (nonatomic) NSString * deviceAddress;
@property (nonatomic) NSString * gateway;
@property (nonatomic) NSString * netmask;

@end

@implementation RedSocketHTTP

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [NSURLProtocol registerClass:[RedSocketURLProtocol class]];
    
    [[RedSocketManager sharedInstance] setDelegate:self];
    
    // Use DHCP first
    [[RedSocketManager sharedInstance]
     configureNetworkInterface:@"0.0.0.0"
     gateway:@"0.0.0.0"
     netmask:@"0.0.0.0"
     dns:nil];

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
}

// Cable was disconnected and/or application moved to background
- (void)cableDisconnected
{
    NSLog(@"cableDisconnected");
}

// If DHCP client is enabled - this callback is made when ip address is assigned
- (void)didAssignIpAddress:(NSString *)deviceAddress gateway:(NSString *)gateway netmask:(NSString *)netmask
{
    self.deviceAddress = deviceAddress;
    self.gateway = gateway;
    self.netmask = netmask;
    
    NSLog(@"ip address assigned %@ %@ %@", deviceAddress, gateway, netmask);
}


@end
