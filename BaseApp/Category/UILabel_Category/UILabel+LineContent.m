//
//  UILabel+LineContent.m
//  KoreanFans
//
//  Created by PeiJun on 2016/11/3.
//  Copyright © 2016年 PeiJun. All rights reserved.
//

#import "UILabel+LineContent.h"
#import <CoreText/CoreText.h>

@implementation UILabel (LineContent)
//算出label每行的内容
- (NSArray *)getLinesArrayOfStringWith:(CGFloat)lbWidth {
    NSString *text = [self text];
    UIFont *font = [self font];
    CGRect rect = [self frame];
    
    if (text == nil) {
        text = @"";
    }
    NSString *pointSizeStr = [NSString stringWithFormat:@"%.4f", floor([font pointSize] * 10000) / 10000];
    CGFloat pointSize = [pointSizeStr floatValue];
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), pointSize, NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    if (lbWidth > 0) {
        CGPathAddRect(path, NULL, CGRectMake(0,0,lbWidth,100000));
    } else {
        CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    }
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        //NSLog(@"''''''''''''''''''%@",lineString);
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

@end
