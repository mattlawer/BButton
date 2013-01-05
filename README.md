BButton
========

BButton is a subclass of UIButton that looks like the [bootstrap](http://twitter.github.com/bootstrap/ "Twitter Bootstrap") buttons.<br />
It's really easy to use even if you're a beginner in Objective-C.<br />
It has beautiful graphics for retina display.<br />
You can customize it to the color you want in just one line of code.<br />

<img width=267 src="http://img13.imageshack.us/img13/5408/capturedcran20120731113.png"/>


Usage
-----

Start by importing <code>BButton.m</code> and <code>BButton.h</code> to your Xcode project.

### Use it with Interface Builder : ###

1. Create an UIButton in Interface Builder and change the class to BButton :<br />
<img width=261 src="http://img827.imageshack.us/img827/6596/ibbbutton.png"/>

2. You can set the target and selector with Interface Builder just like you do with an UIButton.


### Use it without Interface Builder : ###

1. Import the BButton class header :

		#import "BButton.h"
		
2. Create the BButton and add it to a visible view :

		BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(32.0, 20.0, 112.0, 40.0)];
        [btn setTitle:@"Login" forState:UIControlStateNormal]; // Set the button title
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.color = [UIColor purpleColor]; // Set purple color
        [self.view addSubview:btn];
        [btn release];
    
    
Example
-------

With some random colors

<img width=396 src="http://img703.imageshack.us/img703/7316/20120731114603.png"/>

Use with FontAwesome icons
--------------------------

With the BButton+FontAwesome category, you get to style your BButtons with FontAwesome icons.
There are convenience class methods to setup new BButtons and instance methods to apply FontAwesomeness to existing BButtons.
Use the instance methods on BButtons that you created in Interface Builder, it keeps the button's frame as well as color and font size if you don't specify those.

You can specify the icon by name, a color and a font size. Only the icon name is mandatory.
To find the right icon name, you can refer to the FontAwesomeIcons.html in this repository.
The icon names also get autocompleted in Xcode.

<img width=100 src="http://imageshack.us/a/img11/74/bbuttonfontawesome.png"/>

####Requirement:####
 * You need the FontAwesome font, which you can get here: https://github.com/leberwurstsaft/FontAwesome-for-iOS (I had to fix the font to correctly align vertically)
 * Add it to your project and make sure it gets copied in the 'Copy Bundle Resources' build phase.
 * Edit Info.plist to include the provided font like so:

<img src="http://imageshack.us/a/img339/9596/bbuttonfontawesomexcode.png">

License
-------

Copyright (c) 2012, Mathieu Bolard
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

* Neither the name of Mathieu Bolard, mattlawer nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Mathieu Bolard BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Contact
-------

mattlawer08@gmail.com<br />
http://mathieubolard.com<br />
http://twitter.com/mattlawer
