//
//  MBProgressHUD+Extension.m
//  CircleExpress
//
//  Created by litt1e-p on 15/9/5.
//  Copyright (c) 2015年 litt1e-p. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

@implementation MBProgressHUD (Extension)

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (HUDStyle == HUDBgStyleDefault) {
        hud.blur = NO;
    }
    hud.labelText = text;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:0.7];
}

+ (void)showError:(NSString *)error toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle
{
    [self show:error icon:@"error.png" view:view HUDStyle:HUDStyle];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle
{
    [self show:success icon:@"success.png" view:view HUDStyle:HUDStyle];
}

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (HUDStyle == HUDBgStyleDefault) {
        hud.blur = NO;
    }
    hud.labelText = message;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MBProgressHUD.bundle/tips.png"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}

+ (void)showPopMessage:(NSString *)message toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle
{
    MBProgressHUD * hud = [self showMessage:message toView:view HUDStyle:HUDStyle];
    [hud hide:YES afterDelay:0.7];
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil HUDStyle:HUDBgStyleDefault];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil HUDStyle:HUDBgStyleDefault];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil HUDStyle:HUDBgStyleDefault];
}

+ (MBProgressHUD *)showLoadingMessage:(NSString *)message toView:(UIView *)view HUDStyle:(HUDBgStyle)HUDStyle
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    if (HUDStyle == HUDBgStyleDefault) {
        hud.blur = NO;
    }
    hud.labelText = message;
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    loadingView.hidesWhenStopped = YES;
    loadingView.color = HUDStyle == HUDBgStyleDefault ? [UIColor whiteColor] : [UIColor blackColor];
    [loadingView startAnimating];
    hud.customView = loadingView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;

    return hud;
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
