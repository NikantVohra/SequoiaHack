//
//  Utils.m
//  SequoiaHack
//
//  Created by Vohra, Nikant on 29/08/15.
//  Copyright © 2015 Vohra, Nikant. All rights reserved.
//

#import "Utils.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>




@implementation Utils 


+(void)speakInHindi:(NSString *)string {
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string];
    [utterance setRate:0.2f];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"hi-IN"];
    [synthesizer speakUtterance:utterance];

}

+(void)saveCurrentField:(CLLocationCoordinate2D)location {
    NSNumber *lat = [NSNumber numberWithDouble:location.latitude];
    NSNumber *lon = [NSNumber numberWithDouble:location.longitude];
    NSDictionary *userLocation=@{@"lat":lat,@"long":lon};
    
    [[NSUserDefaults standardUserDefaults] setObject:userLocation forKey:@"userLocation"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(NSDictionary *)getCurrentField {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"userLocation"];
}
@end
