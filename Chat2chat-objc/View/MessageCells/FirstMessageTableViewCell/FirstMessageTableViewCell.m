//
//  FirstMessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 21.07.2021.
//

#import "FirstMessageTableViewCell.h"

@interface FirstMessageTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *textMessageLabel;

@end

@implementation FirstMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textMessageLabel.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSString *)identifier {
    return @"FirstMessageTableViewCell";
}

+ (NSString *)text {
    return @"Chat started! Say hello to your interlocutor";
}

@end
