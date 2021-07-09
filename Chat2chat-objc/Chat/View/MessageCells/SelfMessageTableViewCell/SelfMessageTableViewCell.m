//
//  SelfMessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import "SelfMessageTableViewCell.h"

@interface SelfMessageTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *messageTextLabel;
@property (weak, nonatomic) IBOutlet UIView *textBackgroundView;

@end

@implementation SelfMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textBackgroundView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setMessageText:(NSString *)text {
    self.messageTextLabel.text = text;
}

@end
