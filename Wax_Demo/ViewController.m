//
//  ViewController.m
//  Wax_Demo
//
//  Created by Xa_sanLingYI on 15/12/17.
//  Copyright © 2015年 Xa_sanLingYI. All rights reserved.
//

#import "ViewController.h"
#import <wax/wax.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (copy, nonatomic) NSString *filePath;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _filePath = [docPath stringByAppendingPathComponent:@"TestController.lua"];
    self.title = @"原生";
}
- (IBAction)TestPushWax:(id)sender {
    [self getLua];
}
- (IBAction)doing:(id)sender {
    if ([self isEx]) {
        wax_end();
        wax_start("init.lua", nil);
    }else{
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"文件不存在" delegate:nil cancelButtonTitle:@"quxiao" otherButtonTitles:nil, nil];
        [alter show];
    }
}
-(BOOL)isEx{
    return [[NSFileManager defaultManager] fileExistsAtPath:_filePath];
}
-(void)getLua{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    if (![manager fileExistsAtPath:_filePath]) {
        NSString *luaString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://apisimple.sinaapp.com/TestController.lua"] encoding:NSUTF8StringEncoding error:&error];
        [luaString writeToFile:_filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        _textView.text = luaString;
    }else{
        _textView.text = [NSString stringWithContentsOfFile:_filePath encoding:NSUTF8StringEncoding error:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
