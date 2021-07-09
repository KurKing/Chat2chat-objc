//
//  ChatViewController.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 01.07.2021.
//

#import "ChatViewController.h"
#import "SelfMessageTableViewCell.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *messagesTableView;
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
    
    self.messagesTableView.dataSource = self;
    self.messagesTableView.delegate = self;
    self.messagesTableView.tableFooterView = [UIView new];
    
    [self.messagesTableView registerNib:[UINib nibWithNibName:@"SelfMessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"SelfMessageTableViewCell"];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelfMessageTableViewCell *cell = [self.messagesTableView dequeueReusableCellWithIdentifier:@"SelfMessageTableViewCell"];

    [cell setMessageText: self.messages[indexPath.row]];
        
    return cell;
}

@end
