//
//  SelfMessageTableViewCell.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 01.07.2021.
//

#import "SelfMessageTableViewCell.h"
#import "TextMessageView.h"

@interface SelfMessageTableViewCell ()

//@property (weak, nonatomic) IBOutlet TextMessageView *messageView;

@end

@implementation SelfMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
