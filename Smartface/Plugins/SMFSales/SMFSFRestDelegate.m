//
//  SMFSFRestDelegate.m
//  Smartface
//
//  Created by mehmet akyol on 07/11/15.
//
//

#import "SMFSFRestDelegate.h"

@implementation SMFSFRestDelegate

- (void)request:(SFRestRequest *)request didLoadResponse:(id)dataResponse {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dataResponse options:0 error:nil];
    NSString *dataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    [self.onSuccess callSelfAsFunctionWithArgs:@[[[SMFJSObject alloc] initWithString:dataString]]];
}

/**
 * Sent when a request has failed due to an error.
 * This includes HTTP network errors, as well as Salesforce errors
 * (for example, passing an invalid SOQL string when doing a query).
 * @param request The attempted request.
 * @param error The error associated with the failed request.
 */
- (void)request:(SFRestRequest *)request didFailLoadWithError:(NSError*)error {
    [self.onFail callSelfAsFunctionWithArgs:@[[[SMFJSObject alloc] initWithString:[error description]]]];
}

/**
 * Sent to the delegate when a request was cancelled.
 * @param request The canceled request.
 */
- (void)requestDidCancelLoad:(SFRestRequest *)request {
    
}

/**
 * Sent to the delegate when a request has timed out. This is sent when a
 * backgrounded request expired before completion.
 * @param request The request that timed out.
 */
- (void)requestDidTimeout:(SFRestRequest *)request {
    
}


@end
