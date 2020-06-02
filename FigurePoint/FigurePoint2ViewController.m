//
//  FigurePoint2ViewController.m
//  CoreConcept
//
//  Created by rjb on 2020/6/1.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "FigurePoint2ViewController.h"
#import "HTTPTool.h"
#import "PointFigureView.h"
#import "PointFigureDataProcesser.h"

@interface FigurePoint2ViewController ()
@property (nonatomic,strong) PointFigureView *figureView;
@end

@implementation FigurePoint2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.figureView = [[PointFigureView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.figureView];
    
    [[HTTPTool tool] getData:@"" complation:^(NSArray<KLineModel *> * _Nonnull models) {
        PointFigureDataProcesser *processer = [[PointFigureDataProcesser alloc]init];
        processer.gezhi = 1000;
        processer.pointArray = models;
        self.figureView.processer = processer;
    }];
   
}

@end
