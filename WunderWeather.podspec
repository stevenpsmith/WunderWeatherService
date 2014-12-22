Pod::Spec.new do |s|
  s.name         = "WunderWeather"
  s.version      = "0.0.1"
  s.summary      = "Provides a Wunderground weather forecast, with basic UI, for a given zip code."
  s.homepage     = "https://github.com/stevenpsmith/WunderWeatherService"
  s.license      = 'MIT'
  s.author       = { "stevenpsmith" => "ssmith@chariotsolutions.com" }
  s.source       = { :git => "https://github.com/stevenpsmith/WunderWeatherService.git", :tag => 'v0.0.2' }
  s.platform     = :ios, '5.1'
  s.source_files = 'WunderWeather/API/*.{h,m}', 'WunderWeather/Model/*.{h,m}', 'WunderWeather/ViewController/*.{h,m}'
  s.resources = "WunderWeather/ViewController/*.{xib}"
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 0.10.0'
end
