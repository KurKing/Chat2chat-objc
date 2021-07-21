//
//  ChatViewModel.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 12.07.2021.
//

#import "ChatViewModel.h"
#import "ChatViewController.h"
#import "ChatDao.h"
#import "FirestoreChatDao.h"

@interface ChatViewModel ()

@property (strong, nonatomic) NSMutableArray* messages;
@property (strong, nonatomic) id<ChatDao> dao;
@property (weak, nonatomic) ChatViewController* contoller;

@end

@implementation ChatViewModel

- (void)setupWithController:(ChatViewController *)controller {
    self.contoller = controller;
    self.dao = [[FirestoreChatDao alloc] init];
    self.dao.delegate = self;
    self.messages = [NSMutableArray new];
    
    [self startChat];
}

- (BOOL)isMessagesEmpty {
    return self.messages.count == 0;
}

- (NSInteger)messagesCount {
    return self.messages.count;
}

- (Message*)getMessageWithIndex:(NSInteger)index {
    if (index >= self.messagesCount) { return nil; }
    return self.messages[index];
}

- (void)sendMessageWithText:(NSString *)text {
    Message* message = [[Message alloc] initWithText: text  messageId:[[NSUUID UUID] UUIDString] type:MyMessage];
    [self.dao sendMessage: message];
}

- (void)startChat {
    [self.contoller showLoadingView];
    [self.dao startChat];
}

- (void)endChat {
    
}

#pragma mark - ChatDaoDelegate
- (void)getNewMessage:(nonnull Message *)message {
    if (message.type != FirstMessage) {
        Message *firstMessage = self.messages[0];
        if (firstMessage.type == FirstMessage) {
            [self.messages removeObjectAtIndex:0];
        }
    }
    
    [self.messages addObject: message];
    [self.contoller hideLoadingView];
    [self.contoller reloadData];
}

- (void)chatEnded {
    [self.messages removeAllObjects];
    [self.contoller reloadData];
    [self.contoller showDeletedChatAlert];
}

@end
