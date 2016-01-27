#import <UIKit/UIKit.h>

#ifdef SMARTFACE_EMULATOR
#import "../JavaScriptCore/inc/JavaScriptCore.h"
#else
#import <JavaScriptCore/JavaScriptCore.h>
#endif

__attribute__ ((visibility ("default"))) @protocol ESpratIOSPlayerInterface <NSObject>
-(void) SMFRun;
-(void) SMFAppWillTerminate;
-(void) SMFAppEnteredBackground;
-(void) SMFAppCameFromBackground;
-(void) SMFReceiveNotification :(UILocalNotification*)notification;
-(void) SMFRegisteredNotification:(NSData *)token andError:(NSError *)error;
-(void) SMFSetRemoteTempDict:(NSDictionary *)dictionary;
-(void) SMFHandleRemoteNotification:(UIApplication *)application andDict:(NSDictionary *)dict;
-(void) SMFHandleUrlAppCall:(NSURL *)url;
-(void) SMFSetAppCallUrl:(NSURL *)url;
-(BOOL) SMFIsCameFromBack;
-(void) SMFLoadCustomPluginIdentifier:(const char *)definitonString andDefinition:(const JSClassDefinition *)classDefinition withObject:(void **)privateObject;
-(void) SMFRunJavaScriptSmartface:(JSContextRef)ctx :(JSObjectRef)object :(JSObjectRef)thisObject :(size_t)argumentCount :(const JSValueRef[])args;
-(JSGlobalContextRef) SMFGetGlobalContextRef;
-(void) SMFCreateJSInterfaceForClass:(Class)objcClass refString:(NSString *)refString;
-(void) SMFCreateViewJSInterfaceForClass:(Class)objcClass refString:(NSString *)refString;

@end

__attribute__ ((visibility ("default"))) @interface ESpratIOSPlayer : NSObject{
}

+(id<ESpratIOSPlayerInterface>) SMFGetPlayer;

@end
