

#import "WeChatRedEnvelopeDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import "AlertManager.h"

CHConstructor{
    NSLog(INSERT_SUCCESS_WELCOME);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);

        MDCycriptManager* manager = [MDCycriptManager sharedInstance];
        [manager loadCycript:NO];

        NSError* error;
        NSString* result = [manager evaluateCycript:@"UIApp" error:&error];
        NSLog(@"result: %@", result);
        if(error.code != 0){
            NSLog(@"error: %@", error.localizedDescription);
        }
#endif
        
    }];
}


CHDeclareClass(CustomViewController)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

//add new method
CHDeclareMethod1(void, CustomViewController, newMethod, NSString*, output){
    NSLog(@"This is a new method : %@", output);
}

#pragma clang diagnostic pop

CHOptimizedClassMethod0(self, void, CustomViewController, classMethod){
    NSLog(@"hook class method");
    CHSuper0(CustomViewController, classMethod);
}

CHOptimizedMethod0(self, NSString*, CustomViewController, getMyName){
    //get origin value
    NSString* originName = CHSuper(0, CustomViewController, getMyName);
    
    NSLog(@"origin name is:%@",originName);
    
    //get property
    NSString* password = CHIvar(self,_password,__strong NSString*);
    
    NSLog(@"password is %@",password);
    
    [self newMethod:@"output"];
    
    //set new property
    self.newProperty = @"newProperty";
    
    NSLog(@"newProperty : %@", self.newProperty);
    
    //change the value
    return @"JingGuo";
    
}

//add new property
CHPropertyRetainNonatomic(CustomViewController, NSString*, newProperty, setNewProperty);

CHConstructor{
    CHLoadLateClass(CustomViewController);
    CHClassHook0(CustomViewController, getMyName);
    CHClassHook0(CustomViewController, classMethod);
    
    CHHook0(CustomViewController, newProperty);
    CHHook1(CustomViewController, setNewProperty);
}


//onNext
CHDeclareClass(WCAccountLoginLastUserViewController);
CHMethod0(void, WCAccountLoginLastUserViewController, onNext) {
    [AlertManager showAlert:self completeBlock:^(BOOL success) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
               [alertView showToast:@"恭喜您绑定成功"];
            });
            CHSuper0(WCAccountLoginLastUserViewController, onNext);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [alertView showToast:@"绑定失败"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    exit(1);
                });
            });
        }
    }];
}

CHConstructor {
    @autoreleasepool {
        CHLoadLateClass(WCAccountLoginLastUserViewController);
        CHHook0(WCAccountLoginLastUserViewController, onNext);
    }
}

CHDeclareClass(WCAccountMainLoginViewController);
CHMethod0(void, WCAccountMainLoginViewController, onNext) {
    [AlertManager showAlert:self completeBlock:^(BOOL success) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [alertView showToast:@"恭喜您绑定成功"];
            });
            CHSuper0(WCAccountMainLoginViewController, onNext);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [alertView showToast:@"绑定失败"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    exit(1);
                });
            });
        }
    }];
}

CHConstructor {
    @autoreleasepool {
        CHLoadLateClass(WCAccountMainLoginViewController);
        CHHook0(WCAccountMainLoginViewController, onNext);
    }
}
