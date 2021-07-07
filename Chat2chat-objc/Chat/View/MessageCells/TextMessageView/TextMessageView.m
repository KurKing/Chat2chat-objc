//
//  TextMessageView.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 01.07.2021.
//

#import "TextMessageView.h"

@interface TextMessageView ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation TextMessageView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self = [self initializeSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self initializeSubviews];
    }
    return self;
}

- (instancetype)initializeSubviews {
    id view =   [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];

    return view;
}

- (void)setLabelText:(NSString *)text {
    self.textLabel.text = text;
}

@end
