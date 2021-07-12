//
//  Message.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 12.07.2021.
//

#import "Message.h"

@implementation Message

- (instancetype)initAsFirstMessageWithId:(NSString *)messageId {
    if (self = [super init]) {
        _messageId = messageId;
        _type = FirstMessage;
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text messageId:(NSString *)messageId type:(MessageType)type {
    if (type == FirstMessage) { return nil; }
    if (self = [super init]) {
        _text = text;
        _messageId = messageId;
        _type = type;
    }
    return self;
}

@end
