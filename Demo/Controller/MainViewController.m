//
//  ViewController.m
//  网易新闻
//
//  Created by wleleven on 16/6/15.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import "MainViewController.h"
#import "TopLineViewController.h"
#import "HotViewController.h"
#import "SocietyViewController.h"
#import "VideoViewController.h"
#import "ReaderViewController.h"
#import "ScienceViewController.h"
#import "CollectionViewCell.h"
#import "CenterView.h"
#import "BottomView.h"
#import "CommonFile.h"
#import "UIColor+HexString.h"

/** 按钮之间的间距(滚动时按钮之间的间距) */
static CGFloat const margin = 15;
static CGFloat const labelW = 100;
static CGFloat const radio = 1.3;

#define KPRODUCTCELLID @"product"

#define WLScreenW [UIScreen mainScreen].bounds.size.width
#define WLScreenH [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,CenterViewDelegate,BottomViewDelegate>
@property (nonatomic, strong) UILabel *selLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic, strong) NSMutableArray *titleLabels;

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)CenterView *centerView;

@property (nonatomic,strong)BottomView *bottomView;

@property (nonatomic,strong)NSMutableArray *titleArray;

@property (nonatomic,strong)NSString *content;

@property (nonatomic,strong)UIScrollView *scrollView;



@end

@implementation MainViewController


NSInteger _selectCurrentIndex = 0;


-(NSMutableArray *)titleArray
{
    if (_titleArray == nil) {
        self.titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

- (NSMutableArray *)titleLabels
{
    if (_titleLabels == nil) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
    
    // 添加所有子控制器
    [self setUpChildViewController];
    
 
    
    // iOS7会给导航控制器下所有的UIScrollView顶部添加额外滚动区域
    // 不想要添加
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    // 添加所有子控制器对应标题
    [self setUpTitleLabel];
    
   // [self setUpScrollView];
    
    [self configCollectionView];
    
    [self setupCenterView];
    
//    [self setupBottomView];
}

-(void)setupBottomView
{
    BottomView *bottomView = [BottomView view];
    bottomView.delegate = self;
    bottomView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    bottomView.content = _content;
    bottomView.frame = CGRectMake(0, WLScreenH - 110, WLScreenW, 110);
    [self.view addSubview:bottomView];
    self.bottomView = bottomView;
}

-(void)loadData
{
    /**
     
     软黄金眼部单品系列  软黄金亮眸锦囊  软黄金美眸锦囊
     
     海洋之星木亿系列  海洋之钻透白系列  海洋之梦无痕系列  海洋之恋安肤系列  水凝无暇靓妆系列  
     
     单方精油   复方精油  基础油   纯露系列  
     
     海洋之星紧致锦囊 海洋之钻透白锦囊 情侣鼻护锦囊
     
     丰韵冉婷锦囊  金巢赋活锦囊  五元素调理锦囊
     
     **/
    
    
    self.titleArray = [NSMutableArray arrayWithArray:@[@[@"软黄金眼部单品系列",@"软黄金亮眸锦囊",@"软黄金美眸锦囊"],@[@"海洋之星木亿系列",@"海洋之钻透白系列",@"海洋之梦无痕系列",@"海洋之恋安肤系列",@"水凝无暇靓妆系列"],@[@"单方精油",@"复方精油",@"基础油",@"纯露系列"],@[@"海洋之星紧致锦囊",@"海洋之钻透白锦囊",@"情侣鼻护锦囊"],@[@"丰韵娉婷锦囊",@"金巢赋活锦囊",@"五元素调理锦囊"]]];
    
    _content = @"        测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测 测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测 测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测";
    
    [self.collectionView reloadData];
}

-(void)setupCenterView
{
    CenterView *centerView = [CenterView view];
    centerView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    centerView.delegate = self;
    CGRect rect = centerView.frame;
    rect.origin.y = 44+64;
    rect.size.width = WLScreenW;
    rect.size.height = WLScreenH-108;
    centerView.frame = rect;
    centerView.titleArray = self.titleArray[_selectCurrentIndex];
    centerView.currentIndex = 0;
    [self.view addSubview:centerView];
    
    
    NSLog(@"%@",NSStringFromCGRect(centerView.frame));
    
    self.centerView = centerView;
}

-(void)configCollectionView
{
    
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WLScreenW, 44)];
////    scrollView.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:scrollView];
//    self.scrollView = scrollView;
//    
//    CGFloat buttonX = 0;
//    CGFloat buttonY = 0;
//    CGFloat buttonH = 44;
//    
//    for (int i = 0; i<self.titleArray.count; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//        [btn setTitleColor:[UIColor blackColor] forState:0];
////        btn.backgroundColor = [UIColor redColor];
//        
//        // 计算内容的Size
//        CGSize buttonSize = [self sizeWithText:self.titleArray[i] font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(MAXFLOAT, buttonH)];
//        
//        // 计算内容的宽度
//        CGFloat buttonW = 2 * margin + buttonSize.width;
//        
//        [btn setTitle:self.titleArray[i] forState:0];
//        
//        //
//        // 设置尺寸
//        btn.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
//        
//        // 计算每个button的X值
//        buttonX = buttonX + buttonW;
//        //
//        
//        [self.scrollView addSubview:btn];
//        
//        if ((self.titleArray.count-1 == i)) {
//              self.scrollView.contentSize = CGSizeMake(buttonX+buttonW, 0);
//        }
//    }
//    
//    return;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(150, 40);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    
//    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 10, 50, 90);
    layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, WLScreenW, 44) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
    
//    _collectionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    _collectionView.backgroundColor = [UIColor colorWithHexString:@"#84cfe5"];
    
    UINib *nib =  [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:KPRODUCTCELLID];

}

// 初始化UIScrollView
- (void)setUpScrollView
{
    NSUInteger count = self.childViewControllers.count;
    self.titleScrollView.contentSize = CGSizeMake(count * labelW, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    
    // 设置内容滚动条
    self.contentScrollView.contentSize = CGSizeMake(count * WLScreenW, 0);
    // 开启分页
    self.contentScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    self.contentScrollView.bounces = NO;
    // 隐藏水平滚动条
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    
    self.contentScrollView.delegate = self;
}

-(void)setUpTitleLabel
{
    NSArray *titleArray = @[@"美肤单品系列",@"海洋之心眼部系列",@"蓝色梦幻精油系列",@"美疗锦囊系列",@"出水芙蓉SPA芳香系列"];
    
    NSUInteger count = titleArray.count;
    
    CGFloat labelX = 0;
    CGFloat labelY = 0;
    CGFloat labelH = 44;
    
    
    for (int i = 0; i < count; i++) {
        // 获取对应子控制器
//        UIViewController *vc = self.childViewControllers[i];
        
        // 创建label
        UILabel *label = [[UILabel alloc] init];
        
        
        // 计算内容的Size
        CGSize buttonSize = [self sizeWithText:titleArray[i] font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(MAXFLOAT, labelH)];
        
        // 计算内容的宽度
        CGFloat labelW = 2 * margin + buttonSize.width;
        
//        labelX = i * labelW;
//        
        // 设置尺寸
        label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        
        // 计算每个button的X值
        labelX = labelX + labelW;
//
//        // 设置label文字
//        label.text = vc.title;
        
        // 设置label文字
        label.text = titleArray[i];
        
        label.font = [UIFont systemFontOfSize:15];
        
        
        // 设置高亮文字颜色
        label.highlightedTextColor = [UIColor whiteColor];
        
        // 设置label的tag
        label.tag = i;
        
        
        
        // 设置用户的交互
        label.userInteractionEnabled = YES;
        
        // 文字居中
        label.textAlignment = NSTextAlignmentCenter;
        
        
        // 添加到titleLabels数组
        [self.titleLabels addObject:label];
        
        // 添加点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleClick:)];
        [label addGestureRecognizer:tap];
        
        // 默认选中第0个label
        if (i == 0) {
            [self titleClick:tap];
        }
        
        // 添加label到标题滚动条上
        [self.titleScrollView addSubview:label];
    }
}

// 点击标题的时候就会调用
- (void)titleClick:(UITapGestureRecognizer *)tap
{
    NSLog(@"%s",__FUNCTION__);
    
    UILabel *label = (UILabel *)tap.view;
    
    
    [self selectView:label];
    
    
    NSInteger index = tap.view.tag;
    
    NSLog(@"%ld",(long)index);
    
    _selectCurrentIndex = index;
    
    _centerView.titleArray = self.titleArray[_selectCurrentIndex];
    
    _centerView.currentIndex = 0;
    
    NSArray *cellsArray = [self.collectionView visibleCells];
    
    [cellsArray enumerateObjectsUsingBlock:^(CollectionViewCell *cell, NSUInteger index, BOOL * _Nonnull stop) {
        cell.backgroundColor = [UIColor clearColor];
    }];

    
////    [self collectionView:self.collectionView didDeselectItemAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
//    
    [self.collectionView reloadData];
//
//    
//    
//    [self collectionView:self.collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//  
//    CGFloat offsetX = index * WLScreenW;
//    self.contentScrollView.contentOffset = CGPointMake(offsetX, 0);
//    
//    [self showVc:index];
//    
//    [self setupTitleCenter:label];
}


-(void)showVc:(NSInteger)index
{
    CGFloat offsetX = index*WLScreenW;
    
    UIViewController *vc = self.childViewControllers[index];
    
    
    if (vc.isViewLoaded) {
        return;
    }
    
    vc.view.frame = CGRectMake(offsetX, 0, self.contentScrollView.bounds.size.width, self.contentScrollView.bounds.size.height);
    [self.contentScrollView addSubview:vc.view];
}


-(void)selectView:(UILabel *)label
{
    for (UILabel *label in self.titleLabels) {
        label.backgroundColor  = [UIColor whiteColor];
        label.textColor = [UIColor blackColor];
    }
    
    _selLabel.highlighted = NO;
    
    // 取消形变
    _selLabel.transform = CGAffineTransformIdentity;
    label.highlighted = YES;
    
    // 高大
//    label.transform = CGAffineTransformMakeScale(radio, radio);
    
    label.backgroundColor = [UIColor colorWithHexString:@"#84cfe5"];
    
    label.textColor = [UIColor whiteColor];
    
    // 颜色恢复
    _selLabel.textColor = [UIColor blackColor];
    
    _selLabel = label;
}

// 添加所有子控制器
- (void)setUpChildViewController
{
    // 头条
    TopLineViewController *topLine = [[TopLineViewController alloc] init];
    topLine.title = @"头条";
    [self addChildViewController:topLine];
    
    // 热点
    HotViewController *hot = [[HotViewController alloc] init];
    hot.title = @"热点";
    [self addChildViewController:hot];
    
    // 视频
    VideoViewController *video = [[VideoViewController alloc] init];
    video.title = @"视频";
    [self addChildViewController:video];
    
    
    // 社会
    SocietyViewController *society = [[SocietyViewController alloc] init];
    society.title = @"社会";
    [self addChildViewController:society];
    
    
    // 阅读
    ReaderViewController *reader = [[ReaderViewController alloc] init];
    reader.title = @"阅读";
    [self addChildViewController:reader];
    
    
    // 科技
    ScienceViewController *science = [[ScienceViewController alloc] init];
    science.title = @"科技";
    [self addChildViewController:science];
    
    return;
    
    /***********************/
    // 头条
    TopLineViewController *topLine1 = [[TopLineViewController alloc] init];
    topLine1.title = @"头条";
    [self addChildViewController:topLine1];
    
    // 热点
    HotViewController *hot1 = [[HotViewController alloc] init];
    hot1.title = @"热点";
    [self addChildViewController:hot1];
    
    // 视频
    VideoViewController *video1 = [[VideoViewController alloc] init];
    video1.title = @"视频";
    [self addChildViewController:video1];
    
    
    // 社会
    SocietyViewController *society1 = [[SocietyViewController alloc] init];
    society1.title = @"社会";
    [self addChildViewController:society1];
    
    
    // 阅读
    ReaderViewController *reader1 = [[ReaderViewController alloc] init];
    reader1.title = @"阅读";
    [self addChildViewController:reader1];
    
    
    // 科技
    ScienceViewController *science1 = [[ScienceViewController alloc] init];
    science1.title = @"科技";
    [self addChildViewController:science1];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat curPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    // 左边label角标
    NSInteger leftIndex = curPage;
    // 右边的label角标
    NSInteger rightIndex = leftIndex + 1;
    
    
    // 获取左边的label
    UILabel *leftLabel = self.titleLabels[leftIndex];
    
    // 获取右边的label
    UILabel *rightLabel;
    if (rightIndex < self.titleLabels.count-1) {
        rightLabel = self.titleLabels[rightIndex];
    }
    
    CGFloat rightScale = curPage - leftIndex;
    CGFloat leftScale = 1- rightScale;
    
    // 左边缩放
    leftLabel.transform = CGAffineTransformMakeScale(leftScale * 0.3 + 1, leftScale * 0.3+ 1);
    
    // 右边缩放
    rightLabel.transform = CGAffineTransformMakeScale(rightScale * 0.3 + 1, rightScale * 0.3+ 1);
    
    
    // 设置文字颜色渐变
    /*
     R G B
     黑色 0 0 0
     红色 1 0 0
     */
    
    
//    leftLabel.textColor = [UIColor colorWithRed:leftScale green:0 blue:0 alpha:1];
//    rightLabel.textColor = [UIColor colorWithRed:rightScale green:0 blue:0 alpha:1];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    
//    [self showVc:index];
    
//    UILabel *selLabel = self.titleLabels[index];
    
//    [self selectView:selLabel];
    
//    [self setupTitleCenter:selLabel];
    
}

-(void)setupTitleCenter:(UILabel *)label
{
    CGFloat offsetX = label.center.x - WLScreenW * 0.5;
    if (offsetX<0) {
        offsetX = 0;
    }
    CGFloat maxOffsetX = self.titleScrollView.contentSize.width - WLScreenW;
    if (offsetX>maxOffsetX) {
        offsetX = maxOffsetX;
    }
    
//    [self.titleScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}


#pragma mark -- UICollectionView代理

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = KPRODUCTCELLID;
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor purpleColor];
//    cell.iconView.backgroundColor = [UIColor yellowColor];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",self.titleArray[_selectCurrentIndex][indexPath.row]];
    cell.nameLabel.textAlignment = NSTextAlignmentCenter;
    cell.nameLabel.textColor =[UIColor colorWithHexString:@"#afe6f6"];
    [self collectionView:self.collectionView didDeselectItemAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]];
    
    return cell;
    
}
 
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.titleArray[_selectCurrentIndex] count];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld %ld",(long)indexPath.row,(long)indexPath.section);
    
    NSArray *cellsArray = [collectionView visibleCells];
    
    [cellsArray enumerateObjectsUsingBlock:^(CollectionViewCell *cell, NSUInteger index, BOOL * _Nonnull stop) {
        cell.backgroundColor = [UIColor clearColor];
        cell.nameLabel.textColor = [UIColor colorWithHexString:@"#afe6f6"];
    }];
    
    _centerView.currentIndex = indexPath.row;
    
    [self collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSArray *cellsArray = [collectionView visibleCells];
    
    [cellsArray enumerateObjectsUsingBlock:^(CollectionViewCell *cell, NSUInteger index, BOOL * _Nonnull stop) {
        cell.backgroundColor = [UIColor clearColor];
    }];
    
    CollectionViewCell *cell =  (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.nameLabel.textColor = [UIColor whiteColor];
    
}


#pragma mark -- CenterViewDelegate代理
-(void)centerView:(CenterView *)centerView currentIndex:(NSInteger)index preIndex:(NSInteger)preIndex
{
    
    NSArray *cellsArray = [self.collectionView visibleCells];
    
    [cellsArray enumerateObjectsUsingBlock:^(CollectionViewCell *cell, NSUInteger index, BOOL * _Nonnull stop) {
        cell.backgroundColor = [UIColor clearColor];
        cell.nameLabel.textColor = [UIColor colorWithHexString:@"#afe6f6"];
    }];
    
    [self collectionView:self.collectionView didDeselectItemAtIndexPath: [NSIndexPath indexPathForRow:index inSection:0]];
   
}

#pragma mark -- BottomViewDelegate代理
-(void)bottomView:(BottomView *)bottomView state:(BOOL )isPull
{
    CGFloat height = [CommonFile heightForString:_content fontSize:17 andWidth:997];
    
    if (isPull) {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect = bottomView.frame;
            rect.origin.y = WLScreenH - 110 + 62 - height-20;
            rect.size.height += height - 62+20;
            bottomView.frame = rect;
            //bottomView.alpha = 0.8;
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect = bottomView.frame;
            rect.origin.y = WLScreenH - 110;
            rect.size.height = 110;
            bottomView.frame = rect;
        }];
    }
}

/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}



@end
