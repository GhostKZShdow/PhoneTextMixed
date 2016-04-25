//
//  ViewController.m
//  PhoneTextMixed
//
//  Created by 张坤 on 16/4/25.
//  Copyright © 2016年 KZ. All rights reserved.
//
#import "ViewController.h"

#define screenWidth [[UIScreen mainScreen]bounds].size.width
#define blueColor [UIColor colorWithRed:10/255.0 green:95/255.0 blue:254/255.0 alpha:1.0]

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, screenWidth - 5, 100)];
    [textView.layer setCornerRadius:5];
    [textView.layer setBorderColor:[UIColor blackColor].CGColor];
    [textView.layer setBorderWidth:1];
    textView.center = self.view.center;
    [self.view addSubview:textView];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:@"【GhostKZShadow】尊敬的客户，您的订单（17565716863）已出库发货，正在配送中，配送人员电话：18767876568请您耐心等待。不会以订单无效为由主动要求您提供银行卡信息操作退款，谨防诈骗！如需退订，请回复TD。"];
    [attributeString addAttribute:NSLinkAttributeName value:@"18767876568" range:[[attributeString string]rangeOfString:@"18767876568"]];
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName:blueColor,
                                     NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)};
    textView.linkTextAttributes = linkAttributes;
    textView.attributedText = attributeString;
    [textView setFont:[UIFont systemFontOfSize:15]];
    textView.delegate = self;
    textView.editable = NO;//非编辑状态下可以点击Url
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    NSString *urlString = [NSString stringWithFormat:@"tel:%@",URL];
    NSURL *url = [NSURL URLWithString:urlString];
    UIWebView *webView = [[UIWebView alloc]init];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webView];
    return YES;
}
@end
