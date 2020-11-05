//
//  TTPopoverViewController.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import "TTPopoverViewController.h"
#import "TTDataBus.h"

CGFloat iconWidth = 22.0f;
CGFloat iconLeftOffset = 13.0f;
CGFloat space = 13.0f;

@interface TTPopAlertCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIImageView *iconIv;

@end

@implementation TTPopAlertCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.iconIv];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.iconIv.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLb.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *constraint = @[
        [self.iconIv.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.iconIv.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:iconLeftOffset],
        [self.iconIv.widthAnchor constraintEqualToConstant:iconWidth],
        [self.iconIv.heightAnchor constraintEqualToConstant:iconWidth],
        
        [self.titleLb.centerYAnchor constraintEqualToAnchor:self.iconIv.centerYAnchor],
        [self.titleLb.leftAnchor constraintEqualToAnchor:self.iconIv.rightAnchor constant:space]
    ];
    
    [NSLayoutConstraint activateConstraints:constraint];
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.textColor = UIColor.whiteColor;
    }
    return _titleLb;
}

- (UIImageView *)iconIv {
    if (!_iconIv) {
        _iconIv = [UIImageView new];
        _iconIv.contentMode = UIViewContentModeScaleAspectFill;
        _iconIv.layer.cornerRadius = 4;
    }
    return _iconIv;
}

@end



@interface TTPopoverViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, strong) NSArray *iconsArr;

@end

@implementation TTPopoverViewController

- (instancetype)initWithTitles:(NSArray *)titles andIcons:(NSArray *)icons {
    if (self = [super init]) {
        _titlesArr = titles;
        _iconsArr = icons;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)dealloc {
    
}

#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TTPopAlertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TTPopAlertCell" forIndexPath:indexPath];
    cell.titleLb.text = self.titlesArr[indexPath.row];
    cell.iconIv.image = [UIImage imageNamed:self.iconsArr[indexPath.row]];
    cell.contentView.backgroundColor = [TTDataBus defaultBus].backgroundColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == [tableView numberOfRowsInSection:0] - 1) {
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (self.onItemClickedCB) {
        self.onItemClickedCB(row);
    }
}

#pragma mark -

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setCorner:self.view];
}

- (void)setCorner:(UIView *)v {
    if (v) {
        v.layer.cornerRadius = 0;
        v.layer.masksToBounds = NO;
        [self setCorner:v.superview];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[TTPopAlertCell class] forCellReuseIdentifier:@"TTPopAlertCell"];
    self.tableView.backgroundColor = [TTDataBus defaultBus].backgroundColor;
    self.tableView.layer.cornerRadius = self.cornerRadius;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraint = @[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.tableView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
    ];

    [NSLayoutConstraint activateConstraints:constraint];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        _tableView.separatorColor = [TTDataBus defaultBus].separatorColor;
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
