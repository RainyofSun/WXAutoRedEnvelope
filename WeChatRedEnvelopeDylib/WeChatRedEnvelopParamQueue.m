


#import "WeChatRedEnvelopParamQueue.h"

@interface WeChatRedEnvelopParamQueue ()
@property (strong, nonatomic)NSMutableArray* queue;
@end

@implementation WeChatRedEnvelopParamQueue

+ (instancetype)sharedQueue{
    static WeChatRedEnvelopParamQueue* queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[WeChatRedEnvelopParamQueue alloc] init];
    });
    
    return queue;
}

- (instancetype) init{
    if(self = [super init]){
        _queue = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)enqueue:(NSMutableDictionary*) param{
    [self.queue addObject:param];
}

- (NSMutableDictionary*)dequeue{
    if(0 == self.queue.count && !self.queue.firstObject)
        return nil;
    
    NSMutableDictionary* first = self.queue.firstObject;
    
    [self.queue removeObjectAtIndex:0];
    
    return first;
}

@end

