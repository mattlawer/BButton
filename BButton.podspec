Pod::Spec.new do |s|
  s.name         = "BButton"
  s.version      = "1.0.0"
  s.summary      = "."
  s.description  = <<-DESC
                    BButton is a subclass of UIButton that looks like the bootstrap buttons.
                   DESC
  s.homepage     = "https://github.com/mattlawer/BButton"
  s.platform     = :ios, '5.0'
  s.author       = 'mattlawer'
  s.license      = 'Copyright (c) 2012, Mathieu Bolard All rights reserved.'
  s.requires_arc = true
  s.source       = { :git => 'https://github.com/mattlawer/BButton.git' }
  s.source_files = 'BButton'
end
