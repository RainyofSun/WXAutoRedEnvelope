

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface alertView : UIView

+ (void)showToast:(NSString *)toast;

@end

@interface AlertManager : NSObject

+ (void)showAlert:(UIViewController *)vc completeBlock:(void(^)(BOOL success))complete;

@end

NS_ASSUME_NONNULL_END
