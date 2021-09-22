//
//  HDCustomTransitionViewController.m
//  TestFunction
//
//  Created by Cage on 2021/9/17.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCustomTransitionViewController.h"
#import "HDCustomTransitionFirstVC.h"
#import "HDCustomTransitionSecondVC.h"
#import "HDCustomTransitionThirdVC.h"

@interface HDCustomTransitionViewController ()
@property (nonatomic, strong) UIViewController *currentVC ;
@property (nonatomic, strong) HDCustomTransitionFirstVC *firstViewController ;
@property (nonatomic, strong) HDCustomTransitionSecondVC *secondViewController ;
@property (nonatomic, strong) HDCustomTransitionThirdVC *thirdViewController ;
@end

@implementation HDCustomTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transitionNotify:) name:kVCTransitionNotification object:nil];
    
    
    
    
    
    
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self customAddSubviews];
}
- (void)transitionNotify:(NSNotification *)notify{
    NSNumber *number = (NSNumber *)notify.object;
    NSLog(@"%@",number);
    [self transitionWithNumber:number];
}

-(void)customAddSubviews{
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:clickButton];
    clickButton.frame = CGRectMake(200, 200, 100, 100);
    clickButton.backgroundColor = [UIColor blueColor];
    [clickButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];

    // 对于不显示的子ViewController，要用addChildViewController方法，将其添加到父ViewController中

       HDCustomTransitionFirstVC * firstViewController =[HDCustomTransitionFirstVC new];
    self.firstViewController = firstViewController;
       [self addChildViewController:firstViewController];



     HDCustomTransitionSecondVC*  secondViewController= [HDCustomTransitionSecondVC new];
    self.secondViewController = secondViewController;
       [self addChildViewController:secondViewController];



    HDCustomTransitionThirdVC* thirdViewController=[HDCustomTransitionThirdVC new];
    self.thirdViewController = thirdViewController;
       [self addChildViewController:thirdViewController];



        // 需要显示的子ViewController，要将其View添加到父View中

       [self.view addSubview:thirdViewController.view];

       _currentVC = thirdViewController;
    
}
-(void)buttonClick{
    
    NSLog(@"%s",__func__);
    
}
// iOS 5.0 以前自定义转场的方式
//
/// 自定义过度的两个VC必须有同一个ParentVC，调用的辅助方法（willMoveToParentViewController）有通知子VC的作用
/// @param number 1.- (void)willMoveToParentViewController:(UIViewController *)parent;
//在添加或移除view controller之前被调用。
//当你的view controller需要知道它已经被添加到一个容器中时，它能重写这个方法。
//如果你正实现一个你自己的容器view controller，在调用removeFromParentViewController:方法之前，它必须调用这子view controller的willMoveToParentViewController:方法，然后传入nil。
//当你自定义的容器调用addChildViewController:方法时，它自动调用将被作为子代添加的view controller的willMoveToParentViewController:方法。
//
//parent 父view controller，如果没有就传nil
//
//2.- (void)removeFromParentViewController;
//从父代移除这个view controller。
//这个方法只被一个自定义的容器view controller实现时试图调用，如果你重写这个方法，你必须在你的实现里调用super。
//
//3.- (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated;
//告诉一个子controller，他的外观将要改变。
//如果你正实现一个自定义的容器controller，用这个方法告诉它的子代那它的view将要显示或者消失。不直接调用viewWillAppear:,viewWillDisappear:,viewDidAppear:,或者viewDidDisappear。
//
//isAppearing 如果子view controller将要被添加进view层级内，是YES；如果被移除就是NO。
//animated 如果是YES，过渡将是动画的。
//
//4.- (void)endAppearanceTransition;
//告诉子controller，它的外观已经被改变。
//如果你正实现一个自定义的容器controller，用这个方法告诉子代，view的过渡已经完成。

-(void)transitionWithNumber:(NSNumber *)number{
    
    [_currentVC willMoveToParentViewController:nil];
        switch (number.intValue) {

           case 1:{

              NSLog(@"留言及回复");

              [self transitionFromViewController:_currentVC

                             toViewController:self.secondViewController

                                    duration:3

                                         options:UIViewAnimationOptionTransitionCurlUp

                                  animations:^{

                                      // NOPS；
                  

                                   }

                                  completion:^(BOOL finished) {

                                      if (finished) {
                                          
                                         _currentVC=self.secondViewController;
                                          [_currentVC didMoveToParentViewController:self];
                                      }else{

                                          

                                      }

                                   }];

           }

              break;

           case 2:{

              NSLog(@"生日提醒");

              [self transitionFromViewController:_currentVC

                             toViewController:self.thirdViewController

                                    duration:1

                                    options:UIViewAnimationOptionTransitionCurlDown

                                  animations:^{

                                   }

                                  completion:^(BOOL finished) {

                                      

                                          
                                         _currentVC=self.thirdViewController;
                                          [_currentVC didMoveToParentViewController:self];

                                   }];

              

              

           }

              

              break;

           case 3:

           {

              NSLog(@"好友申请");
               NSLog(@"%@",_currentVC.parentViewController);
              [self transitionFromViewController:_currentVC

                             toViewController:self.firstViewController

                                    duration:1

                                    options:UIViewAnimationOptionTransitionFlipFromTop

                                  animations:^{

                                   }

                                  completion:^(BOOL finished) {

                  
                 _currentVC=self.firstViewController;
                  [_currentVC didMoveToParentViewController:self];

                                   }];

           }

              break;

           default:

              break;

        }
}
@end
