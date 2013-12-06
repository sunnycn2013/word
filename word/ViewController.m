//
//  ViewController.m
//  word
//
//  Created by Qeebu on 13-12-5.
//  Copyright (c) 2013年 Qeebu. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize fileInteractionController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    tempArray = [[NSMutableArray alloc] init];
    [tempArray addObject:@"aa.docx"];
    [tempArray addObject:@"扁平化设计初探.ppt"];
    [tempArray addObject:@"我们都能幸福着 官方版--音悦Tai.mp4"];
    [tempArray addObject:@"Cocos2d-x_中文API部分文档.pdf"];
    
    NSArray* array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, nil);
    NSString* path = [array objectAtIndex:0];
    NSLog(@"%@",path);
    NSFileManager* fm = [NSFileManager defaultManager];
    
    
    if ([fm fileExistsAtPath:@"/Users/qeebu/Library/Application Support/iPhone Simulator/7.0.3/Applications/1221B67B-6EAD-4D98-9105-3A11488E0ECD/Documents/aa.docx"]) {
        NSLog(@"1111");
        
        
    }else{
        NSLog(@"0000");
    }
    
    
   	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn:(id)sender {
    NSString* str = @"www.qeebu.com/wap/6月20号晨会.docx";
    
    NSArray* array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, nil);
    NSString* path = [array objectAtIndex:0];
    NSLog(@"%@",path);
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:@"~/Documents/Cacheaa.docx"]) {
        
        NSLog(@"77777");
    }
    str = @"/Documents/Cacheaa.docx";
    documentController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL URLWithString:str]];
    documentController.delegate = self;
    documentController.UTI = @"com.microsoft.word.doc";
    [documentController presentOpenInMenuFromRect:CGRectMake(760, 20, 100, 100) inView:self.view animated:YES];

}
- (IBAction)download:(id)sender {
   
    NSString* path = [[NSBundle mainBundle] pathForResource:@"aa" ofType:@"docx"];
    NSURL *file_URL = [NSURL fileURLWithPath:path];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        if (self.fileInteractionController == nil) {
            fileInteractionController = [[UIDocumentInteractionController alloc] init];
            
            fileInteractionController = [UIDocumentInteractionController interactionControllerWithURL:file_URL];
            fileInteractionController.delegate = self;
            //[fileInteractionController retain];
            
        }else {
            self.fileInteractionController.URL = file_URL;
        }
        
        [self.fileInteractionController presentPreviewAnimated:YES];
        
    }
    
}


- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)interactionController
{
    return self;
}

-(UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    NSLog(@"documentInteractionControllerDidEndPreview");
    return self.view;
}

- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController*)controller
{
    NSLog(@"documentInteractionControllerDidDismissOpenInMenu");
    return self.view.frame;
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tempArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdentifier = @"IDENTIFIER";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [tempArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* str = [tempArray objectAtIndex:indexPath.row];
    
    NSArray* file_nameArray = [str componentsSeparatedByString:@"."];
    NSString* path = [[NSBundle mainBundle] pathForResource:[file_nameArray objectAtIndex:0] ofType:[file_nameArray objectAtIndex:1]];
    NSURL *file_URL = [NSURL fileURLWithPath:path];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        if (self.fileInteractionController == nil) {
            fileInteractionController = [[UIDocumentInteractionController alloc] init];
            
            fileInteractionController = [UIDocumentInteractionController interactionControllerWithURL:file_URL];
            fileInteractionController.delegate = self;
            //[fileInteractionController retain];
            
        }else {
            self.fileInteractionController.URL = file_URL;
        }
        
        [self.fileInteractionController presentPreviewAnimated:YES];
        
    }

}


@end
