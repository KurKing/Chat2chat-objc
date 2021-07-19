//
//  ChatDao.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 17.07.2021.
//

#import <Foundation/Foundation.h>
#import "ChatDaoDelegate.h"
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ChatDao <NSObject>

@property (weak, nonatomic) id<ChatDaoDelegate> delegate;

- (void)startChat;
- (void)endChat;
- (void)sendMessage:(Message*)message;

@end

NS_ASSUME_NONNULL_END
