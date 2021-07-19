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
    self.messages = [NSMutableArray new];
    
    // add mock data
    [self createMessages];
#warning test
    [self.dao startChat];
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

// temporary
- (void)createMessages {
    [self.messages addObject:[[Message alloc] initRandomIdMessageWithText:@"1" type:MyMessage]];
    [self.messages addObject:[[Message alloc] initRandomIdMessageWithText:@"12345"  type:MyMessage]];
    [self.messages addObject:[[Message alloc] initRandomIdMessageWithText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  type:MyMessage]];
    
    [self.messages addObject:[[Message alloc] initRandomIdMessageWithText:@"1"  type:InterlocutorMessage]];
    [self.messages addObject:[[Message alloc] initRandomIdMessageWithText:@"12345"  type:InterlocutorMessage]];
    [self.messages addObject:[[Message alloc] initRandomIdMessageWithText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  type:InterlocutorMessage]];
}

@end
