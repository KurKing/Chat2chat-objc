//
//  FirestoreChatDao.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 17.07.2021.
//

#import <Foundation/Foundation.h>
#import "ChatDao.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirestoreChatDao : NSObject<ChatDao>

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
