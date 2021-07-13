//
//  ChatViewModel.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 12.07.2021.
//

#import "ChatViewModel.h"
#import "ChatViewController.h"

@interface ChatViewModel ()

@property (strong, nonatomic) NSMutableArray* messages;
@property (weak, nonatomic) ChatViewController* contoller;

@end

@implementation ChatViewModel

- (void)setupWithController:(ChatViewController *)controller {
    self.contoller = controller;
    self.messages = [NSMutableArray new];
    
    // TODO
    [self.messages addObject:[[Message alloc] initWithText:@"1" messageId:@"0" type:MyMessage]];
    [self.messages addObject:[[Message alloc] initWithText:@"12345" messageId:@"1" type:MyMessage]];
    [self.messages addObject:[[Message alloc] initWithText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." messageId:@"2" type:MyMessage]];
    
    [self.messages addObject:[[Message alloc] initWithText:@"1" messageId:@"3" type:InterlocutorMessage]];
    [self.messages addObject:[[Message alloc] initWithText:@"12345" messageId:@"4" type:InterlocutorMessage]];
    [self.messages addObject:[[Message alloc] initWithText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." messageId:@"5" type:InterlocutorMessage]];
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
}

- (void)endChat {
}

@end
