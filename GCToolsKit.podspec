#
#  Be sure to run `pod spec lint GCToolsKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "GCToolsKit"
  spec.version      = "0.0.9"
  spec.summary      = "这是用来创建工程的UI库"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
                        快速创建工程。提供UI创建的方法,主要包括侧边栏库，渐变 圆角按钮，渐变 圆角View，以及提供baseView 提供createSubviews 的父类方法。节省开发时间
                   DESC

  spec.homepage     = "http://github.com/AlittleFly/GCKit"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  # spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "gaochao" => "1176672158@qq.com" }
  # Or just: spec.author    = "gaochao"
  # spec.authors            = { "gaochao" => "1176672158@qq.com" }
  # spec.social_media_url   = "https://twitter.com/gaochao"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  spec.platform     = :ios, "9.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "9.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/AlittleFly/GCKit.git", :tag => "0.0.9"}


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_heade_files will make all headers public.
  #

  spec.source_files  = "GCKit/Utils/*"

    spec.subspec 'Base' do |bs|
      bs.source_files = 'GCKit/Utils/Base'
    end

    spec.subspec 'Graphics' do |gs|

      gs.dependency 'GCToolsKit/Base'
      
      gs.subspec 'Side' do |gss|
        gss.source_files = 'GCKit/Utils/Graphics/Container/*.{h,m}'
      end 

      gs.subspec 'UIButton' do |gsb|
        gsb.source_files = 'GCKit/Utils/Graphics/UIButton/*.{h,m}'
      end 

      gs.subspec 'UIView' do |gsv|
        gsv.source_files = 'GCKit/Utils/Graphics/UIView/*.{h,m}'
      end 
      gs.subspec 'LoadingView' do |ld|
        ld.source_files = 'GCKit/Utils/Graphics/LoadingView/*.{h,m}'
      end 
    end

    spec.subspec 'Category' do |cs|
      # cs.source_files = 'GCKit/Utils/Category/*/*.{h,m}'
        cs.subspec 'UITabbar' do |cst|
          cst.source_files = 'GCKit/Utils/Category/UITabbar/*.{h,m}'
        end
        cs.subspec 'NSString' do |csn|
          csn.source_files = 'GCKit/Utils/Category/NSString/*.{h,m}'
        end
        cs.subspec 'BackItem' do |csb|
          csb.source_files = 'GCKit/Utils/Category/UIViewController/*.{h,m}'
        end
    end

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
  # spec.dependency "Masonry"

end
