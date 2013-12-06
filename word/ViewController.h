//
//  ViewController.h
//  word
//
//  Created by Qeebu on 13-12-5.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIDocumentInteractionControllerDelegate,
UITableViewDataSource,UITableViewDelegate
>{
    UIDocumentInteractionController* documentController;
    UIDocumentInteractionController* fileInteractionController;
    
    NSMutableArray* tempArray;
}

@property (nonatomic,retain) UIDocumentInteractionController* fileInteractionController;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)btn:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *down;
- (IBAction)download:(id)sender;

@end
