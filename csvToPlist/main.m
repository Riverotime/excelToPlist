//
//  main.m
//  csvToPlist
//
//  Created by Iger on 2020/05/10.
//  Copyright © 2020年 Iger. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        // 先把.xls 或者 number 文件保存为.csv 格式
        /*
         csvPath  填 csv 的文件路径（也可以直接把文件拖进来，会自动生成路径）
         */
    
        NSMutableArray *allArr = [[NSMutableArray alloc] init];
        NSString *csvPath =@"/Users/****/Desktop/food.csv";
        NSString *content = [NSString stringWithContentsOfFile:csvPath encoding:NSUTF8StringEncoding error:nil];
        NSArray * allLinedStrings = [content componentsSeparatedByString:@"\r\n"];
    
        //遍历所有行
        for (int i = 0; i < allLinedStrings.count; i++) {
            if (i == 0 || i == 1) {
                continue;
            }
            NSArray *rows =[allLinedStrings[i] componentsSeparatedByString:@"," ];
        //数据转换,根据自己的value  自定义key
            if (![rows[1]  isEqualToString:@""]) {
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
                [dic setObject:rows[0] forKey:@"type_name"];
                [dic setObject:rows[1] forKey:@"name"];
                [dic setObject:rows[2] forKey:@"key1"];
                [dic setObject:rows[3] forKey:@"key2"];
                [dic setObject:rows[4] forKey:@"key3"];
                [dic setObject:rows[5] forKey:@"key4"];
                [dic setObject:rows[6] forKey:@"key5"];
                
                [allArr addObject:dic];
            }
           
    }
        
        //写入
        
        NSString *arrayPath = [NSHomeDirectory() stringByAppendingString:@"/Desktop/food.plist"];
        BOOL didWriteSuccessfull = [allArr writeToFile:arrayPath atomically:YES];
        if (!didWriteSuccessfull) {
            NSLog(@"写入失败");
        }

    return 0;
}
}

