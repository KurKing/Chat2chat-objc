//
//  MessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.textBackgroundView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSString *)identifier {
    
    [NSException raise:@"Identifier not implemented" format:@"Identifier property should be override"];
    
    return @"MessageTableViewCell";
}

- (void)setMessageText:(NSString *)text {
    self.messageTextLabel.text = text;
}

@end
