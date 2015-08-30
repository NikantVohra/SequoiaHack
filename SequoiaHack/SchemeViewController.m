//
//  SchemeViewController.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 30/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "SchemeViewController.h"

@interface SchemeViewController()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation SchemeViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.scalesPageToFit = YES;
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://agricoop.nic.in/imagedefault/droughtmanagement/Programmes%20&%20Schemes%20of%20Drought%20Management.pdf"]];
    self.webView.delegate = self;
    [self.webView loadRequest:requestObj];
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.spinner setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)];
    [self.webView addSubview:self.spinner];
    
    [self.spinner startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
    [self.spinner removeFromSuperview];
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.querySelector('meta[name=viewport]').setAttribute('content', 'width=%d;', false); ", (int)webView.frame.size.width]];
}



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = NSLocalizedString(@"Government Schemes", nil);
    
    
}
@end
