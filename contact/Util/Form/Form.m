//
//  Form.m
//  WTD
//
//  Created by Wangshuguan-mac on 13-7-5.
//  Copyright (c) 2013年 ling. All rights reserved.
//

#import "Form.h"

@implementation Form
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)check{
    if (_views.count == _checks.count) {
        int i = 0;
        for (UITextField *f in _views) {
            for (NSString *s in [[_checks objectAtIndex:i]componentsSeparatedByString:@","]) {
                
                
                if([f isKindOfClass:[UITextField class]]){
                    if([s isEqualToString:@"null"]){
                        if((f.text&&[f.text isEqualToString:@""])||(!f.text)){
                            _error = @"确保所有内容不为空";
                            _errorIndex = @(i);
                            return;
                        }
                    }else if([s isEqualToString:@"email"]){
                        if(f.text){
                            if([f.text componentsSeparatedByString:@"@"].count<=1||[f.text componentsSeparatedByString:@"."].count<=1){
                                _error = @"邮件格式错误";
                                _errorIndex = @(i);
                                return;
                            }
                        }
                    }else if([s isEqualToString:@"equal"]){
                        if(_otherViews.count>i&&[[_otherViews objectAtIndex:i]isKindOfClass:[UITextField class]]){
                            if(!([(UITextField *)[_otherViews objectAtIndex:i] text]&&[[(UITextField *)[_otherViews objectAtIndex:i] text]isEqualToString:f.text])){
                                _error = @"密码输入有误";
                                _errorIndex = @(i);
                                return;
                            }
                        }
                    }
                    
                }
            }
            
            
            
            
            
            
            
            i++;
        }
    }
}
@end
