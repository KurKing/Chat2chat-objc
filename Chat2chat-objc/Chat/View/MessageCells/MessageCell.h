//
//  MessageCell.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MessageCell <NSObject>

+ (NSString*)identifier;
- (void)setMessageText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
