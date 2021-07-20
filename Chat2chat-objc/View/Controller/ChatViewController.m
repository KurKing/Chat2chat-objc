//
//  ChatViewController.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 01.07.2021.
//

#import "ChatViewController.h"
#import "SelfMessageTableViewCell.h"
#import "InterlocutorMessageTableViewCell.h"
#import "MessageTableViewCell.h"
#import "ChatViewModel.h"
#import "Message.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIView *chatView;
@property (weak, nonatomic) IBOutlet UIView *messageTypingView;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraintForChatView;
@property (weak, nonatomic) IBOutlet UITableView *messagesTableView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@property (strong, nonatomic) IBOutlet ChatViewModel *viewModel;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.viewModel setupWithController:self];
    [self setUpTableView];
    [self setUpKeyboard];
    
    self.loadingView.layer.cornerRadius = 7;
}

- (IBAction)sendMessageButtonPressed {
    
    NSString *message = [self.messageTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (![message isEqualToString:@""]) {
        [self.viewModel sendMessageWithText:message];
    }
    
    self.messageTextField.text = @"";
    [self dissmissKeyboard];
    [self scrollToLastRow];
}

- (void)reloadData {
    [self.messagesTableView reloadData];
}

- (void)showLoadingView {
    self.messageTypingView.userInteractionEnabled = NO;
    self.loadingView.alpha = 1;
}

- (void)hideLoadingView {
    self.messageTypingView.userInteractionEnabled = YES;
    self.loadingView.alpha = 0;
}

- (void)showDeletedChatAlert {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Your interlocutor has finished chat" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        if (weakSelf == nil) { return; }
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf.viewModel startChat];
    }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark UITableView

- (void)scrollToLastRow {
    if (!self.viewModel.isMessagesEmpty) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.viewModel.messagesCount-1) inSection:0];
        [self.messagesTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

- (void) setUpTableView {
    self.messagesTableView.dataSource = self;
    self.messagesTableView.delegate = self;
    self.messagesTableView.tableFooterView = [UIView new];
    
    [self.messagesTableView registerNib:[UINib nibWithNibName: SelfMessageTableViewCell.identifier bundle: nil] forCellReuseIdentifier: SelfMessageTableViewCell.identifier];
    
    [self.messagesTableView registerNib:[UINib nibWithNibName: InterlocutorMessageTableViewCell.identifier bundle: nil] forCellReuseIdentifier: InterlocutorMessageTableViewCell.identifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.messagesCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Message *message = [self.viewModel getMessageWithIndex:indexPath.row];
    MessageTableViewCell *cell;
    
    if (message.type == MyMessage) {
        cell = [self.messagesTableView dequeueReusableCellWithIdentifier: SelfMessageTableViewCell.identifier];
    } else {
        cell = [self.messagesTableView dequeueReusableCellWithIdentifier: InterlocutorMessageTableViewCell.identifier];
    }
    
    [cell setMessageText: message.text];
    
    return cell;
}

#pragma mark Keyboard
- (void) setUpKeyboard {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboard:)];
    tap.cancelsTouchesInView = NO;
    [self.messagesTableView addGestureRecognizer: tap];
}

- (void) keyboardWillShow:(NSNotification *) notification {
    NSValue *keyboardSize = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    if (keyboardSize == nil) { return; }
    
    CGFloat heigth = [keyboardSize CGRectValue].size.height;
    
    self.bottomConstraintForChatView.constant = heigth;
    [self.view layoutIfNeeded];
    
    [self scrollToLastRow];
}

- (void) keyboardWillHide:(NSNotification *) notification {
    self.bottomConstraintForChatView.constant = 0;
    [self.view layoutIfNeeded];
}

- (void) dissmissKeyboard:(NSNotification *) notification {
    [self dissmissKeyboard];
}

- (void) dissmissKeyboard {
    [self.view endEditing:YES];
}

@end
