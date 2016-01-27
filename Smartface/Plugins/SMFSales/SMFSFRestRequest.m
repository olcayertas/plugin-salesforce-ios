//
//  SMFSFRestRequest.m
//  Smartface
//
//  Created by mehmet akyol on 13/11/15.
//
//

#import "SMFSFRestRequest.h"

@implementation SMFSFRestRequest

+(SFRestRequest*) request:(int)met path:(NSString*)path params:(NSString*)params end:(NSString*)endPoint {
    
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary* qParams = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    SFRestRequest* temp = [SFRestRequest requestWithMethod:(SFRestMethod)met path:path queryParams:qParams];
    temp.endpoint = endPoint;
    return temp;
}


@end
