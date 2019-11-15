


#import <Foundation/Foundation.h>


@interface WeChatRedEnvelopParamQueue : NSObject

+ (instancetype) sharedQueue;
- (void)enqueue:(NSMutableDictionary*)param;
- (NSMutableDictionary*)dequeue;
@end

