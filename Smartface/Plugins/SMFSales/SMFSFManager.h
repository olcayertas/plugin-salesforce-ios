//
//  SMFSFManager.h
//  Smartface
//
//  Created by mehmet akyol on 06/11/15.
//
//

#import <Foundation/Foundation.h>

#import <JavaScriptCore/JavaScriptCore.h>
#import <SalesforceSDKCore/SFPushNotificationManager.h>
#import <SalesforceSDKCore/SFDefaultUserManagementViewController.h>
#import <SalesforceSDKCore/SalesforceSDKManager.h>
#import <SalesforceSDKCore/SFUserAccountManager.h>
#import <SalesforceCommonUtils/SFLogger.h>

#include <iOSPlayer/inc/SMFJSObject.h>
#include <iOSPlayer/inc/ESpratIOSPlayer.h>
#include <iOSPlayer/inc/ESpratNavigationController.h>


@interface SMFSFManager : SalesforceSDKManager

@property (nonatomic, assign) SMFJSObject* SMFPostLaunchAction;
@property (nonatomic, assign) SMFJSObject* SMFLaunchErrorAction;
@property (nonatomic, assign) SMFJSObject* SMFPostLogoutAction;
@property (nonatomic, assign) SMFJSObject* SMFPostLogoutFailAction;

@end
