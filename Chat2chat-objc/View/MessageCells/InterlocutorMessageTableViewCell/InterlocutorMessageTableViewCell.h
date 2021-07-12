//
//  InterlocutorMessageTableViewCell.h
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import <UIKit/UIKit.h>
#import "MessageTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface InterlocutorMessageTableViewCell : MessageTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

@end

NS_ASSUME_NONNULL_END
