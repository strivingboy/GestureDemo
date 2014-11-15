//
//  EdgePan.m
//  GesturesDemo
//
//  Created by hailong on 14/11/15.
//  Copyright (c) 2014年 Appcoda. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController()

@property (weak, nonatomic) IBOutlet UIView *showView;

@end

@implementation EdgePanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 创建屏幕边缘手势(优先级高于其他手势)
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]
                                                                  initWithTarget:self
                                                                  action:@selector(handleEdgePanWithGestureRecognizer:)];
    edgePanGestureRecognizer.edges = UIRectEdgeLeft;           // 左侧边缘响应
    [self.view addGestureRecognizer:edgePanGestureRecognizer]; // view添到self.view上
    
}


-(void)handleEdgePanWithGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)gesture
{
    if(UIGestureRecognizerStateBegan == gesture.state ||
       UIGestureRecognizerStateChanged == gesture.state)
    {
        // 根据被触摸手势的view计算得出坐标值
        CGPoint translation = [gesture translationInView:gesture.view];
        _showView.center = CGPointMake(self.view.bounds.size.width / 2 + translation.x, self.view.bounds.size.height);
    }
}


@end
