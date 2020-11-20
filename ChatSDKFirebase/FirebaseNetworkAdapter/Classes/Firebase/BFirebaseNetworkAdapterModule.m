//
//  BFirebaseNetworkAdapterModule.m
//  ChatSDK Demo
//
//  Created by Ben on 2/1/18.
//  Copyright © 2018 deluge. All rights reserved.
//

#import <ChatSDKFirebase/FirebaseAdapter.h>
#import <ChatSDKFirebase/BFirebaseNetworkAdapterModule.h>

@implementation BFirebaseNetworkAdapterModule

-(void) activate {
    BChatSDK.shared.networkAdapter = [[BFirebaseNetworkAdapter alloc] init];
    if ([BChatSDK.shared.networkAdapter respondsToSelector:@selector(activate)]) {
        [BChatSDK.shared.networkAdapter activate];
    }
}

@end
