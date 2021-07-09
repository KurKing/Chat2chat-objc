//
//  SelfMessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 09.07.2021.
//

#import "SelfMessageTableViewCell.h"

@implementation SelfMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSString *)identifier {
    return @"SelfMessageTableViewCell";
}

@end
