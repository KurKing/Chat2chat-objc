//
//  FirestoreChatDao.m
//  Chat2chat-objc
//
//  Created by Oleksiy on 17.07.2021.
//

#import "FirestoreChatDao.h"
#import "Message.h"
@import Firebase;

@interface FirestoreChatDao ()

@property (strong, nonatomic) FIRFirestore* db;
@property (strong, nonatomic) id<FIRListenerRegistration> listener;
@property (strong, nonatomic) NSString* currentChatId;
@property (strong, nonatomic) NSString* userToken;

@end

@implementation FirestoreChatDao

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.db = [FIRFirestore firestore];
        self.userToken = [[[NSUUID alloc] init] UUIDString];
    }
    return self;
}

- (void)startChat {
    FIRQuery *docRef = [[[self.db collectionWithPath:@"Chats"]
                         queryWhereField:@"isFree" isEqualTo:@YES]
                        queryLimitedTo:10];
    
    __weak typeof(self) weakSelf = self;
    [docRef getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (snapshot == nil) { return; }
        if (weakSelf == nil) { return; }
        __strong typeof(self) strongSelf = weakSelf;
        
        if (snapshot.isEmpty) {
            
            NSString* newChatId = [[[NSUUID alloc] init] UUIDString];
            FIRDocumentReference *newChatRef = [[strongSelf.db collectionWithPath:@"Chats"] documentWithPath: newChatId];
            
            [newChatRef setData:@{
                @"isFree": @YES,
                @"User1": @"Unknown",
                @"User2": @"-",
                @"time": [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]]
            }];
            
            [strongSelf addListenerToChatWithId:newChatId];
            self.currentChatId = newChatId;
            
        } else {
            
            NSString* newChatId = snapshot.documents[arc4random_uniform(snapshot.documents.count)].documentID;
            
            [[[strongSelf.db collectionWithPath:@"Chats"] documentWithPath:newChatId]
             updateData:@{
                 @"isFree": @NO,
                 @"User2": @"Unknown"
             }];
            
            self.currentChatId = newChatId;
            [self sendMessage: [[Message alloc] initAsFirstMessageWithId:[[[NSUUID alloc] init] UUIDString]]];
            
            [self addListenerToChatWithId:newChatId];
            
        }
    }];
}

- (void)endChat { 
    
}

- (void)sendMessage:(Message*)message {
    if (self.currentChatId == nil) { return; }
    
    FIRDocumentReference *messageDocument = [[[[self.db collectionWithPath:@"Chats"] documentWithPath:self.currentChatId] collectionWithPath:@"Messages"] documentWithPath:message.messageId];
        
    [messageDocument setData:@{
        @"text": message.text,
        @"userToken": self.userToken,
        @"time": [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]]
    }];
}

- (void)addListenerToChatWithId:(NSString*)chatId {
    __weak typeof(self) weakSelf = self;
    self.listener = [[[[self.db collectionWithPath:@"Chats"] documentWithPath:chatId] collectionWithPath:@"Messages"] addSnapshotListener:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (snapshot == nil) { return; }
        if (weakSelf == nil) { return; }
        __strong typeof(self) strongSelf = weakSelf;
        
        for (FIRDocumentChange* diff in snapshot.documentChanges) {
            if (diff.type == FIRDocumentChangeTypeAdded) {
                NSDictionary<NSString *, id> *data = diff.document.data;
                NSString* text = data[@"text"];
                
                MessageType type;
                NSString* userToken = data[@"userToken"];
                if ([userToken isEqualToString:self.userToken]) {
                    type = MyMessage;
                } else {
                    type = InterlocutorMessage;
                }
                
                Message* message = [[Message alloc] initWithText:text messageId:diff.document.documentID type:type];
                
                [strongSelf.delegate getNewMessage:message];
            } else if (diff.type == FIRDocumentChangeTypeRemoved) {
                [self.listener remove];
                [self.delegate chatEnded];
            }
        }
    }];
}

@end
