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
    //    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"hi-IN"];
    [synthesizer speakUtterance:utterance];

}

@end
