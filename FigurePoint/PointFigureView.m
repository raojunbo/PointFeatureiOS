//
//  PointFigureView.m
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "PointFigureView.h"

@interface PointFigureView ()
@property (nonatomic, strong)UIScrollView *pointScrollView;
@end
@implementation PointFigureView

- (void)setProcesser:(PointFigureDataProcesser *)processer {
    _processer = processer;
   
    [self printFigure];
}

- (void)printFigure {
    if (self.pointScrollView) {
        for (int i = 0; i< self.pointScrollView.subviews.count; i++) {
            id view = self.pointScrollView.subviews[i];
            [view removeFromSuperview];
        }
    }else {
        self.pointScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 0, [UIScreen mainScreen].bounds.size.width - 40, [UIScreen mainScreen].bounds.size.height)];
        [self addSubview:self.pointScrollView];
    }
    CGFloat lineHeigh = self.frame.size.height/self.processer.figurePointArray.count;
//    lineHeigh = 30;
    self.pointScrollView.contentSize = CGSizeMake(self.processer.figurePointArray.count *lineHeigh, self.bounds.size.height);
    self.pointScrollView.scrollEnabled = YES;
   
    //打印点数图
    for (int i = 0; i< self.processer.figurePointArray.count; i++) {
//        printf("%d",((int)self.processer.maxAll/self.gezhi -i) *self.gezhi);
        UILabel *zhongLabel = [[UILabel alloc]init];
        zhongLabel.textAlignment = NSTextAlignmentCenter;
        int zhongTitle = ((int)self.processer.maxAll/self.processer.gezhi -i) *self.processer.gezhi;
        zhongLabel.text = [NSString stringWithFormat:@"%d", zhongTitle];
        zhongLabel.frame = CGRectMake(0, i * lineHeigh, lineHeigh, lineHeigh);
        [self addSubview:zhongLabel];
        
        NSMutableArray *lineArray = self.processer.figurePointArray[i];
        for (int j  = 0; j<lineArray.count ; j++) {
            FigurePoint *figurePoint = lineArray[j];
            if (figurePoint.type == -1) {
                printf(" ");
            }else{
                printf("%s",figurePoint.type ==0 ?"o":"x");
            }
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(j * lineHeigh, i* lineHeigh, lineHeigh, lineHeigh)];
            label.textAlignment = NSTextAlignmentCenter;
            NSString *title = @"";
            if(figurePoint.type == 0){
                title = @"O";
            }else if(figurePoint.type == 1){
                title = @"X";
            }
            label.text = title;
            [self.pointScrollView addSubview:label];
            
        }
    }
}

@end
