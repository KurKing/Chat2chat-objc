//
//  ChatViewController.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 01.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : UIViewController

- (void)reloadData;
- (void)showDeletedChatAlert;

@end

NS_ASSUME_NONNULL_END
