//
//  Image+Ascii.h
//  AsciiArt
//
//  Created by RYUJI WATANABE on 2016/06/07.
//  Copyright © 2016年 RYUJI WATANABE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

/**
 *  Swiftで使いやすいようにメソッド宣言だけ用意
 */
@interface UIImage (ASCII)
-(id)ASCIIDescriptionWithWidth:(long long)arg1 height:(long long)arg2;
-(id)ASCIIDescription;
@end
