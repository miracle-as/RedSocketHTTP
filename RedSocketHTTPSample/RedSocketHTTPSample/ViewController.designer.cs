// WARNING
//
// This file has been generated automatically by Xamarin Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;
using UIKit;

namespace RedSocketHTTPSample
{
    [Register ("ViewController")]
    partial class ViewController
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton GetButton { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextView ResultTextView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton SetupButton { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView topView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField UrlTextField { get; set; }

        [Action ("GetButtonTapped:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void GetButtonTapped (UIKit.UIButton sender);

        [Action ("SetupButtonTapped:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void SetupButtonTapped (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (GetButton != null) {
                GetButton.Dispose ();
                GetButton = null;
            }

            if (ResultTextView != null) {
                ResultTextView.Dispose ();
                ResultTextView = null;
            }

            if (SetupButton != null) {
                SetupButton.Dispose ();
                SetupButton = null;
            }

            if (topView != null) {
                topView.Dispose ();
                topView = null;
            }

            if (UrlTextField != null) {
                UrlTextField.Dispose ();
                UrlTextField = null;
            }
        }
    }
}