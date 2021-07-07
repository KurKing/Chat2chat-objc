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

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messagesTableView.dataSource = self;
    self.messagesTableView.delegate = self;
    self.messagesTableView.tableFooterView = [UIView new];
    
    [self.messagesTableView registerNib:[UINib nibWithNibName:@"SelfMessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"selfMessageTableViewCell"];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.messagesTableView dequeueReusableCellWithIdentifier:@"selfMessageTableViewCell"];
    if (cell == nil) {
        cell = [[SelfMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"selfMessageTableViewCell"];
    }
    return cell;
}

@end
