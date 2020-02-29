Pod::Spec.new do |spec|
  spec.name             = 'MyTutorial'
  spec.version          = '1.0'
  spec.license          = { :type => 'BSD' }
  spec.homepage         = 'https://github.com/elisimmonds/MyTutorial'
  spec.authors          = { 'Eli Simmonds' => 'eli.simmonds@gmail.com' }
  spec.summary          = 'A simple iOS start-up tutorial.'
  spec.source           = { :git => 'https://github.com/elisimmonds/MyTutorial.git', :tag => 'v1.0' }
  spec.source_files     = 'MyTutorial/LibraryFiles/*.swift'
  spec.requires_arc     = true
  spec.ios.deployment_target  = '13.0'
  spec.swift_version = '5.0'
  spec.license = { :type => 'Apache 2.0', :text => <<-LICENSE
      Copyright 2020
    LICENSE
  }
  spec.dependency 'SnapKit', '~> 5.0.0'
end
