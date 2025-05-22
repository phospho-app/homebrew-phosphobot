class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.11"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.11/phosphobot-0.3.11-arm64.bin"
      sha256 "2bd7ca287de2123b418e8adb1121ddaa2abd17f2129b174e3421bb96bb5a87c4"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.11/phosphobot-0.3.11-x86_64.bin"
      sha256 "aa81fe365d01849ab97d686e5dc8da003884cf2e1a2aa0c89b38283b93e86e73"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.11-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
