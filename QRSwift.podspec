Pod::Spec.new do |s|
  s.name         = "QRSwift"
  s.version      = "0.2.0"
  s.summary      = "Swift framework for generating QR codes"

  s.description  = <<-DESC
                    QRSwift is a Swift framework for generating QR codes.
                   DESC

  s.homepage     = "https://github.com/chrisamanse/QRSwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = "Chris Amanse"
  s.social_media_url   = "https://twitter.com/ChrisAmanse"

  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"

  s.source       = { :git => "https://github.com/chrisamanse/QRSwift.git", :tag => "v#{s.version}" }

  s.source_files  = "Sources", "Sources/**/*.{h,swift}"

  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
