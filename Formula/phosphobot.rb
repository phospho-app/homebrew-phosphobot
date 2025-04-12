class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.129"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.129/phosphobot-0.2.129-arm64.bin"
      sha256 "e5d67f44a0a81e543964bc3d886b273b6a4bc517cc9986cf94dca17861f8ed18"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.129/phosphobot-0.2.129-x86_64.bin"
      sha256 "eb244340ef261f56b9445757785b6d90829a15d748e3c737c6fb9b59ae1053dc"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.129-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
