import UIKit



let iphone5s  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:960,height:1336), (UIScreen.main.currentMode?.size)!) : false

let iphone6  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:750,height:1334), (UIScreen.main.currentMode?.size)!) : false

let iphone6p  = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1242,height:2208), (UIScreen.main.currentMode?.size)!) : false

let iphone6pBigMode = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2001), (UIScreen.main.currentMode?.size)!) : false

let iphoneX = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2436), (UIScreen.main.currentMode?.size)!) : false

let iphoneXS_MAX = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1242,height:2688), (UIScreen.main.currentMode?.size)!) : false

let iphoneXR = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:828,height:1792), (UIScreen.main.currentMode?.size)!) : false

let screenWidth = UIScreen.main.bounds.width

let screenHeight = UIScreen.main.bounds.height

let safeScreenHeight = isFullScreen ? UIScreen.main.bounds.height - 58 : UIScreen.main.bounds.height


let isIphoneX_XS = (screenWidth == 375 && screenHeight == 812) ? true : false

let isIphoneX_XSMax = (screenWidth == 414 && screenHeight == 896) ? true : false

let isFullScreen = (isIphoneX_XS || isIphoneX_XSMax) ? true : false

let StatusBarHeight : CGFloat = isFullScreen ? 44 : 20

let NavigationBarHeight : CGFloat = isFullScreen ? 88 : 64

let kTabbarHeight:CGFloat = 49

let kTopSafe:CGFloat = isFullScreen ?  24 : 0

let kBottomSafe:CGFloat = isFullScreen ?  34 : 0

let ScreenFrame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight)

let mainColor = UIColor.colorWithHexString(hex: "#3A84F0")

let suitParm:CGFloat = (iphone6p ? 1.12 : (iphone6 ? 1.0 : (iphone6pBigMode ? 1.01 : (iphoneX ? 1.0 : (iphoneXR ? 1.1 : (isIphoneX_XS ? 1.0 : (isIphoneX_XSMax ? 1.1 : 0.85)))))))




func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor { return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }
let  version = (UIDevice.current.systemVersion as NSString).floatValue


