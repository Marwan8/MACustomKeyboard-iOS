# MACustomKeyboard-iOS
MACustomKeyboard is custom numeric keyboard written in Objective C.
#Screenshots
![alt tag](http://i.imgur.com/2xViAmp.png?1)

#How to Use

Check out the sample app for an example of how to use MACustomKeyboard.
You can use Blocks or Delegate to handle the Keyboard events.


    NSArray * keys = @[@"1",@"2",@"3",@"4"
                       ,@"6",@"7",@"8",@"5",@"9",@"0",@"Clear",@"Done"];
    [customKeyboard setKeyboardButtons:keys];
    

#Blocks

    __weak typeof(self) weakerSelf = self;
    //Number Tapped
    [customKeyboard setNumberTappedBlock:^(MACustomKeyboard *view, NSString *text){
        weakerSelf.textField.text = [weakerSelf.textField.text stringByAppendingString:text];
    }];
    
    //Done button Tapped
    [customKeyboard setDoneTappedBlock:^(MACustomKeyboard *view){
        [weakerSelf.textField resignFirstResponder];
    }];
    //Clear Button Tapped
    [customKeyboard setClearTappedBlock:^(MACustomKeyboard *view){
        if(weakerSelf.textField.text.length > 0){
        weakerSelf.textField.text = [weakerSelf.textField.text substringToIndex:weakerSelf.textField.text.length - 1];
        }
    }];

#Delegate
    -(void)doneTapped:(MACustomKeyboard *)view{
    
      [self.textField resignFirstResponder];
    }

    -(void)clearTapped:(MACustomKeyboard *)view{
    
     if(self.textField.text.length > 0){
        self.textField.text = [self.textField.text substringToIndex:self.textField.text.length - 1];
     }
    }

    -(void)numberTapped:(MACustomKeyboard *)view Text:(NSString *)text{
        self.textField.text = [self.textField.text stringByAppendingString:text];
    }


#Author

Marwan Ayman, marwan.ayman8@gmail.com


#License

MACustomKeyboard is available under the MIT license. See the LICENSE file for more info
