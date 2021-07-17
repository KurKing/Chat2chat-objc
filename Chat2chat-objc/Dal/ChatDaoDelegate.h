//
//  ChatDaoDelegate.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 17.07.2021.
//

#import <Foundation/Foundation.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ChatDaoDelegate <NSObject>

- (void)getNewMessage:(Message*)message;
- (void)chatEnded;

@end

NS_ASSUME_NONNULL_END
