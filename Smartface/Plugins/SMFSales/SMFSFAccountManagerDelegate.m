//
//  SMFSFAccountManager.m
//  Smartface
//
//  Created by mehmet akyol on 06/11/15.
//
//

#import "SMFSFAccountManagerDelegate.h"

@implementation SMFSFAccountManagerDelegate

- (void)userAccountManager:(SFUserAccountManager *)userAccountManager
        willSwitchFromUser:(SFUserAccount *)fromUser
                    toUser:(SFUserAccount *)toUser {

}

/**
 Called after the user account manager switches from one user to another.
 @param userAccountManager The SFUserAccountManager instance making the switch.
 @param fromUser The user that was switched away from.
 @param toUser The user that was switched to.  `nil` if the user context is being switched back
 to no user.
 */
- (void)userAccountManager:(SFUserAccountManager *)userAccountManager
         didSwitchFromUser:(SFUserAccount *)fromUser
                    toUser:(SFUserAccount *)toUser {

}


@end
