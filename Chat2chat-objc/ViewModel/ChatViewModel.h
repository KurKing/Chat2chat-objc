//
//  ChatViewModel.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 12.07.2021.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "ChatViewController.h"
#import "ChatDaoDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewModel : NSObject<ChatDaoDelegate>

- (void)setupWithController:(ChatViewController*)controller;

- (Message*)getMessageWithIndex:(NSInteger)index;
- (void)sendMessageWithText:(NSString*)text;
- (void)startChat;
- (void)endChat;

- (NSInteger)messagesCount;
- (BOOL)isMessagesEmpty;

@end

NS_ASSUME_NONNULL_END
