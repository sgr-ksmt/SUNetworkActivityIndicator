Pod::Spec.new do |s|

  s.name         = "SUNetworkActivityIndicator"
  s.version      = "0.0.1"
  s.summary      = "Simple NetworkActivityIndicator manager in Swift."

  s.description  = <<-DESC
                    Simple NetworkActivityIndicator manager in Swift.

                    Manage NetworkActivityIndicator state(visible/invisible) and
                    support multiple active/inactive indicator.
                   DESC

  s.homepage = "https://github.com/sgr-ksmt/SUNetworkActivityIndicator"

  s.license = "MIT"

  s.author = "Suguru Kishimoto"

  s.platform = :ios, "8.0"
  s.ios.deployment_target = "8.0"

  s.source = { :git => "https://github.com/sgr-ksmt/SUNetworkActivityIndicator.git", :tag => s.version.to_s }


  s.source_files  = "SUNetworkActivityIndicator/**/*.swift"

  s.requires_arc = true

end
