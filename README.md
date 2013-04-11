#BButton 2.0

BButton is a subclass of UIButton that looks like the [Twitter Bootstrap 2.3.1](http://twitter.github.com/bootstrap) buttons.

Forked from [@mattlawer / BButton](https://github.com/mattlawer/BButton) and refactored for more awesome.

Includes [@leberwurstsaft / FontAwesome-for-iOS](https://github.com/leberwurstsaft/FontAwesome-for-iOS), fixed for iOS from the original [FontAwesome](http://fortawesome.github.com/Font-Awesome/).

![BButton Screenshot 1][img1] &nbsp;&nbsp;&nbsp;&nbsp; ![BButton Screenshot 2][img2]

### Notable changes

* Up-to-date for iOS 5.0+, ARC, Storyboards
* Custom initialization methods for easier creation
* Option to show button 'disabled' state
* New button type options
* FontAwesome already included
* Refactored to be much cleaner, better organized

## Installation

* Drag the `BButton/` folder to your project (make sure you copy all files/folders)
* `#import "BButton.h"`
* Add `Fonts provided by application` key to `Info.plist` and include `FontAwesome.ttf`

<img src="http://imageshack.us/a/img339/9596/bbuttonfontawesomexcode.png">

### With Storyboards

Create a `UIButton` and change its class to `BButton`

<img width=261 src="http://img827.imageshack.us/img827/6596/ibbbutton.png"/>

### Create programmatically

Initialize with any of the following methods

* `- (id)initWithFrame:(CGRect)frame type:(BButtonType)type`
* `- (id)initWithFrame:(CGRect)frame type:(BButtonType)type icon:(FAIcon)icon fontSize:(CGFloat)fontSize`
* `- (id)initWithFrame:(CGRect)frame color:(UIColor *)aColor`
* `- (id)initWithFrame:(CGRect)frame color:(UIColor *)aColor icon:(FAIcon)icon fontSize:(CGFloat)fontSize`
* `+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon type:(BButtonType)type`
* `+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon color:(UIColor *)color`

**See the included demo project `BButtonDemo.xcodeproj`**

**See `FontAwesomeIcons.html` for list of icons**

##[BButton](https://github.com/mattlawer/BButton) License

Edited and refactored by Jesse Squires, April 2013.

[BSD 3-Clause License](http://opensource.org/licenses/BSD-3-Clause)

Copyright (c) 2012, Mathieu Bolard
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

* Neither the name of Mathieu Bolard, mattlawer nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Mathieu Bolard BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

##[FontAwesome](https://github.com/FortAwesome/Font-Awesome) License

* The Font Awesome font is licensed under the [SIL Open Font License](http://scripts.sil.org/OFL)
* Font Awesome CSS, LESS, and SASS files are licensed under the [MIT License](http://opensource.org/licenses/mit-license.html)
* The Font Awesome pictograms are licensed under the [CC BY 3.0 License](http://creativecommons.org/licenses/by/3.0)
* Attribution is no longer required in Font Awesome 3.0, but much appreciated:
	* *"Font Awesome by Dave Gandy - http://fortawesome.github.com/Font-Awesome"*

[img1]:https://raw.github.com/jessesquires/BButton/master/Screenshots/screenshot-1.png
[img2]:https://raw.github.com/jessesquires/BButton/master/Screenshots/screenshot-2.png