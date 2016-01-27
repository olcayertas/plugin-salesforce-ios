//
//  SMFSFManager.m
//  Smartface
//
//  Created by mehmet akyol on 06/11/15.
//
//

#import "SMFSFManager.h"

@implementation SMFSFManager

- (void) preLaunch{
    self.postLaunchAction = ^(SFSDKLaunchAction launchActionList) {
        NSString* data = [NSString stringWithFormat:@"%d",launchActionList];
        [self.SMFPostLaunchAction callSelfAsFunctionWithArgs:@[[[SMFJSObject alloc] initWithString:data]]];
    };
    
    self.launchErrorAction = ^(NSError *error, SFSDKLaunchAction launchActionList) {
        NSString* data = [NSString stringWithFormat:@"%d",launchActionList];
        [self.SMFLaunchErrorAction callSelfAsFunctionWithArgs:@[[[SMFJSObject alloc] initWithString:data]]];
    };
    
    
    self.postLogoutAction = ^{
        
    };
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [SalesforceSDKManager sharedManager].useSnapshotView = NO;
        self.useSnapshotView = NO;
    });
}

#pragma mark - Private methods


@end
