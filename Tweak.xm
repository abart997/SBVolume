#import <UIKit/UIKit.h>

static UIButton *btn;
static UIButton *button;


NSData *photo_data = [NSData dataWithContentsOfFile:@"/var/mobile/Library/SBVolume/high.png"];
UIImage *photo = [UIImage imageWithData: photo_data];

NSData *image_data = [NSData dataWithContentsOfFile:@"/var/mobile/Library/SBVolume/low.png"];
UIImage *image = [UIImage imageWithData: image_data];



@class VolumeControl;


@interface VolumeControl : NSObject { }
-(void)increaseVolume;
-(void)decreaseVolume;
-(void)cancelVolumeEvent;
+(id)sharedVolumeControl;
@end


%hook SBUIController
-(void)finishLaunching{
btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
btn.frame = CGRectMake(20.0, 375.0, 40.0, 20.0);
[btn setTitle:@"-" forState:UIControlStateNormal];
[btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
[btn setBackgroundImage:image forState:UIControlStateNormal];
[btn addTarget:self action:@selector(decrease:)forControlEvents:UIControlEventTouchDown];
[[self window] addSubview:btn];




button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
button.frame = CGRectMake(270.0, 375.0, 40.0, 20.0);
[button setTitle:@"+" forState:UIControlStateNormal];
[button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
[button setBackgroundImage:photo forState:UIControlStateNormal];
[button addTarget:self action:@selector(increase:)forControlEvents:UIControlEventTouchDown];
[[self window] addSubview:button];

}

%new(v@:@@)

-(void)decrease:(id)sender{
%class VolumeControl;
	id controller = [$VolumeControl sharedVolumeControl];
	[controller decreaseVolume];
		[controller cancelVolumeEvent];
		}
		
		
%new(v@:@@)
		
		-(void)increase:(id)sender{
		%class VolumeControl;
	id controller = [$VolumeControl sharedVolumeControl];
	[controller increaseVolume];
		[controller cancelVolumeEvent];
		}
		%end