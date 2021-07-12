//
//  InterlocutorMessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import "InterlocutorMessageTableViewCell.h"


@implementation InterlocutorMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.avatarImage.layer.cornerRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSString *)identifier {
    return @"InterlocutorMessageTableViewCell";
}

@end
