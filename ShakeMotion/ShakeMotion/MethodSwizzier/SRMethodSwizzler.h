//
//  SRMethodSwizzler.h
//  ShakeReport
//
//  Created by Jeremy Templier on 5/29/13.
//  Copyright (c) 2013 Jeremy Templier. All rights reserved.
//

#import <Foundation/Foundation.h>

void SwizzleInstanceMethod(Class c, SEL orig, SEL new);
void SwizzleClassMethod(Class c, SEL orig, SEL new);

// 修改
void SwizzleInstanceMethod2(Class origC, SEL orig, Class newC, SEL new);
void SwizzleClassMethod2(Class origC, SEL orig, Class newC, SEL new);
