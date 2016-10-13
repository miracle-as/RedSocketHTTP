using System;
using Foundation;

// @interface RedSocketHTTP : NSObject
[BaseType (typeof(NSObject))]
interface RedSocketHTTP
{
	// @property (readonly, nonatomic) NSString * deviceAddress;
	[Export ("deviceAddress")]
	string DeviceAddress { get; }

	// @property (readonly, nonatomic) NSString * gateway;
	[Export ("gateway")]
	string Gateway { get; }

	// @property (readonly, nonatomic) NSString * netmask;
	[Export ("netmask")]
	string Netmask { get; }

	// -(instancetype)initWithIP:(NSString *)ipAddress gateway:(NSString *)gateway netmask:(NSString *)netmask dns:(NSString *)dns;
	[Export ("initWithIP:gateway:netmask:dns:")]
	IntPtr Constructor (string ipAddress, string gateway, string netmask, string dns);
}
