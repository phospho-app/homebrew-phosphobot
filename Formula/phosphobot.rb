class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.180"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.180/phosphobot-0.2.180-arm64.bin"
      sha256 "99aad222b96cd7dfc8c8d374431f5e352961816190d4e462dfb35defb6856a02"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.180/phosphobot-0.2.180-x86_64.bin"
      sha256 "7132b8af3d19aeba8cde8e56e15aaab361b689e35dfef84f2e7967f4e1a0f8e6"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.180-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
