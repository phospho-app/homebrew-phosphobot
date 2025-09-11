class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.119"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.119/phosphobot-0.3.119-arm64.bin"
      sha256 "f3460623891140c092a9c817710715714173d0f3c0163fce6a8889fbe9a6ece7"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.119/phosphobot-0.3.119-x86_64.bin"
      sha256 "fc889832ad4970c3e3819695347d0a36d02b2c89698db44eda1cacfbf975715d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.119-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
