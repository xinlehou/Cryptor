//
//  ViewController.m
//  CryptorDemo
//
//  Created by apple on 15/9/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Cryptor.h"


static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

#define KEY @"xinle"

#define IMAGEPATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"image.png"] //图片原始路径

#define IMAGEPATH_DECODE [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"image_encode.png"] //图片加密路径

#define IMAGEPATH_ENCODE [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"image_decode.png"] //图片解密存储路径
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"icon"];
    
    
    NSData *imageData = UIImagePNGRepresentation(image);
        NSLog(@"路径\n%@",IMAGEPATH);
    [imageData writeToFile:IMAGEPATH atomically:YES];
    
    
//图片的加密解密AES
    //加密图片到路径
//    [Cryptor AES256EncryptWithKey:KEY
//                          forData:imageData
//                         savePata:IMAGEPATH_DECODE
//                         complete:^(BOOL isSuccess) {
//                             
//                             NSLog(@"success");
//                             NSData *encodeDtat =  [Cryptor AES256EncryptWithKey:KEY forData:imageData];
//                             
//                             
//                             //解密文件保存到路径
//                             [Cryptor AES256DecryptWithKey:KEY
//                                                   forData:encodeDtat
//                                                  savePata:IMAGEPATH_ENCODE
//                                                  complete:nil];
//                             
//
//                         }];
    
   
    
    //图片的加密解密 DES
    //加密图片到路径
    [Cryptor DESEncrypt:KEY
                forData:imageData
               savePata:IMAGEPATH_DECODE
               complete:^(BOOL isSuccess) {
                   
                   NSLog(@"success");
                   NSData *encodeDtat = [NSData dataWithContentsOfFile:IMAGEPATH_DECODE];
                   
                   
                   
                   //解密文件保存到路径
                   [Cryptor DESDecrypt:KEY
                               forData:encodeDtat
                              savePata:IMAGEPATH_ENCODE
                              complete:nil];
                   
                   
               }];
    
    
  
//    base64
    
//    NSString *srr = @"test";
//    NSString *base64Str = [Cryptor base64StringDecodeString:srr];
//    
//    NSLog(@"%@",srr);
//    NSLog(@"%@",base64Str);
//    
//    NSString *sss = [Cryptor stringWithBase64EncodeString:base64Str];
//    NSLog(@"%@",sss);
//    
    
    
   
//aes字符串
//    NSString *str = @"test";
//    
//    NSString *aesStr = [Cryptor AES256EncryptWithKey:KEY forString:str];
//    
//    
//    NSString *ss = [Cryptor AES256DecryptWithKey:KEY forString:aesStr];
    
    
//        NSString *str = @"test";
//    
//        NSString *aesStr = [Cryptor DESEncryptWithKey:KEY forString:str];
//    
//    
//        NSString *ss = [Cryptor DESDecryptWithKey:KEY forString:aesStr];
//    
  
}





@end
