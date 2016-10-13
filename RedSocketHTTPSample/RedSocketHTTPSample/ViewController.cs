using System;

using UIKit;
using Foundation;
using System.Diagnostics;

namespace RedSocketHTTPSample
{
    public partial class ViewController : UIViewController
    {
        protected ViewController (IntPtr handle) : base (handle)
        {
            // Note: this .ctor should not contain any initialization logic.
        }

        public override void ViewDidLoad ()
        {
            base.ViewDidLoad ();
            // Perform any additional setup after loading the view, typically from a nib.
        }

        public override void DidReceiveMemoryWarning ()
        {
            base.DidReceiveMemoryWarning ();
            // Release any cached data, images, etc that aren't in use.
        }

        private RedSocketHTTP.Bindings.iOS.RedSocketHTTP RedSocketHTTP { get; set; }

        partial void SetupButtonTapped (UIButton sender)
        {
            // Using DHCP:
            // RedSocketHTTP = new RedSocketHTTP.Bindings.iOS.RedSocketHTTP ();

            // Using static IP. DNS can be null if not used.
            RedSocketHTTP = new RedSocketHTTP.Bindings.iOS.RedSocketHTTP (
                ipAddress: "192.168.0.100",
                gateway: "192.168.0.1",
                netmask: "255.255.255.0",
                dns: null
            );
        }

        partial void GetButtonTapped (UIButton sender)
        {
            ResultTextView.Text = "please wait...";

            var urlString = UrlTextField.Text;
            var url = new NSUrl (urlString);

            var session = NSUrlSession.SharedSession;

            var t = session.CreateDataTask(url, ResponseHandler);
            t.Resume ();
        }

        private void ResponseHandler (NSData data, NSUrlResponse response, NSError error)
        {
            if (data == null) 
            {
                Debug.WriteLine ("no data");
                return;
            }

            NSString dataString = NSString.FromData (data, NSStringEncoding.UTF8);
            InvokeOnMainThread (() => {
                ResultTextView.Text = dataString;
            });
        }
    }
}

