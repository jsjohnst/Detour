//
//  DetourViewController.m
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

#import "DetourViewController.h"
#import "DetourAppDelegate.h"

@implementation DetourViewController

@synthesize webView,
			urlTextField,
			backButton,
			forwardButton,
			actionButton;
			
- (void) openUrlFromNotification: (id) notification {
	if ([notification userInfo]) {
		[[self webView] loadRequest:[NSURLRequest requestWithURL:[[notification userInfo] valueForKey:@"UIApplicationLaunchOptionsURLKey"]]];	
	}
}

- (IBAction) openURL: (id) sender {
	[[self webView] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[self urlTextField] text]]]];
	[urlTextField resignFirstResponder];
}

- (void) viewDidLoad {
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(openUrlFromNotification:)
												 name:@"UIApplicationDidFinishLaunchingNotification"
											   object:[UIApplication sharedApplication]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)dealloc {
    [super dealloc];
}

#pragma mark - UITextField Delegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	return YES;
}

#pragma mark - UIWebView Delegate Methods
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	;
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Request Failed"
														message:[NSString stringWithFormat:@"Error %i\n%@", [error code],
																											[error localizedDescription]]
													   delegate:nil
											  cancelButtonTitle:@"Close"
											  otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	[[self actionButton] setTitle:@"Go" forState:UIControlStateNormal];
	[[self actionButton] setTitle:@"Go" forState:UIControlStateHighlighted];
}

- (void)webViewDidFinishLoad:(UIWebView *)w {
	[[self urlTextField] setText:[[[w request] URL] absoluteString]];
	[[self actionButton] setTitle:@"Go" forState:UIControlStateNormal];
	[[self actionButton] setTitle:@"Go" forState:UIControlStateHighlighted];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	[[self actionButton] setTitle:@"Stop" forState:UIControlStateNormal];	
	[[self actionButton] setTitle:@"Stop" forState:UIControlStateHighlighted];
}
@end
