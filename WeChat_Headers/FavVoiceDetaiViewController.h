//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import "FavBaseDetailViewController.h"

#import "IContactMgrExt-Protocol.h"
#import "WCActionSheetDelegate-Protocol.h"

@class FavAudioPlayerController, MMUIImageView, MMUIView, NSString;

@interface FavVoiceDetaiViewController : FavBaseDetailViewController <IContactMgrExt, WCActionSheetDelegate>
{
    MMUIView *m_contentView;
    MMUIImageView *m_audioPlayerBgView;
    FavAudioPlayerController *m_audioPlayerCtrl;
}

- (void).cxx_destruct;
- (void)actionSheet:(id)arg1 clickedButtonAtIndex:(long long)arg2;
- (void)onAction:(id)arg1;
- (void)genContent:(id)arg1 indexPath:(id)arg2;
- (double)getHeightForRowAtIndexPath:(id)arg1;
- (long long)getRowsInContentSection;
- (void)initView;
- (void)didReceiveMemoryWarning;
- (void)viewWillDisappear:(_Bool)arg1;
- (void)viewDidLayoutSubviews;
- (void)viewDidBePoped:(_Bool)arg1;
- (void)viewDidLoad;
- (id)initWithFavItem:(id)arg1;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) Class superclass;

@end

