//
//  JQTextTestController.m
//  bleDemo
//
//  Created by wuyaju on 2017/6/23.
//  Copyright © 2017年 wuyaju. All rights reserved.
//

#import "JQTextTestController.h"
#import "ZHPickView.h"

@interface JQTextTestController ()

@property (nonatomic, strong)NSArray *listCharacterFont;
@property (nonatomic, strong)NSArray *listAlign;
@property (nonatomic, strong)NSArray *listRotate;
@property (nonatomic, strong)NSArray *listWinth;
@property (nonatomic, strong)NSArray *listHeight;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;

@end

@implementation JQTextTestController {
    Byte charBoldBytes[3];
    Byte charUnderlineBytes[3];
    Byte charReverseBytes[3];
    Byte charFontBytes[3];
    Byte charAlignBytes[3];
    Byte charRotateBytes[3];
    Byte charWidthBytes[3];
    Byte charHeightBytes[3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initReouse];
}

- (void)initReouse {
    self.sendBtn.layer.cornerRadius = 5;
    self.sendBtn.layer.masksToBounds = YES;
    self.sendBtn.backgroundColor = [UIColor orangeColor];
    
    self.defaultBtn.layer.cornerRadius = 5;
    self.defaultBtn.layer.masksToBounds = YES;
    self.defaultBtn.backgroundColor = [UIColor orangeColor];
    
    self.listCharacterFont = [NSArray arrayWithObjects:@"字体D", @"字体A", @"字体B", @"字体C", nil];
    self.listWinth = [NSArray arrayWithObjects:@"1倍宽", @"2倍宽", @"3倍宽", @"4倍宽", nil];
    self.listHeight = [NSArray arrayWithObjects:@"1倍高", @"2倍高", @"3倍高", @"4倍高", nil];
    self.listAlign = [NSArray arrayWithObjects:@"左对齐", @"居中对齐", @"右对齐", nil];
    self.listRotate = [NSArray arrayWithObjects:@"不旋转", @"顺时针旋转90", @"顺时针旋转180", @"顺时针旋转270", nil];
}

- (IBAction)switchChange:(UISwitch *)sender {
    switch (sender.tag) {
        // 加粗
        case 0:
            if (sender.selected) {
                charBoldBytes[0]= 0x1b;
                charBoldBytes[1]= 0x45;
                charBoldBytes[2]= 0x01;
            }else {
                charBoldBytes[0]= 0x1b;
                charBoldBytes[1]= 0x45;
                charBoldBytes[2]= 0x00;
            }
            break;
        // 下划线
        case 1:
            if (sender.selected) {
                charUnderlineBytes[0]= 0x1b;
                charUnderlineBytes[1]= 0x2d;
                charUnderlineBytes[2]= 0x02;
            }else {
                charUnderlineBytes[0]= 0x1b;
                charUnderlineBytes[1]= 0x2d;
                charUnderlineBytes[2]= 0x00;
            }
            break;
        // 黑白反显
        case 2:
            if (sender.selected) {
                charReverseBytes[0]= 0x1D;
                charReverseBytes[1]= 0x42;
                charReverseBytes[2]= 0x01;
            }else {
                charReverseBytes[0]= 0x1D;
                charReverseBytes[1]= 0x42;
                charReverseBytes[2]= 0x00;
            }
            break;
        default:
            break;
    }
}

#pragma mark - Table view data source

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didEditRowAtIndexPath:(NSIndexPath *)indexPath subTitle:(NSString *)subTitle {
    //选取某个cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.detailTextLabel.text = subTitle;
//    //选中高亮
//    [tableView selectRowAtIndexPath:indexPath
//                            animated:YES
//                      scrollPosition:UITableViewScrollPositionMiddle];
//    //滚动视图
//    [tableView scrollToRowAtIndexPath:indexPath
//                      atScrollPosition:UITableViewScrollPositionMiddle
//                              animated:YES];
    //刷新列表
//    [tableView reloadRowsAtIndexPaths:<#(nonnull NSArray<NSIndexPath *> *)#> withRowAnimation:<#(UITableViewRowAnimation)#>];
//    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:{
                ZHPickView *pickView = [[ZHPickView alloc] init];
                [pickView setDataViewWithItem:self.listCharacterFont];
                [pickView showPickView:self.view];
                pickView.block = ^(NSString *selectedStr) {
                    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
                    [self tableView:tableView didEditRowAtIndexPath:selectIndexPath subTitle:selectedStr];
                    
                    if ([selectedStr isEqualToString:@"字体D"]) {
                        charFontBytes[0]= 0x1B;
                        charFontBytes[1]= 0x4D;
                        charFontBytes[2]= 0x03;
                    }else if ([selectedStr isEqualToString:@"字体A"]) {
                        charFontBytes[0]= 0x1B;
                        charFontBytes[1]= 0x4D;
                        charFontBytes[2]= 0x00;
                    }else if ([selectedStr isEqualToString:@"字体B"]) {
                        charFontBytes[0]= 0x1B;
                        charFontBytes[1]= 0x4D;
                        charFontBytes[2]= 0x01;
                    }else if ([selectedStr isEqualToString:@"字体C"]) {
                        charFontBytes[0]= 0x1B;
                        charFontBytes[1]= 0x4D;
                        charFontBytes[2]= 0x02;
                    }
                };
                break;
            }
            case 1:{
                ZHPickView *pickView = [[ZHPickView alloc] init];
                [pickView setDataViewWithItem:self.listWinth];
                [pickView showPickView:self.view];
                pickView.block = ^(NSString *selectedStr) {
                    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:1 inSection:1];
                    [self tableView:tableView didEditRowAtIndexPath:selectIndexPath subTitle:selectedStr];
                    if ([selectedStr isEqualToString:@"1倍宽"]) {
                        charWidthBytes[0]= 0x1D;
                        charWidthBytes[1]= 0x21;
                        charWidthBytes[2]= 0x00;
                    }else if ([selectedStr isEqualToString:@"2倍宽"]) {
                        charWidthBytes[0]= 0x1D;
                        charWidthBytes[1]= 0x21;
                        charWidthBytes[2]= 0x10;
                    }else if ([selectedStr isEqualToString:@"3倍宽"]) {
                        charWidthBytes[0]= 0x1D;
                        charWidthBytes[1]= 0x21;
                        charWidthBytes[2]= 0x20;
                    }else if ([selectedStr isEqualToString:@"4倍宽"]) {
                        charWidthBytes[0]= 0x1D;
                        charWidthBytes[1]= 0x21;
                        charWidthBytes[2]= 0x30;
                    }
                };
                break;
            }
            case 2:{
                ZHPickView *pickView = [[ZHPickView alloc] init];
                [pickView setDataViewWithItem:self.listHeight];
                [pickView showPickView:self.view];
                pickView.block = ^(NSString *selectedStr) {
                    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:2 inSection:1];
                    [self tableView:tableView didEditRowAtIndexPath:selectIndexPath subTitle:selectedStr];
                    if ([selectedStr isEqualToString:@"1倍高"]) {
                        charHeightBytes[0]= 0x1D;
                        charHeightBytes[1]= 0x21;
                        charHeightBytes[2]= 0x00;
                    }else if ([selectedStr isEqualToString:@"2倍高"]) {
                        charHeightBytes[0]= 0x1D;
                        charHeightBytes[1]= 0x21;
                        charHeightBytes[2]= 0x01;
                    }else if ([selectedStr isEqualToString:@"3倍高"]) {
                        charHeightBytes[0]= 0x1D;
                        charHeightBytes[1]= 0x21;
                        charHeightBytes[2]= 0x02;
                    }else if ([selectedStr isEqualToString:@"4倍高"]) {
                        charHeightBytes[0]= 0x1D;
                        charHeightBytes[1]= 0x21;
                        charHeightBytes[2]= 0x03;
                    }
                };
                break;
            }
            case 3:{
                ZHPickView *pickView = [[ZHPickView alloc] init];
                [pickView setDataViewWithItem:self.listAlign];
                [pickView showPickView:self.view];
                pickView.block = ^(NSString *selectedStr) {
                    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:3 inSection:1];
                    [self tableView:tableView didEditRowAtIndexPath:selectIndexPath subTitle:selectedStr];
                    if ([selectedStr isEqualToString:@"左对齐"]) {
                        charAlignBytes[0]= 0x1B;
                        charAlignBytes[1]= 0x61;
                        charAlignBytes[2]= 0x00;
                    }else if ([selectedStr isEqualToString:@"居中对齐"]) {
                        charAlignBytes[0]= 0x1B;
                        charAlignBytes[1]= 0x61;
                        charAlignBytes[2]= 0x01;
                    }else if ([selectedStr isEqualToString:@"右对齐"]) {
                        charAlignBytes[0]= 0x1B;
                        charAlignBytes[1]= 0x61;
                        charAlignBytes[2]= 0x02;
                    }
                };
                break;
            }
            case 4:{
                ZHPickView *pickView = [[ZHPickView alloc] init];
                [pickView setDataViewWithItem:self.listRotate];
                [pickView showPickView:self.view];
                pickView.block = ^(NSString *selectedStr) {
                    NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:4 inSection:1];
                    [self tableView:tableView didEditRowAtIndexPath:selectIndexPath subTitle:selectedStr];
                    if ([selectedStr isEqualToString:@"不旋转"]) {
                        charRotateBytes[0]= 0x1B;
                        charRotateBytes[1]= 0x56;
                        charRotateBytes[2]= 0x00;
                    }else if ([selectedStr isEqualToString:@"顺时针旋转90"]) {
                        charRotateBytes[0]= 0x1B;
                        charRotateBytes[1]= 0x56;
                        charRotateBytes[2]= 0x01;
                    }else if ([selectedStr isEqualToString:@"顺时针旋转180"]) {
                        charRotateBytes[0]= 0x1B;
                        charRotateBytes[1]= 0x56;
                        charRotateBytes[2]= 0x02;
                    }else if ([selectedStr isEqualToString:@"顺时针旋转270"]) {
                        charRotateBytes[0]= 0x1B;
                        charRotateBytes[1]= 0x56;
                        charRotateBytes[2]= 0x03;
                    }
                };
                break;
            }
                
            default:
                break;
        }
    }
}
- (IBAction)sendBtnClicked:(UIButton *)sender {
}
- (IBAction)defaultBtnClicked:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
