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
@property (weak, nonatomic) ChatViewController* contoller;
@property (strong, nonatomic) id<ChatDao> dao;

@end

@implementation ChatViewModel

- (void)setupWithController:(ChatViewController *)controller {
    self.contoller = controller;
    self.dao = [[FirestoreChatDao alloc] init];
    self.dao.delegate = self;
    self.messages = [NSMutableArray new];
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
    [self.messages addObject: [[Message alloc] initWithText: text  messageId:[[NSUUID UUID] UUIDString] type:MyMessage]];
    [self.contoller reloadData];
}

- (void)endChat {
    
}

@end
