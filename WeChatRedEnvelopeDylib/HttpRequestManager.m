

#import "HttpRequestManager.h"

static NSString *relativeUrl = @"http://103.116.120.27:8081/thinkit_spk/mobile/hbcode/";
NSInteger const Interval = 3;

@implementation HttpRequestManager

+ (void)getRequest:(NSString *)url reqeustParams:(NSDictionary *)params completeBlock:(nonnull HSResponseSuccessBlock)successBlock failtureBlock:(nonnull HSResponseFailBlock)fail {
    [self GetRequestHTTPMethod:@"GET" relativePath:url params:params successBlock:successBlock failBlock:fail];
}

+ (void)postRequest:(NSString *)url requestParams:(NSDictionary *)params completeBlock:(nonnull HSResponseSuccessBlock)successBlock failtureBlock:(nonnull HSResponseFailBlock)fail {
    [self PostRequestHTTPMethod:@"POST" relativePath:url params:params successBlock:successBlock failBlock:fail];
}

+ (void)GetRequestHTTPMethod:(NSString *)httpMenthod relativePath:(NSString *)relativePath params:(NSDictionary *)params successBlock:(HSResponseSuccessBlock)successBlock failBlock:(HSResponseFailBlock)failBlock {
    NSString *url = [NSString stringWithFormat:@"%@%@?",relativeUrl,relativePath];
    //完整URL
    NSString *urlString = [NSString string];
    if (params) {
        //参数拼接url
        NSString *paramStr = [self dealWithParam:params];
        urlString = [url stringByAppendingString:paramStr];
    }else{
        urlString = url;
    }
    //对URL中的中文进行转码
    NSString *pathStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pathStr]];
    
    request.timeoutInterval = Interval;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                //利用iOS自带原生JSON解析data数据 保存为Dictionary
                if (successBlock) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    NSLog(@"结果 %@",dict);
                    successBlock(dict);
                }
            }else{
                if (failBlock) {
                    failBlock(error);
                }
            }
        });
    }];
    
    [task resume];
}

+ (void)PostRequestHTTPMethod:(NSString *)httpMenthod relativePath:(NSString *)relativePath params:(NSDictionary *)params successBlock:(HSResponseSuccessBlock)successBlock failBlock:(HSResponseFailBlock)failBlock {
    NSString *url = [NSString stringWithFormat:@"%@%@?",relativeUrl,relativePath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:httpMenthod];
    
    //把字典中的参数进行拼接
    NSString *body = [self dealWithParam:params];
    NSData *bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置请求体
    [request setHTTPBody:bodyData];
    //设置本次请求的数据请求格式
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    // 设置本次请求请求体的长度(因为服务器会根据你这个设定的长度去解析你的请求体中的参数内容)
    [request setValue:[NSString stringWithFormat:@"%ld", bodyData.length] forHTTPHeaderField:@"Content-Length"];
    //设置请求最长时间
    request.timeoutInterval = Interval;
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
        if (data) {
            //利用iOS自带原生JSON解析data数据 保存为Dictionary
            if (successBlock) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                successBlock(dict);
            }
        }else{
            if (failBlock) {
                failBlock(error);
            }
        }
    }];
    [task resume];
}

+ (NSString *)dealWithParam:(NSDictionary *)param {
    NSArray *allkeys = [param allKeys];
    NSMutableString *result = [NSMutableString string];
    
    for (NSString *key in allkeys) {
        NSString *string = [NSString stringWithFormat:@"%@=%@&", key, param[key]];
        [result appendString:string];
    }
    return result;
}

@end
