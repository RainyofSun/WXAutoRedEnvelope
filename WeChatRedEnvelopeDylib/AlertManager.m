

#import "AlertManager.h"
#import "HttpRequestManager.h"

@implementation alertView

+ (void)showToast:(NSString *)toast {
    alertView *toastView = [[alertView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    toastView.center = [UIApplication sharedApplication].keyWindow.center;
    toastView.backgroundColor = [UIColor blackColor];
    toastView.layer.cornerRadius = 5.f;
    toastView.clipsToBounds = YES;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, toastView.frame.size.width, 20)];
    textLabel.text = toast;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    [toastView addSubview:textLabel];
    
    [[UIApplication sharedApplication].keyWindow addSubview:toastView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            toastView.alpha = 0;
        } completion:^(BOOL finished) {
           [toastView removeFromSuperview];
        }];
    });
}

@end

@implementation AlertManager

+ (void)addAlert:(UIViewController * _Nonnull)vc deviceId:(NSString *)uuidStr completeBlock:(void (^)(BOOL))complete {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入授权码";
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"输入打的问题 %@ UUID: %@",alertVC.textFields.firstObject.text,uuidStr);
        if (alertVC.textFields.firstObject.text.length) {
            [self bindDeviceId:uuidStr authCode:alertVC.textFields.firstObject.text complete:complete];
        }
    }];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        exit(1);
    }];
    [alertVC addAction:cancleAction];
    [alertVC addAction:sureAction];
    [vc presentViewController:alertVC animated:YES completion:nil];
}

+ (void)showAlert:(UIViewController *)vc completeBlock:(void (^)(BOOL))complete {
    NSString *uuidStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [self queryDeviceIdIsBinded:uuidStr complete:^(BOOL isBinded) {
        if (!isBinded) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self addAlert:vc deviceId:uuidStr completeBlock:complete];
            });
        } else {
            if (complete) {
                complete(YES);
            }
        }
    }];
}

+ (void)queryDeviceIdIsBinded:(NSString *)deviceId complete:(void(^)(BOOL isBinded))completeBlock {
    [HttpRequestManager getRequest:@"validateDeviceId" reqeustParams:@{@"deviceId":deviceId} completeBlock:^(NSDictionary * _Nonnull responseObject) {
        if (completeBlock) {
            completeBlock([[responseObject objectForKey:@"code"] intValue] == 0);
        }
    } failtureBlock:^(NSError * _Nonnull error) {
        if (completeBlock) {
            completeBlock(NO);
        }
    }];
}

+ (void)bindDeviceId:(NSString *)deviceId authCode:(NSString *)code complete:(void(^)(BOOL success))complete {
    [HttpRequestManager getRequest:@"bindCode" reqeustParams:@{@"id":code,@"deviceId":deviceId} completeBlock:^(NSDictionary * _Nonnull responseObject) {
        if (responseObject) {
            if (complete) {
                complete([[responseObject objectForKey:@"code"] intValue] == 0);
            }
        } else {
            if (complete) {
                complete(NO);
            }
        }
    } failtureBlock:^(NSError * _Nonnull error) {
        if (complete) {
            complete(NO);
        }
    }];
}

@end
