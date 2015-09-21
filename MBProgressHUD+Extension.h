//
//  MBProgressHUD+Extension.h
//  CircleExpress
//
//  Created by litt1e-p on 15/9/5.
//  Copyright (c) 2015年 litt1e-p. All rights reserved.
//

#import "MBProgressHUD.h"

typedef enum {
    HUDBgStyleDefault, //black background
    HUDBgStyleBlur //blur and light background
} HUDBgStyle;

@interface MBProgressHUD (Extension)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle;
+ (void)showError:(NSString *)error toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle;

/**
 example:
 MBProgressHUD *hud = [MBProgressHUD showMessage:@"hello world" toView:self.view HUDStyle:HUDBgStyleDefault];
 [hud hide:YES afterDelay:1.f];
 */
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle;
+ (void)showPopMessage:(NSString *)message toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
