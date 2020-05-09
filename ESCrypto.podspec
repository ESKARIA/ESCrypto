Pod::Spec.new do |s|
    
    # 1
    s.platforms = { :ios => "11.0", :osx => "10.14", :watchos => "5.0", :tvos => "10.0" }
    s.name = "ESCrypto"
    s.summary = "ESCrypto swift 5.1 framework for advanced crypto data in your app."
    s.requires_arc = true
    
    # 2
    s.version = "1.0.0"
    
    # 3
    s.license = { :type => "MIT", :file => "LICENSE" }
    
    # 4 - Replace with your name and e-mail address
    s.author = { "Dmitriy Toropkin" => "toropkind@gmail.com" }
    
    # 5 - Replace this URL with your own Github page's URL (from the address bar)
    s.homepage = "https://github.com/ESKARIA/ESCrypto.git"
    
    # 6 - Replace this URL with your own Git URL from "Quick Setup"
    s.source = { :git => "https://github.com/ESKARIA/ESCrypto.git", :tag => "#{s.version}"}
    
    # 7
    s.framework = "Foundation"
    s.framework = "Security"
    
    # 8
    s.vendored_libraries = 'lib/*.a'
    
end
