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
    
//    [self.messages addObject:[[Message alloc] initWithText:<#(nonnull NSString *)#> messageId:<#(nonnull NSString *)#> type:<#(MessageType)#>]
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
#warning TODO
}

- (void)endChat {
#warning TODO
}

@end
