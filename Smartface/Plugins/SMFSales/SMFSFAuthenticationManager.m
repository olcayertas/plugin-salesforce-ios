//
//  SMFSFAuthanticationManager.m
//  Smartface
//
//  Created by mehmet akyol on 13/11/15.
//
//

#import "SMFSFAuthenticationManager.h"

@implementation SMFSFAuthenticationManager

- (void)authManagerWillBeginAuthWithView:(SFAuthenticationManager *)manager {
    
}

/**
 Called when the auth view starts its load.
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerDidStartAuthWebViewLoad:(SFAuthenticationManager *)manager {
    
}

/**
 Called when the auth view load has finished.
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerDidFinishAuthWebViewLoad:(SFAuthenticationManager *)manager{
    
}

/**
 Called when the auth manager is going to display the auth view.
 @param manager The instance of SFAuthenticationManager making the call.
 @param view The instance of the auth view to be displayed.
 */
- (void)authManager:(SFAuthenticationManager *)manager willDisplayAuthWebView:(UIWebView *)view{
    
}

/**
 Called before the auth manager will perform an authentication, this includes token refresh.
 @param manager The instance of SFAuthenticationManager making the call.
 @param info The auth info associated with authentication.
 */
- (void)authManagerWillBeginAuthentication:(SFAuthenticationManager *)manager authInfo:(SFOAuthInfo *)info {
    
}

/**
 Called after the auth manager has successfully authenticated.
 @param manager The instance of SFAuthenticationManager making the call.
 @param credentials The newly-authenticated credentials.
 @param info The auth info associated with authentication.
 */
- (void)authManagerDidAuthenticate:(SFAuthenticationManager *)manager credentials:(SFOAuthCredentials *)credentials authInfo:(SFOAuthInfo *)info {
    
}

/**
 Called after the auth manager has successfully authenticated and finished retrieving the identity information.
 @param manager The instance of SFAuthenticationManager making the call.
 @param info The auth info associated with authentication.
 */
- (void)authManagerDidFinish:(SFAuthenticationManager *)manager info:(SFOAuthInfo *)info{
    
}

/**
 Called after the auth manager had failed to authenticate.
 @param manager The instance of SFAuthenticationManager making the call.
 @param error The error
 @param info The auth info associated with authentication.
 */
- (void)authManagerDidFail:(SFAuthenticationManager *)manager error:(NSError*)error info:(SFOAuthInfo *)info{
    
}

/**
 Called when the auth manager wants to determine if the network is available (best guest).
 @param manager The instance of SFAuthenticationManager making the call.
 @return YES if the network is available, NO otherwise
 */


/**
 Called before the auth manager logs out the given user.
 @param manager The instance of SFAuthenticationManager making the call.
 @param user The user that will be logged out.
 */
- (void)authManager:(SFAuthenticationManager *)manager willLogoutUser:(SFUserAccount *)user{
    
}

/**
 Called after the auth manager logs out.
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerDidLogout:(SFAuthenticationManager *)manager{
    SMFSFManager* temp = (SMFSFManager*) [SMFSFManager sharedObj];
    [temp.SMFPostLogoutAction callSelfAsFunctionWithArgs:@[]];
}

/**
 Called after UIApplicationWillResignActiveNotification is received
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerWillResignActive:(SFAuthenticationManager *)manager{
    
}

/**
 Called after UIApplicationDidBecomeActiveNotification is received.
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerDidBecomeActive:(SFAuthenticationManager *)manager{
    
}

/**
 Called after UIApplicationWillEnterForegroundNotification is received.
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerWillEnterForeground:(SFAuthenticationManager *)manager{
    
}

/**
 Called after UIApplicationDidEnterBackgroundNotification is received
 @param manager The instance of SFAuthenticationManager making the call.
 */
- (void)authManagerDidEnterBackground:(SFAuthenticationManager *)manager{
    
}

@end
