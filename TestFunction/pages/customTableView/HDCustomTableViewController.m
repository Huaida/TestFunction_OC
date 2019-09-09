//
//  HDCustomTableViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/9/6.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDCustomTableViewController.h"
#import "MZCustomTableView.h"

@interface HDCustomTableViewController ()<NSURLSessionDelegate>
@property (nonatomic ,strong) MZCustomTableView *tableView;
@end

@implementation HDCustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor whiteColor];
//    [self customAddSubviews];
    
    [self testShortLink];
}
- (void)customAddSubviews{
    self.tableView = [[MZCustomTableView alloc] initWithFrame:CGRectMake(0, 100, MZ_SW, MZ_SH-100) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    NSArray *dataArray = @[@[@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3],@[@1]];
    self.tableView.dataArray = dataArray;
}
-(void)testShortLink{
//    http://link.t.zmengzhu.com/AS6
    //1.确定请求路径
    
    NSURL *url = [NSURL URLWithString:@"http://link.t.zmengzhu.com/AS6"];
    //2.创建请求对象
    //请求对象内部默认已经包含了请求头和请求方法（GET）
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //4.根据会话对象创建一个Task(发送请求）
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    
    //5.执行任务
    [dataTask resume];
    
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
     //在该方法中可以得到响应头信息，即response
     NSLog(@"didReceiveResponse--%@",[NSThread currentThread]);
     NSLog(@"response %@",response);
     NSLog(@"response.URL %@",response.URL.absoluteString);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, MZ_SW, 200)];
    label.text = response.URL.absoluteString;
//    [label sizeToFit];
    label.numberOfLines = 0;
//    label.center = self.view.center;
    [self.view addSubview:label];
    //注意：需要使用completionHandler回调告诉系统应该如何处理服务器返回的数据
    //默认是取消的
    /*
             NSURLSessionResponseCancel = 0,        默认的处理方式，取消
            NSURLSessionResponseAllow = 1,         接收服务器返回的数据
            NSURLSessionResponseBecomeDownload = 2,变成一个下载请求
            NSURLSessionResponseBecomeStream        变成一个流
            */
    
        completionHandler(NSURLSessionResponseAllow);
    }

//2.接收到服务器返回数据的时候会调用该方法，如果数据较大那么该方法可能会调用多次
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
     NSLog(@"didReceiveData--%@",[NSThread currentThread]);
     NSLog(@"data %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    //拼接服务器返回的数据
//    [self.responseData appendData:data];
    
}

//3.当请求完成(成功|失败)的时候会调用该方法，如果请求失败，则error有值
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"didCompleteWithError--%@",[NSThread currentThread]);
    
    if(error == nil)
         {
                   //解析数据,JSON解析请参考http://www.cnblogs.com/wendingding/p/3815303.html
//                  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:nil];
//                  NSLog(@"%@",dict);
              }
    }
@end
