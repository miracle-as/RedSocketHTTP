using System;

using UIKit;
using Foundation;
using ObjCRuntime;
using CoreGraphics;

namespace RedSocketHTTP.Bindings.iOS
{
    // @interface RedSocketHTTP : NSObject
    [BaseType (typeof (NSObject))]
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
    }
}

