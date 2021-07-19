//
//  AppDelegate.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 25.06.2021.
//

#import "AppDelegate.h"
@import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [FIRApp configure];
    [FIRFirestore firestore];
    
    return YES;
}

#pragma mark - UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {

    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

@end
