//
//  ChatViewController.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 01.07.2021.
//

#import "ChatViewController.h"
#import "SelfMessageTableViewCell.h"
#import "InterlocutorMessageTableViewCell.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIView *charView;
@property (weak, nonatomic) IBOutlet UITableView *messagesTableView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@property (strong, nonatomic) NSArray *messages;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning TODO
    self.messages = @[
        @"1",@"12345",
        @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ];
    
    // table view preparing
    self.messagesTableView.dataSource = self;
    self.messagesTableView.delegate = self;
    self.messagesTableView.tableFooterView = [UIView new];
    
    [self.messagesTableView registerNib:[UINib nibWithNibName: SelfMessageTableViewCell.identifier bundle: nil] forCellReuseIdentifier: SelfMessageTableViewCell.identifier];
    
    [self.messagesTableView registerNib:[UINib nibWithNibName: InterlocutorMessageTableViewCell.identifier bundle: nil] forCellReuseIdentifier: InterlocutorMessageTableViewCell.identifier];
    
    // keyboard hiding
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard:)];
    tap.cancelsTouchesInView = NO;
    [self.messagesTableView addGestureRecognizer: tap];
}

- (IBAction)sendMessageButtonPressed {
    NSLog(@"sendMessageButtonPressed");
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < 3) {
        SelfMessageTableViewCell *cell = [self.messagesTableView dequeueReusableCellWithIdentifier: SelfMessageTableViewCell.identifier];
        
        [cell setMessageText: self.messages[indexPath.row]];
        return  cell;
    }
    
    InterlocutorMessageTableViewCell *cell = [self.messagesTableView dequeueReusableCellWithIdentifier: InterlocutorMessageTableViewCell.identifier];
    
    [cell setMessageText: self.messages[indexPath.row-3]];
    return cell;
}

#pragma mark Keyboard
- (void) keyboardWillShow:(NSNotification *) notification {
    
}
- (void) keyboardWillHide:(NSNotification *) notification {
    
}
-(void) dissmissKeyboard:(NSNotification *) notification {
    [self.view endEditing:YES];
}

@end
