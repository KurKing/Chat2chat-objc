//
//  InterlocutorMessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import "InterlocutorMessageTableViewCell.h"

@interface InterlocutorMessageTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *messageTextLabel;
@property (weak, nonatomic) IBOutlet UIView *textBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

@end

@implementation InterlocutorMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.avatarImage.layer.cornerRadius = 20;
    self.textBackgroundView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSString *)identifier {
    return @"InterlocutorMessageTableViewCell";
}

- (void)setMessageText:(NSString *)text {
    self.messageTextLabel.text = text;
}

@end
