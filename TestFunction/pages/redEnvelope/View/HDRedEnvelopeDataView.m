

#import "HDRedEnvelopeDataView.h"
#import "HDDisableTouchTextField.h"
#import "HDGiveRedEnvelopePresenter.h"
#import "HDTools.h"

@interface HDRedEnvelopeDataView()<UITextFieldDelegate,HDGiveRedEnvelopePresenterProtocol>
@property (nonatomic ,strong) UILabel *NumTipLabel; // 红包个数那一行
@property (nonatomic ,strong) UILabel *geLabel; // 红包个数的单位
@property (nonatomic ,strong) HDDisableTouchTextField * numTextField;// 红包个数填写区域

@property (nonatomic ,strong) UIImageView *pinImageView;

@property (nonatomic ,strong) UIView *jinELineView;
@property (nonatomic ,strong) UIView *geShuLineView;
@property (nonatomic ,strong) UIView *noteLineView;


@property (nonatomic ,strong) UILabel * moneyTipLabel;// 总金额
@property (nonatomic ,strong) UILabel * yuanLabel;// 金额单位
@property (nonatomic ,strong) HDDisableTouchTextField * moneyTextField;//输入金额

@property (nonatomic ,strong) UITextField * luckyNoteTextField;  // 祝福语占位图  最多15个字
//@property (nonatomic ,strong) UIView *totalMoneyContainerView;
@property (nonatomic ,strong) UILabel     * totalMoneyLabel; // 红包 总金额
@property (nonatomic ,strong) UILabel     * unitMoneyLabel; // 红包 总金额
@property (nonatomic ,strong) UIButton    * submitBtn; //提交按钮

@property (nonatomic ,strong) UIView *numContainerView;
@property (nonatomic ,strong) UIView *moneyContainerView;
@property (nonatomic ,strong) UIView *noteContainerView;

@property (nonatomic ,strong) UILabel *ErrorHintLabel;

@property (nonatomic ,strong) HDGiveRedEnvelopePresenter *presenter;
@end
@implementation HDRedEnvelopeDataView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.presenter = [[HDGiveRedEnvelopePresenter alloc] initWithDelegate:self];
        self.backgroundColor = MakeColorRGB(0xF3F3F3);
        [self customAddSubviews];
        [self customLayoutSubviews];
    }
    return self;
}
- (void)customAddSubviews{
    
    UILabel *ErrorHintLabel = [[UILabel alloc]init];
    ErrorHintLabel.textColor = MakeColorRGB(0xF12405);
    ErrorHintLabel.font = [UIFont systemFontOfSize:12*MZ_RATE];
    [self addSubview:ErrorHintLabel];
    self.ErrorHintLabel = ErrorHintLabel;
    
    UIView *numContainerView = [[UIView alloc] init];
    numContainerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:numContainerView];
    self.numContainerView = numContainerView;
    
    
    UIView *moneyContainerView = [[UIView alloc] init];
    moneyContainerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:moneyContainerView];
    self.moneyContainerView = moneyContainerView;
    
    
    UILabel *moneyTipLabel = [[UILabel alloc]init];
    moneyTipLabel.textColor = MakeColorRGB(0x2B2B2B);
    moneyTipLabel.font = [UIFont systemFontOfSize:14*MZ_RATE];
    moneyTipLabel.text = @"总金额";
    [moneyTipLabel sizeToFit];
    [self addSubview:moneyTipLabel];
    self.moneyTipLabel = moneyTipLabel;
    
    
    HDDisableTouchTextField *moneyTextField = [[HDDisableTouchTextField alloc]init];
    moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
//    [moneyTextField setValue:[UIFont systemFontOfSize:14*MZ_RATE] forKeyPath:@"_placeholderLabel.font"];
    moneyTextField.font = [UIFont systemFontOfSize:14*MZ_RATE];
    moneyTextField.textAlignment = NSTextAlignmentRight;
    moneyTextField.returnKeyType = UIReturnKeyDone;
    moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    moneyTextField.delegate = self;
    moneyTextField.placeholder = @"0.00";
    [moneyTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:moneyTextField];
    self.moneyTextField = moneyTextField;
    
    UILabel *yuanLabel = [[UILabel alloc]init];
    yuanLabel.textColor = MakeColorRGB(0x2B2B2B);
    yuanLabel.font = [UIFont systemFontOfSize:14*MZ_RATE];
    yuanLabel.text = @"元";
    [yuanLabel sizeToFit];
    [self addSubview:yuanLabel];
    self.yuanLabel = yuanLabel;
    
    UIImageView *pinImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"拼手气"]];
    [self addSubview:pinImageView];
    self.pinImageView = pinImageView;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = MakeColorRGB(0xF3F3F3);
    [self addSubview:lineView];
    self.jinELineView = lineView;
    
    UILabel *NumTipLabel = [[UILabel alloc]init];
    NumTipLabel.textColor = MakeColorRGB(0x2B2B2B);
    NumTipLabel.font = [UIFont systemFontOfSize:14*MZ_RATE];
    NumTipLabel.text = @"红包个数";
    [NumTipLabel sizeToFit];
    [self addSubview:NumTipLabel];
    self.NumTipLabel = NumTipLabel;
    
    HDDisableTouchTextField *numTextField = [[HDDisableTouchTextField alloc]init];
    numTextField.keyboardType = UIKeyboardTypeNumberPad;
//    [numTextField setValue:[UIFont systemFontOfSize:14*MZ_RATE] forKeyPath:@"_placeholderLabel.font"];
    numTextField.font = [UIFont systemFontOfSize:14*MZ_RATE];
    numTextField.textAlignment = NSTextAlignmentRight;
    numTextField.returnKeyType = UIReturnKeyDone;
    numTextField.keyboardType = UIKeyboardTypeNumberPad;
    numTextField.delegate = self;
    numTextField.placeholder = @"请填写红包个数";
    [numTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:numTextField];
    self.numTextField = numTextField;
    
    UILabel *geLabel = [[UILabel alloc]init];
    geLabel.textColor = MakeColorRGB(0x2B2B2B);
    geLabel.font = [UIFont systemFontOfSize:14*MZ_RATE];
    geLabel.text = @"个";
    [geLabel sizeToFit];
    [self addSubview:geLabel];
    self.geLabel = geLabel;
    
    UIView *geshulineView = [[UIView alloc] init];
    geshulineView.backgroundColor = MakeColorRGB(0xF3F3F3);
    [self addSubview:geshulineView];
    self.geShuLineView = geshulineView;
   
    self.noteContainerView = [[UIView alloc] init];
    self.noteContainerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.noteContainerView];
    
    UITextField *luckyNoteTextField = [[UITextField alloc]init];
    luckyNoteTextField.backgroundColor = [UIColor whiteColor];
    luckyNoteTextField.placeholder = @"恭喜发财，大吉大利！";
//    [luckyNoteTextField setValue:MakeColorRGB(0x9fa9ba) forKeyPath:@"_placeholderLabel.textColor"];
//    [luckyNoteTextField setValue:[UIFont systemFontOfSize:14*MZ_RATE] forKeyPath:@"_placeholderLabel.font"];
    luckyNoteTextField.textColor = MakeColorRGB(0x000000);
    [luckyNoteTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    luckyNoteTextField.font = [UIFont systemFontOfSize:14*MZ_RATE];
    luckyNoteTextField.delegate = self;
    [self addSubview:luckyNoteTextField];
    self.luckyNoteTextField = luckyNoteTextField;
    
    UIView *noteLineView = [[UIView alloc] init];
    noteLineView.backgroundColor = MakeColorRGB(0xF3F3F3);
    [self addSubview:noteLineView];
    self.noteLineView = noteLineView;
    
//    UIView *totalMoneyContainerView = [[UIView alloc] init];
//    totalMoneyContainerView.backgroundColor = [UIColor clearColor];
//    [self addSubview:totalMoneyContainerView];
//    self.totalMoneyContainerView = totalMoneyContainerView;
    
    UILabel *totalMoneyLabel = [[UILabel alloc]init];
    totalMoneyLabel.textColor = MakeColorRGB(0xF12405);
    totalMoneyLabel.textAlignment = NSTextAlignmentCenter;
    totalMoneyLabel.text = @"0.00";
    [totalMoneyLabel sizeToFit];
    totalMoneyLabel.font = [UIFont systemFontOfSize:34*MZ_RATE];
    [self addSubview:totalMoneyLabel];
    self.totalMoneyLabel = totalMoneyLabel;
    
    UILabel *unitMoneyLabel = [[UILabel alloc]init];
    unitMoneyLabel.textColor = MakeColorRGB(0xF12405);
    unitMoneyLabel.textAlignment = NSTextAlignmentCenter;
    unitMoneyLabel.text = @"￥";
    [unitMoneyLabel sizeToFit];
    unitMoneyLabel.font = [UIFont systemFontOfSize:26*MZ_RATE];
    [self addSubview:unitMoneyLabel];
    self.unitMoneyLabel = unitMoneyLabel;
    
    UIButton *submitBtn = [[UIButton alloc]init];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:14*MZ_RATE];
    [submitBtn setTitle:@"塞钱进红包" forState:UIControlStateNormal];
    submitBtn.layer.masksToBounds = YES;
    submitBtn.layer.cornerRadius = 3 * MZ_RATE;
    [submitBtn addTarget:self action:@selector(submitButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:submitBtn];
    self.submitBtn = submitBtn;
    [self submitBtnUnInteraction];
    
    
    
}
- (void)customLayoutSubviews{
    [self.moneyContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(44 * MZ_RATE);
        make.top.equalTo(self);
    }];
    [self.moneyTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.moneyContainerView);
        make.left.equalTo(self.moneyContainerView).offset(16);
    }];
    [self.yuanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.moneyContainerView);
        make.right.equalTo(self.moneyContainerView).offset(-16);
        make.width.mas_equalTo(15 * MZ_RATE).priorityLow();
    }];
    [self.moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.moneyContainerView);
        make.centerY.equalTo(self.moneyContainerView);
        make.left.equalTo(self.moneyContainerView).offset(10);
        make.right.equalTo(self.yuanLabel.mas_left).offset(-10);
    }];
    [self.pinImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.moneyContainerView);
        make.left.equalTo(self.moneyTipLabel.mas_right).offset(4);
        make.width.height.mas_equalTo(14);
    }];
    [self.jinELineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self);
        make.bottom.equalTo(self.moneyContainerView);
    }];
    
    [self.numContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(44 * MZ_RATE);
        make.top.equalTo(self.moneyContainerView.mas_bottom);
    }];
    [self.NumTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numContainerView);
        make.left.equalTo(self.numContainerView).offset(16);
    }];
    [self.geLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.numContainerView);
        make.right.equalTo(self.numContainerView).offset(-16);
        make.width.mas_equalTo(15 * MZ_RATE).priorityLow();
    }];
    [self.numTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.numContainerView);
        make.centerY.equalTo(self.numContainerView);
        make.left.equalTo(self.numContainerView).offset(10);
        make.right.equalTo(self.geLabel.mas_left).offset(-10);
    }];
    [self.geShuLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self.numContainerView);
    }];
//    错误提示
    [self.ErrorHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300 *MZ_RATE);
        make.height.mas_equalTo(18 *MZ_RATE);
        make.left.equalTo(self.NumTipLabel);
        make.bottom.equalTo(self.numContainerView);
    }];
    [self.noteContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(44 * MZ_RATE);
        make.top.equalTo(self.ErrorHintLabel.mas_bottom).offset(10);
    }];
    
    [self.luckyNoteTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-16);
        make.height.mas_equalTo(44 * MZ_RATE);
        make.top.equalTo(self.noteContainerView);
    }];
    [self.noteLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self.luckyNoteTextField);
    }];
    CGFloat halfUnitLabel = self.unitMoneyLabel.frame.size.width/2.0;
    [self.totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(halfUnitLabel);
        make.top.equalTo(self.luckyNoteTextField.mas_bottom).offset(20 * MZ_RATE);
    }];
    [self.unitMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.totalMoneyLabel.mas_left);
        make.top.equalTo(self.totalMoneyLabel).offset(2*MZ_RATE);
    }];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(-16);
        make.top.equalTo(self.noteContainerView.mas_bottom).offset(78 * MZ_RATE);
        make.height.mas_equalTo(44 * MZ_RATE);
    }];
    
}
- (void)submitBtnUnInteraction
{
    _submitBtn.userInteractionEnabled = NO;
    [_submitBtn setBackgroundColor:MakeColorRGB(0xFC7662)];
}
- (void)submitBtnInteraction
{
    _submitBtn.userInteractionEnabled = YES;
    [_submitBtn setBackgroundColor:MakeColorRGB(0xF12405)];

}

- (void)submitButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(redEnvelopeDataViewSubmit::)]) {
        [self.delegate redEnvelopeDataViewSubmit:_moneyTextField.text :_numTextField.text];
    }
    
//    NSString * money = [NSString stringWithFormat:@"%.2f",[_moneyTextField.text doubleValue]];
//    NSString * count = self.num
//    [HDRedPacketPayWay initWithPayWayViewMoney:money clickResponse:^(HDPayType payWay)  {
//        _currentPayWay = payWay;
//        [weakSelf showAlertView];
//    } showTip:YES isRecharge:NO buttonKeys:HDPayWeiXinPay,HDPayAliPay,nil];
}
#pragma mark textFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    if (self.type == HDRedPacketViewTypeLucky) {
//        double aver = [_moneyTextField.text doubleValue] / ([_numTextField.text integerValue] * 1.0);
//        if ((textField == _luckyNoteTextField) && (aver >= 0.5 && aver <= 200.00)) {
//            _isTextView = YES;
//        }
//        else {
//            _isTextView = NO;
//        }
//    }
//    else {
//        _isTextView = NO;
//        [self viewComeBack:0.25f];
//    }
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField
{
//     限制所有的输入文字都不得超过 15 个字
    if (textField.text.length > 15) {
        textField.text = [textField.text substringToIndex:15];
        return;
    }
    
    [self.presenter checkValidityWithMoney:self.moneyTextField.text :self.numTextField.text];
//    [self.presenter checkValidityWithMoney:self.moneyTextField.text :self.numTextField.text isMoneyTextField:(textField == _moneyTextField )];
    
        double aver = [_moneyTextField.text doubleValue] / ([_numTextField.text integerValue] * 1.0);
        if (([_numTextField.text integerValue] > 0) && ((aver >= 0.5) && (aver <= 200.00))) {
            
            if([_numTextField.text doubleValue] > 100){
                [self submitBtnUnInteraction];
            }else{
                [self submitBtnInteraction];
            }
        }
        else {
            [self submitBtnUnInteraction];
        }
    
    if (textField == _moneyTextField) {
        _totalMoneyLabel.text = [NSString stringWithFormat:@"%.2f",(_moneyTextField.text.length ? [_moneyTextField.text doubleValue] : 0.00)];
    }
}
// 验证用户输入的内容，控制被禁止的内容不被输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    if (![self luckyInputingCheck:textField range:range string:string]) {
        return NO;
    }

    return YES;
}
#pragma mark  禁止输入的情况  禁止输入的界限比逻辑界限要宽
- (BOOL)luckyInputingCheck:(UITextField *)textField range:(NSRange)range string:(NSString *)string
{
    if (textField == _numTextField) {
//        原值为0 第一次输入0被禁止
        if ([_numTextField.text integerValue] == 0 && [string isEqualToString:@"0"]) {
            return NO;
        }
//        将要输入的内容大于1000 被禁止
        NSString * totalNumeStr = [NSString stringWithFormat:@"%@%@",_numTextField.text,string];
        if ([totalNumeStr integerValue] >999) {
            return NO;
        }
    }
    if (textField == _moneyTextField) {
        if ([textField.text isEqualToString:@""] && [string isEqualToString:@"."]) {
            // .x
            return NO;
        }
        if ([textField.text isEqualToString:@"0"] && ![string isEqualToString:@"."]) {
//      0123
            return NO;
        }
//        if ([textField.text isEqualToString:@"0."] && [string integerValue] < 5) {
////            小于0.5
//            return NO;
//        }
//        输入超过 8位也被禁止
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        
        if (existedLength - selectedLength + replaceLength > 8) {// 包括小数点以及后两位
            return NO;
        }
//        0.1.2不允许
        NSString* fee = textField.text;
        fee = [fee stringByAppendingString:string];
        NSString *temp=nil;
        if ([fee  hasSuffix:@"\n"]) {
            temp= [fee  substringToIndex:fee.length-1];
        }else{
            temp=fee;
        }
        if(![HDTools isFloat:temp])
        {
            return NO;
        }
//        > 99999
        if ([temp doubleValue] > 99999) {
            return NO;
        }
    }
    return YES;
}

#pragma mark 拼手气字体变颜色
- (void)luckyMoneyIsLegal:(BOOL)isLegal
{
    _moneyTipLabel.textColor = (isLegal ? MakeColorRGB(0x172434) : MakeColorRGB(0xff5b29));
    _yuanLabel.textColor  = (isLegal ? MakeColorRGB(0x172434) : MakeColorRGB(0xff5b29));
    _moneyTextField.textColor = (isLegal ? MakeColorRGB(0x172434) : MakeColorRGB(0xff5b29));
}

- (void)luckyNumIsLegal:(BOOL)isLegal
{
    _NumTipLabel.textColor = (isLegal ? MakeColorRGB(0x172434) : MakeColorRGB(0xff5b29));
    _geLabel.textColor  = (isLegal ? MakeColorRGB(0x172434) : MakeColorRGB(0xff5b29));
    _numTextField.textColor = (isLegal ? MakeColorRGB(0x172434) : MakeColorRGB(0xff5b29));
}
#pragma mark - presenter Delegate
- (void)giveRedEnvelopePresenterCanSubmit;{
    [self submitBtnInteraction];
}
- (void)giveRedEnvelopePresenterCanNotSubmit;{
    [self submitBtnUnInteraction];
}

- (void)giveRedEnvelopePresenterShowAlertViewWithString:(NSString *)alertString;{
     NSLog(@"alertString---------%@",alertString);
    if (alertString) {
        
        self.ErrorHintLabel.text = alertString;

        [self setNeedsUpdateConstraints];
        [UIView animateWithDuration:0.25 animations:^{
            [self.ErrorHintLabel mas_updateConstraints:^(MASConstraintMaker *make) {
               make.bottom.equalTo(self.numContainerView).offset((18+6) *MZ_RATE);
            }];
            [self layoutIfNeeded];
            
        }];
        
    }else{
        self.ErrorHintLabel.text = @"";
        [self setNeedsUpdateConstraints];
        [UIView animateWithDuration:0.25 animations:^{
            [self.ErrorHintLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.numContainerView);
            }];
            [self layoutIfNeeded];
            
        }];
    }
}

- (void)giveRedEnvelopePresenterMoneyTextFieldIsLegal:(BOOL)isLegal;{
    [self luckyMoneyIsLegal:isLegal];
}
- (void)giveRedEnvelopePresenterNumTextFieldIsLegal:(BOOL)isLegal;{
    [self luckyNumIsLegal:isLegal];
}
- (CGFloat)submitButtonYvalue{
    CGRect toFrame = [self convertRect:self.submitBtn.frame toView:[UIApplication sharedApplication].keyWindow];
    
    return toFrame.origin.y;
}
@end
