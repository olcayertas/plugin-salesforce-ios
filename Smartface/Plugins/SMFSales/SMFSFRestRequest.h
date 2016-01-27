//
//  SMFSFRestRequest.h
//  Smartface
//
//  Created by mehmet akyol on 13/11/15.
//
//

#import <Foundation/Foundation.h>
#import <SalesforceRestAPI/SFRestRequest.h>

@interface SMFSFRestRequest : SFRestRequest

+(SFRestRequest*) request:(int)met path:(NSString*)path params:(NSString*)params end:(NSString*)endPoint;

@end
