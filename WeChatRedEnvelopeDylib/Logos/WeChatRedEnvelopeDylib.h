
// See http://iphonedevwiki.net/index.php/Logos



#import <UIKit/UIKit.h>
#import "WeChatRedEnvelopParamQueue.h"

@interface WCRedEnvelopesReceiveHomeView
{
    id  m_delegate;
    NSDictionary *m_dicBaseInfo;
}
@end



@interface WCPayInfoItem
@property(retain, nonatomic) NSString *m_c2cNativeUrl;
@end

@interface CMessageWrap
@property(retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@property(retain, nonatomic) NSString *m_nsFromUsr;
@end

@interface WCRedEnvelopesControlData{
    CMessageWrap *m_oSelectedMessageWrap;
}

@property(retain, nonatomic) NSDictionary *m_structDicRedEnvelopesBaseInfo;
-(CMessageWrap *)m_oSelectedMessageWrap;
@end
@interface WCRedEnvelopesReceiveControlLogic{
    WCRedEnvelopesControlData *m_data;
}
@end
@interface WCBizUtil
+ (id)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;
@end



@interface MMServiceCenter
+ (id)defaultCenter;
- (id)getService:(Class)arg1;
@end
@interface MMMsgLogicManager
- (id)GetCurrentLogicController;
@end

@interface CContactMgr
- (id)getSelfContact;
@end

@interface CContact
- (id)getContactDisplayName;
@property(retain, nonatomic) NSString *m_nsHeadImgUrl; // @synthesize m_nsHeadImgUrl;
@end

@interface CBaseContact
@property(retain, nonatomic) NSString *m_nsUsrName; // @synthesize m_nsUsrName;
@end

@interface WeixinContentLogicController
@property(retain, nonatomic) CBaseContact *m_contact; // @synthesize m_contact;
@end


@interface WCPayLogicMgr{
    unsigned int m_uiRealnameReportScene;
}
- (void)checkHongbaoOpenLicense:(id)arg1 acceptCallback:(void(^)())arg2 denyCallback:(void(^)())arg3;
- (void)setRealnameReportScene:(unsigned int)arg1;
@end

@interface SKBuiltinBuffer_t
// Remaining properties
@property(retain, nonatomic) NSData *buffer; // @dynamic buffer;
@property(nonatomic) unsigned int iLen; // @dynamic iLen;

@end

@interface BaseResponse
@property(nonatomic) int ret; // @dynamic ret;

@end

@interface HongBaoRes
// Remaining properties
@property(retain, nonatomic) BaseResponse *baseResponse; // @dynamic baseResponse;
@property(nonatomic) int cgiCmdid; // @dynamic cgiCmdid;
@property(retain, nonatomic) NSString *errorMsg; // @dynamic errorMsg;
@property(nonatomic) int errorType; // @dynamic errorType;
@property(retain, nonatomic) NSString *platMsg; // @dynamic platMsg;
@property(nonatomic) int platRet; // @dynamic platRet;
@property(retain, nonatomic) SKBuiltinBuffer_t *retText; // @dynamic retText;

@end

@interface WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
- (void)OpenRedEnvelopesRequest:(id)arg1;
@end




%hook WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2{
    %orig;
    
    NSString* responseString = [[NSString alloc] initWithData:arg1.retText.buffer encoding:NSUTF8StringEncoding];
    //    NSLog(@"arg1: cgiCmdid = %d, errorMsg = %@, errorType = %d, platMsg = %@, platRet = %d, retText = %@", arg1.cgiCmdid, arg1.errorMsg, arg1.errorType, arg1.platMsg, arg1.platRet, responseString);
    NSError* err;
    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    
    //     NSArray* arr = [responseDict allKeys];
    //     for( NSInteger i = 0; i < arr.count; ++i){
    //     NSLog(@"%@ : %@", arr[i], [responseDict objectForKey:arr[i]]);
    //     }
    if(nil != arg1 && nil != arg2 && 3 == arg1.cgiCmdid){
        NSString* timingIdentifier = responseDict[@"timingIdentifier"];
        //拿到timingIdentifier 开始抢红包
        NSMutableDictionary * param = [[WeChatRedEnvelopParamQueue sharedQueue] dequeue];
        //然后开始拼接
        if(param == nil){    return;}
        [param setObject:timingIdentifier forKey:@"timingIdentifier"];
        
        sleep(1);
        WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
        //真正打开红包请求的方法!
        if(redEnvelopesLogicMgr){
            [redEnvelopesLogicMgr OpenRedEnvelopesRequest:param];
        }
    }
    
}
%end

%hook CMessageMgr

//收到新消息!
- (void)onNewSyncAddMessage:(CMessageWrap *)msgWrap{
    //将WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes逻辑移植过来
    if(MSHookIvar <unsigned int>(msgWrap,"m_uiMessageType") == 49){
        NSString *c2cNativeUrl = [[msgWrap m_oWCPayInfoItem] m_c2cNativeUrl];
        NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
        NSDictionary* url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
        
        
        
        //抢红包参数拼接!!
        NSMutableDictionary* mutable_dic =  [%c(NSMutableDictionary) dictionary];
        [mutable_dic setObject:@"1" forKey:@"msgType"];
        [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
        [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
        
        //接下来
        CContactMgr* contactMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(CContactMgr) class]];
        CContact * selfContact = [contactMgr getSelfContact];
        id displayName = [selfContact getContactDisplayName];
        [mutable_dic setObject:displayName forKey:@"nickName"];
        [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
        if(msgWrap) {
            [mutable_dic setObject:c2cNativeUrl forKey:@"nativeUrl"];
        }
        //拼接发送方用户名
        NSString * nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
        if ( nsUsrName ){
            NSLog(@"%@",nsUsrName);
            [mutable_dic setObject:nsUsrName forKey:@"sessionUserName"];
        }
        //将参数保存!!
        WeChatRedEnvelopParamQueue * paramQueue = [WeChatRedEnvelopParamQueue sharedQueue];
        [paramQueue enqueue:mutable_dic];
        
        
        
        //拆红包
        //通过字段判断是群红包还是个人红包
        BOOL (^isGroupReceiver)() = ^BOOL() {
            return [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
        };
        //拼接参数
        NSMutableDictionary* params =  [%c(NSMutableDictionary) dictionary];
        [params setObject:@"0" forKey:@"agreeDuty"];
        //是否是群红包!
        [params setObject: isGroupReceiver() ? @"0" : @"1" forKey:@"inWay"];
        [params setObject:url_dic[@"channelid"] forKey:@"channelId"];
        [params setObject:@"1" forKey:@"msgType"];
        [params setObject:c2cNativeUrl forKey:@"nativeUrl"];
        [params setObject:url_dic[@"sendid"] forKey:@"sendId"];
        
        WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
        //真正拆开红包请求的方法!
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    }else{
        NSLog(@"%@",msgWrap);
    }
    
    
    %orig;
}



%end


%hook WCRedEnvelopesReceiveControlLogic
- (void)WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes
{
    WCRedEnvelopesControlData *m_data = MSHookIvar <WCRedEnvelopesControlData *>(self,"m_data");
    //消息包!
    CMessageWrap * msgWrap = [m_data  m_oSelectedMessageWrap];
    NSLog(@"%@",MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr"));
    WCPayInfoItem * payInfoItem = [msgWrap m_oWCPayInfoItem];
    NSString *c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    
    NSDictionary* url_dic = [%c(WCBizUtil) dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
    NSMutableDictionary* mutable_dic =  [%c(NSMutableDictionary) dictionary];
    [mutable_dic setObject:@"1" forKey:@"msgType"];
    if (url_dic.allValues.count) {
        [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
        [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
    }
    
    
    MMServiceCenter* mmserCent = [%c(MMServiceCenter) defaultCenter];
    Class ccmgr = [%c(CContactMgr) class];
    CContactMgr* contactMgr = [mmserCent getService:ccmgr];
    CContact * selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    [mutable_dic setObject:displayName forKey:@"nickName"];
    [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
    if(msgWrap){
        [mutable_dic setObject:c2cNativeUrl forKey:@"nativeUrl"];
    }
    
    
    
    MMMsgLogicManager * msgLogicManager = [[%c(MMServiceCenter) defaultCenter]  getService:[%c(MMMsgLogicManager) class]];
    WeixinContentLogicController * currentLogicController = [msgLogicManager GetCurrentLogicController];
    if(currentLogicController){
        CBaseContact* contact = [currentLogicController m_contact];
        if ( contact ){
            NSString * nsUsrName = [contact m_nsUsrName];
            if ( nsUsrName ){
                NSLog(@"%@",nsUsrName);
                [mutable_dic setObject:nsUsrName forKey:@"sessionUserName"];
            }
        }
    }
    
    
    
    NSDictionary * structDicRedEnvelopesBaseInfo = [m_data m_structDicRedEnvelopesBaseInfo];
    NSString *timingIdentifier = [structDicRedEnvelopesBaseInfo objectForKey:@"timingIdentifier"];
    NSLog(@"%@",timingIdentifier);
    
    if([timingIdentifier length]){
        [mutable_dic setObject:timingIdentifier forKey:@"timingIdentifier"];
        
        WCPayLogicMgr * paylogic = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCPayLogicMgr) class]];
        [paylogic setRealnameReportScene:(unsigned int)1003];
        WCPayLogicMgr* payLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCPayLogicMgr) class]];
        id subScript = [structDicRedEnvelopesBaseInfo objectForKeyedSubscript:@"agree_duty"];
        [payLogicMgr checkHongbaoOpenLicense:subScript acceptCallback:^{
            WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
            //真正打开红包请求的方法!
            [redEnvelopesLogicMgr OpenRedEnvelopesRequest:mutable_dic];
            
        } denyCallback:^{
            
        }];
    }
}
%end


/*
 %hook WCRedEnvelopesReceiveHomeView
 //拆红包方法
 - (void)OnOpenRedEnvelopes{
 //MSHookIvar 原理是调用了class_getInstanceVariable获取类中指定名称实例成员变量的信息
 //目的拿到我的成员变量
 NSDictionary * dict  = MSHookIvar<NSDictionary *>(self,"m_dicBaseInfo");
 NSArray * arr = [dict allKeys];
 //打印字典内容
 for(int i = 0 ;i < arr.count ;i++){
 NSLog(@"%@ : %@",arr[i],[dict objectForKey:arr[i]]);
 }
 
 //拿到代理类型!
 id delegate = MSHookIvar<id>(self,"m_delegate");
 NSLog(@"delegateClass:%@",[delegate class]);
 
 }
 
 %end
 */




/*
 %hook BaseMsgContentViewController
 
 - (void)addMessageNode:(id)arg1 layout:(_Bool)arg2 addMoreMsg:(_Bool)arg3 {
 %orig;
 }
 %end
 
 
 
 
 */


