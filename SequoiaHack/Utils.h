//
//  Utils.h
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Utils : NSObject

+(void)speakInHindi:(NSString *)string;
+(void)saveCurrentField:(CLLocationCoordinate2D)location;
+(NSDictionary *)getCurrentField;
@end
