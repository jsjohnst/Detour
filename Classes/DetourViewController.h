//
//  DetourViewController.h
//  Detour
//
//  Written by Lowell Vizon on 1/28/10.
//  Copyright cocoastep 2010. All rights reserved.
//	
//	Permission is hereby granted, free of charge, to any person
//	obtaining a copy of this software and associated documentation
//	files (the "Software"), to deal in the Software without
//	restriction, including without limitation the rights to use,
//	copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the
//	Software is furnished to do so, subject to the following
//	conditions:
//
//	The above copyright notice and this permission notice shall be
//	included in all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//	OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//	OTHER DEALINGS IN THE SOFTWARE.

@interface DetourViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate> {
	UIWebView	*webView;
	UITextField	*urlTextField;	
	UIButton	*backButton;
	UIButton	*forwardButton;
	UIButton	*actionButton; // Use for Go, Stop, Reload.
	
	

}

@property (nonatomic, retain) IBOutlet UIWebView	*webView;
@property (nonatomic, retain) IBOutlet UITextField	*urlTextField;
@property (nonatomic, retain) IBOutlet UIButton		*backButton;
@property (nonatomic, retain) IBOutlet UIButton		*forwardButton;
@property (nonatomic, retain) IBOutlet UIButton		*actionButton; 

- (IBAction) openURL: (id) sender;

- (void) openUrlFromNotification: (id) sender;
@end

