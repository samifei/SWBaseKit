//
//  DefineMacro.h
//  SWBaseKit
//
//  Created by ttxc on 2019/5/29.
//  Copyright © 2019 http://www.jianshu.com/u/84d0142cbec9. All rights reserved.
//

#ifndef DefineMacro_h
#define DefineMacro_h

/*
 * 屏幕的宽度高度
 */
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

/*
 * 下面参数 只是手机竖屏时候的高度
 * 详情：https://www.jianshu.com/p/d7b8f831c1f1
 */
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define NavBarHeight    44.0 //导航条高度
#define TabBarHeight    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define TopHeight       (StatusBarHeight + NavBarHeight) //整个导航栏高度

/*
 * 设置颜色
 */
#define SWThemeColor  ([UIColor colorWithRed:252.0/255.0 green:252.0/255.0 blue:252.0/255.0 alpha:1.0])//设置主题色
#define SWRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]//随机颜色（可能永远用不到）

/*
 * 常用代码
 */
#define APPDELEGATE         (AppDelegate *)[[UIApplication sharedApplication] delegate]//Appdelegate
#define IOS_VERSION         [[[UIDevice currentDevice] systemVersion] floatValue]//设备的iOS版本
#define WeakSelf(type)      __weak typeof(type) weak##type = type;//弱引用
#define NotificationCenter  [NSNotificationCenter defaultCenter] //通知中心
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]] //设置图片
#define GetFont(fontSize)   [UIFont systemFontOfSize:fontSize]// 设置字号大小
//NSUserDefaults
#define UserDefaultsSetBool(value,key)    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key]
#define UserDefaultsBoolForKey(key)       [[NSUserDefaults standardUserDefaults] boolForKey:key]
#define UserDefaultsSetObject(value,key)  [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define UserDefaultsObjectForKey(key)     [[NSUserDefaults standardUserDefaults] objectForKey:key]



/*
 * 修改Log,debug：SWLog，执行NSLog，release，自动忽略
 */
#ifdef DEBUG
#define SWLog(...) NSLog(__VA_ARGS__)
#else
#define SWLog(...)
#endif

/*
 * 判断设备类型
 */
// 判断是否是iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 判断是否是ipad
#define IS_iPad   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define IS_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone5系列
#define IS_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone6系列
#define IS_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6 Plus系列
#define IS_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneX 或者XS
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHone XR
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)



#endif /* DefineMacro_h */
