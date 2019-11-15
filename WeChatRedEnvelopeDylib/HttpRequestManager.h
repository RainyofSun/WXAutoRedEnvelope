

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^HSResponseSuccessBlock)(NSDictionary *responseObject);
typedef void(^HSResponseFailBlock)(NSError *error);

@interface HttpRequestManager : NSObject

+ (void)getRequest:(NSString *)url reqeustParams:(NSDictionary *)params completeBlock:(HSResponseSuccessBlock)successBlock failtureBlock:(HSResponseFailBlock)fail;
+ (void)postRequest:(NSString *)url requestParams:(NSDictionary *)params completeBlock:(HSResponseSuccessBlock)successBlock failtureBlock:(HSResponseFailBlock)fail;

@end

NS_ASSUME_NONNULL_END
