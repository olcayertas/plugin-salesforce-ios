//
//  SmartfaceAppDelegate.h
//  Smartface
//
//  Copyright 2011 Mobinex. All rights reserved.
//

#import "SmartfaceAppDelegate.h"
#import "SMFSFManager.h"
#import "SMFSFAccountManagerDelegate.h"
#import "SMFSFRestDelegate.h"

#import "SMFSFAccountManagerDelegate.h"
#import "SMFSFAuthenticationManager.h"
#import "SMFSFRestRequest.h"

#import <SalesforceSDKCore/SFPushNotificationManager.h>
#import <SalesforceSDKCore/SFDefaultUserManagementViewController.h>
#import <SalesforceCommonUtils/SFLogger.h>
#import <SalesforceSDKCore/SFUserAccountManager.h>
#import <SalesforceSDKCore/SFUserAccount.h>
#import <SalesforceSDKCore/SFAuthenticationManager.h>

#import <SalesforceRestAPI/SFRestAPI.h>
#import <SalesforceRestAPI/SFRestRequest.h>

@implementation SmartfaceAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFRun];
    
    //Accept push notification when app is not open
    NSDictionary *remoteNotif = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
    if (remoteNotif) {
        [[ESpratIOSPlayer SMFGetPlayer] SMFSetRemoteTempDict:remoteNotif];
    }
    // Handle launching from a notification
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {
        [[ESpratIOSPlayer SMFGetPlayer] SMFReceiveNotification:locationNotification];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call r SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFAppEnteredBackground];
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFAppCameFromBackground];
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFAppWillTerminate];
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if (!url) {
        return NO;
    } else {
        NSString *urlStr = [url description];
        if([urlStr rangeOfString:@"://"].location == NSNotFound){
            NSData *data = [urlStr dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            [[ESpratIOSPlayer SMFGetPlayer] SMFHandleRemoteNotification:application andDict:json];
        }
        if([[ESpratIOSPlayer SMFGetPlayer] SMFIsCameFromBack]){
            [[ESpratIOSPlayer SMFGetPlayer] SMFHandleUrlAppCall:url];
            return YES;
        }
        else {
            [[ESpratIOSPlayer SMFGetPlayer] SMFSetAppCallUrl:url];
            return NO;
        }
    }
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFRegisteredNotification:deviceToken andError:nil];
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFRegisteredNotification:nil andError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFHandleRemoteNotification:application andDict:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFReceiveNotification:notification];
}

- (void)willSetCustomPluginsOnContext:(JSContextRef)ctx
{
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SMFSFManager class] refString:@"SMFSFManager"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SMFSFRestDelegate class] refString:@"SMFSFRestDelegate"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFRestAPI class] refString:@"SFRestAPI"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFRestRequest class] refString:@"SFRestRequest"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SMFSFRestRequest class] refString:@"SMFSFRestRequest"];
    
    
    
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFUserAccountManager class] refString:@"SFUserAccountManager"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFUserAccount class] refString:@"SFUserAccount"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFLoginHostUpdateResult class] refString:@"SFLoginHostUpdateResult"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFUserAccountIdentity class] refString:@"SFUserAccountIdentity"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFLoginHostUpdateResult class] refString:@"SFLoginHostUpdateResult"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFIdentityData class] refString:@"SFIdentityData"];
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SMFSFAccountManagerDelegate class] refString:@"SMFSFAccountManagerDelegate"];
    
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SMFSFAuthenticationManager class] refString:@"SMFSFAuthenticationManager"];
    
    [[ESpratIOSPlayer SMFGetPlayer] SMFCreateJSInterfaceForClass:[SFRestAPISalesforceAction class] refString:@"SFRestAPISalesforceAction"];
    
    
}

- (void)dealloc
{
    [super dealloc];
}

@end