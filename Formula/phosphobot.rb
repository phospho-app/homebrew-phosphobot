class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.131"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.131/phosphobot-0.3.131-arm64.bin"
      sha256 "3fab8652c545f6d1d97e69145460e9b78d761dda7fad3bff2909a2881fb220b6"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.131/phosphobot-0.3.131-x86_64.bin"
      sha256 "30ba6fddf0dc7e10198b996db357688a4f63a402f5f08af50d54b80e22f9399c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.131-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
