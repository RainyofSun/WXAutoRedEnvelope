#line 1 "/Users/JingGuo/Desktop/WeChatRedEnvelope/WeChatRedEnvelopeDylib/Logos/WeChatRedEnvelopeDylib.xm"




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
@property(retain, nonatomic) NSString *m_nsHeadImgUrl; 
@end

@interface CBaseContact
@property(retain, nonatomic) NSString *m_nsUsrName; 
@end

@interface WeixinContentLogicController
@property(retain, nonatomic) CBaseContact *m_contact; 
@end


@interface WCPayLogicMgr{
    unsigned int m_uiRealnameReportScene;
}
- (void)checkHongbaoOpenLicense:(id)arg1 acceptCallback:(void(^)())arg2 denyCallback:(void(^)())arg3;
- (void)setRealnameReportScene:(unsigned int)arg1;
@end

@interface SKBuiltinBuffer_t

@property(retain, nonatomic) NSData *buffer; 
@property(nonatomic) unsigned int iLen; 

@end

@interface BaseResponse
@property(nonatomic) int ret; 

@end

@interface HongBaoRes

@property(retain, nonatomic) BaseResponse *baseResponse; 
@property(nonatomic) int cgiCmdid; 
@property(retain, nonatomic) NSString *errorMsg; 
@property(nonatomic) int errorType; 
@property(retain, nonatomic) NSString *platMsg; 
@property(nonatomic) int platRet; 
@property(retain, nonatomic) SKBuiltinBuffer_t *retText; 

@end

@interface WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)arg1 Request:(id)arg2;
- (void)ReceiverQueryRedEnvelopesRequest:(id)arg1;
- (void)OpenRedEnvelopesRequest:(id)arg1;
@end





#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WCPayLogicMgr; @class WCRedEnvelopesReceiveControlLogic; @class WCRedEnvelopesLogicMgr; @class WCBizUtil; @class NSMutableDictionary; @class CContactMgr; @class MMMsgLogicManager; @class CMessageMgr; @class MMServiceCenter; 
static void (*_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, id); static void (*_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, CMessageWrap *); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMServiceCenter(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMServiceCenter"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMMsgLogicManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMMsgLogicManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCPayLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCPayLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$NSMutableDictionary(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("NSMutableDictionary"); } return _klass; }
#line 109 "/Users/JingGuo/Desktop/WeChatRedEnvelope/WeChatRedEnvelopeDylib/Logos/WeChatRedEnvelopeDylib.xm"

static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, HongBaoRes * arg1, id arg2){
    _logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(self, _cmd, arg1, arg2);
    
    NSString* responseString = [[NSString alloc] initWithData:arg1.retText.buffer encoding:NSUTF8StringEncoding];
    
    NSError* err;
    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:arg1.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    
    
    
    
    
    if(nil != arg1 && nil != arg2 && 3 == arg1.cgiCmdid){
        NSString* timingIdentifier = responseDict[@"timingIdentifier"];
        
        NSMutableDictionary * param = [[WeChatRedEnvelopParamQueue sharedQueue] dequeue];
        
        if(param == nil){    return;}
        [param setObject:timingIdentifier forKey:@"timingIdentifier"];
        
        sleep(1);
        WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        
        if(redEnvelopesLogicMgr){
            [redEnvelopesLogicMgr OpenRedEnvelopesRequest:param];
        }
    }
    
}





static void _logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CMessageWrap * msgWrap){
    
    if(MSHookIvar <unsigned int>(msgWrap,"m_uiMessageType") == 49){
        WCPayInfoItem *item = [msgWrap m_oWCPayInfoItem];
        if (!item) {
            return;
        }
        NSString *c2cNativeUrl = [item m_c2cNativeUrl];
        NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
        NSDictionary* url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
        
        
        
        
        NSMutableDictionary* mutable_dic =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
        [mutable_dic setObject:@"1" forKey:@"msgType"];
        if (url_dic.allValues.count) {
            [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
            [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
        }
        
        CContactMgr* contactMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$CContactMgr() class]];
        CContact * selfContact = [contactMgr getSelfContact];
        id displayName = [selfContact getContactDisplayName];
        [mutable_dic setObject:displayName forKey:@"nickName"];
        [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
        if(msgWrap) {
            [mutable_dic setObject:c2cNativeUrl forKey:@"nativeUrl"];
        }
        
        NSString * nsUsrName = MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr");
        if ( nsUsrName ){
            NSLog(@"%@",nsUsrName);
            [mutable_dic setObject:nsUsrName forKey:@"sessionUserName"];
        }
        
        WeChatRedEnvelopParamQueue * paramQueue = [WeChatRedEnvelopParamQueue sharedQueue];
        [paramQueue enqueue:mutable_dic];
        
        
        
        
        
        BOOL (^isGroupReceiver)() = ^BOOL() {
            return [msgWrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
        };
        
        NSMutableDictionary* params =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
        [params setObject:@"0" forKey:@"agreeDuty"];
        
        [params setObject: isGroupReceiver() ? @"0" : @"1" forKey:@"inWay"];
        [params setObject:url_dic[@"channelid"] forKey:@"channelId"];
        [params setObject:@"1" forKey:@"msgType"];
        [params setObject:c2cNativeUrl forKey:@"nativeUrl"];
        [params setObject:url_dic[@"sendid"] forKey:@"sendId"];
        
        WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    }else{
        NSLog(@"%@",msgWrap);
    }
    
    
    _logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$(self, _cmd, msgWrap);
}








static void _logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesReceiveControlLogic* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    WCRedEnvelopesControlData *m_data = MSHookIvar <WCRedEnvelopesControlData *>(self,"m_data");
    
    CMessageWrap * msgWrap = [m_data  m_oSelectedMessageWrap];
    NSLog(@"%@",MSHookIvar <NSString *>(msgWrap,"m_nsFromUsr"));
    WCPayInfoItem * payInfoItem = [msgWrap m_oWCPayInfoItem];
    NSString *c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
    NSUInteger len  = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
    NSString *nativeUrl2 = [c2cNativeUrl substringFromIndex:len];
    
    NSDictionary* url_dic = [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:nativeUrl2 separator:@"&"];
    NSMutableDictionary* mutable_dic =  [_logos_static_class_lookup$NSMutableDictionary() dictionary];
    [mutable_dic setObject:@"1" forKey:@"msgType"];
    [mutable_dic setObject:url_dic[@"sendid"] forKey:@"sendId"];
    [mutable_dic setObject:url_dic[@"channelid"] forKey:@"channelId"];
    
    
    MMServiceCenter* mmserCent = [_logos_static_class_lookup$MMServiceCenter() defaultCenter];
    Class ccmgr = [_logos_static_class_lookup$CContactMgr() class];
    CContactMgr* contactMgr = [mmserCent getService:ccmgr];
    CContact * selfContact = [contactMgr getSelfContact];
    id displayName = [selfContact getContactDisplayName];
    [mutable_dic setObject:displayName forKey:@"nickName"];
    [mutable_dic setObject:[selfContact m_nsHeadImgUrl] forKey:@"headImg"];
    if(msgWrap){
        [mutable_dic setObject:c2cNativeUrl forKey:@"nativeUrl"];
    }
    
    
    
    MMMsgLogicManager * msgLogicManager = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter]  getService:[_logos_static_class_lookup$MMMsgLogicManager() class]];
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
        
        WCPayLogicMgr * paylogic = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCPayLogicMgr() class]];
        [paylogic setRealnameReportScene:(unsigned int)1003];
        WCPayLogicMgr* payLogicMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCPayLogicMgr() class]];
        id subScript = [structDicRedEnvelopesBaseInfo objectForKeyedSubscript:@"agree_duty"];
        [payLogicMgr checkHongbaoOpenLicense:subScript acceptCallback:^{
            WCRedEnvelopesLogicMgr* redEnvelopesLogicMgr  = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
            
            [redEnvelopesLogicMgr OpenRedEnvelopesRequest:mutable_dic];
            
        } denyCallback:^{
            
        }];
    }
}














































static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WCRedEnvelopesLogicMgr = objc_getClass("WCRedEnvelopesLogicMgr"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesLogicMgr, @selector(OnWCToHongbaoCommonResponse:Request:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$);Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(onNewSyncAddMessage:), (IMP)&_logos_method$_ungrouped$CMessageMgr$onNewSyncAddMessage$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$onNewSyncAddMessage$);Class _logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic = objc_getClass("WCRedEnvelopesReceiveControlLogic"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveControlLogic, @selector(WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveControlLogic$WCRedEnvelopesReceiveHomeViewOpenRedEnvelopes);} }
#line 326 "/Users/JingGuo/Desktop/WeChatRedEnvelope/WeChatRedEnvelopeDylib/Logos/WeChatRedEnvelopeDylib.xm"
