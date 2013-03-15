Pod::Spec.new do |s|
  s.name         = "BButton"
  s.version      = "0.0.1"
  s.summary      = "BButton is a subclass of UIButton that looks like the bootstrap buttons."
  s.homepage     = "https://github.com/mattlawer/BButton"
  s.license      = {
    :type => 'BSD',
    :text => <<-LICENSE
              Copyright (c) 2012, Mathieu Bolard All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

Neither the name of Mathieu Bolard, mattlawer nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Mathieu Bolard BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    LICENSE
  }
  
  s.author       = { "Mathieu Bolard" => "me@mathieubolard.com" }
  s.source       = { :git => "https://github.com/mattlawer/BButton.git", :commit => "5d5809d6cb7124981cfc3a121581c056350500ab" }
  # s.source       = { :svn => 'http://EXAMPLE/BButton/tags/1.0.0' }
  # s.source       = { :hg  => 'http://EXAMPLE/BButton', :revision => '1.0.0' }
  s.platform     = :ios, '5.0'

  s.source_files = 'BButton', 'BButton/**/*.{h,m}'  
  s.requires_arc = true
end
