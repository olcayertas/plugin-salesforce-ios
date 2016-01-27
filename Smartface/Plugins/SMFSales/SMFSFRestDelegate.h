//
//  SMFSFRestDelegate.h
//  Smartface
//
//  Created by mehmet akyol on 07/11/15.
//
//

#import <Foundation/Foundation.h>
#import "SFRestRequest.h"
#import "SMFSFManager.h"

@interface SMFSFRestDelegate : NSObject <SFRestDelegate>

@property (nonatomic, assign) SMFJSObject* onSuccess;
@property (nonatomic, assign) SMFJSObject* onFail;

@end
