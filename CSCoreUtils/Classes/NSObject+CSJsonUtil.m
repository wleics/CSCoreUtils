//
//  NSObject+CSJsonUtil.m
//  Pods
//
//  Created by wlei on 2017/5/1.
//
//

#import "NSObject+CSJsonUtil.h"

@implementation NSObject (CSJsonUtil)

-(NSString *)objToJsonString
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
