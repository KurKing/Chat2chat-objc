//
//  Message.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 12.07.2021.
//

#import <Foundation/Foundation.h>

typedef enum {
    MyMessage,
    InterlocutorMessage,
    FirstMessage
} MessageType;

NS_ASSUME_NONNULL_BEGIN

@interface Message : NSObject

@property (strong, nonatomic, readonly) NSString* messageId;
@property (strong, nonatomic, readonly) NSString* text;
@property (nonatomic, readonly) MessageType type;

- (instancetype) initAsFirstMessageWithId:(NSString*) messageId;
- (instancetype) initWithText:(NSString*) text messageId:(NSString*) messageId type:(MessageType) type;

@end

NS_ASSUME_NONNULL_END
