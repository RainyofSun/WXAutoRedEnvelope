//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <MMCommon/WXPBGeneratedMessage.h>

@class NSString, Project8VoiceSegInfo;

@interface ReportProject8VoiceInfoReq : WXPBGeneratedMessage
{
}

+ (void)initialize;

// Remaining properties
@property(retain, nonatomic) NSString *cdnaeskey; // @dynamic cdnaeskey;
@property(retain, nonatomic) NSString *cdnfileId; // @dynamic cdnfileId;
@property(retain, nonatomic) Project8VoiceSegInfo *segInfo1; // @dynamic segInfo1;
@property(retain, nonatomic) Project8VoiceSegInfo *segInfo2; // @dynamic segInfo2;
@property(retain, nonatomic) NSString *ugccity; // @dynamic ugccity;
@property(retain, nonatomic) NSString *ugcnickname; // @dynamic ugcnickname;
@property(retain, nonatomic) NSString *voiceMd5; // @dynamic voiceMd5;

@end
