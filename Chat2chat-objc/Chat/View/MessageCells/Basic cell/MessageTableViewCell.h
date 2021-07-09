//
//  MessageTableViewCell.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *messageTextLabel;
@property (weak, nonatomic) IBOutlet UIView *textBackgroundView;

+ (NSString *)identifier;
- (void)setMessageText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
