#import "QbkjMobPlugin.h"
#if __has_include(<qbkj_mob/qbkj_mob-Swift.h>)
#import <qbkj_mob/qbkj_mob-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "qbkj_mob-Swift.h"
#endif

@implementation QbkjMobPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQbkjMobPlugin registerWithRegistrar:registrar];
}
@end
