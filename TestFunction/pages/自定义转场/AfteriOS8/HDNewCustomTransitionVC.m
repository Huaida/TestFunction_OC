//
//  HDNewCustomTransitionVC.m
//  TestFunction
//
//  Created by Cage on 2021/9/22.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDNewCustomTransitionVC.h"
#import "HDCrossDissolveFirstViewController.h"
#import "HDSwipeFirstViewController.h"
#import "HDCustomPresentationFirstViewController.h"

@interface HDNewCustomTransitionVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HDNewCustomTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self customAddSubviews];
}
-(void)customAddSubviews{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
//    tableView.allowsMultipleSelection = YES;
//    tableView.editing = YES;
    
    tableView.allowsSelection = YES;
    
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Cross Dissolve";
                    break;
                case 1:
                    cell.textLabel.text = @"Swipe";
                    break;
                case 2:
                    cell.textLabel.text = @"Custom Presentation";
                    break;
                case 3:
                    cell.textLabel.text = @"Adaptive Presentation";
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Checkerboard";
                    break;
                
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"Slide";
                    break;
                
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger number = 0;
    switch (section) {
        case 0:
            number = 4;
            break;
        case 1:
            number = 1;
            break;
        case 2:
            number = 1;
            break;
            
        default:
            break;
    }
    return number;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    return 3;
}
//// Default is 1 if not implemented
//
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section; {
    NSString *header = nil;
    switch (section) {
        case 0:
            header = @"Presentation Transitions";
            break;
        case 1:
            header = @"Navigation Controller Transitions";
            break;
        case 2:
            header = @"TabBar Controller Transitions";
            break;
            
        default:
            break;
    }
    return header;
}   // fixed font style. use custom view (UILabel) if you want something different
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;{
    return @"footer";
}

//
//// Moving/reordering
//
//// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    return proposedDestinationIndexPath;
}
//必须把编辑模式改成None，默认的是delete
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//
//    return UITableViewCellEditingStyleNone;
//
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    NSLog(@"%@",text);
    UIViewController *toVC;
    if ([text isEqualToString:@"Cross Dissolve"]) {
        toVC = [[HDCrossDissolveFirstViewController alloc] init];
        
    }
    if ([text isEqualToString:@"Swipe"]) {
        toVC = [[HDSwipeFirstViewController alloc] init];
    }
    if ([text isEqualToString:@"Custom Presentation"]) {
        toVC = [[HDCustomPresentationFirstViewController alloc] init];
    }
    if (toVC) {
        
        [self presentViewController:toVC animated:YES completion:^{
            
        }];
    }
}
@end
