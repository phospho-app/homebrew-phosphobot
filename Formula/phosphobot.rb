class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.62"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.62/phosphobot-0.3.62-arm64.bin"
      sha256 "f4c2eb683d1ac1cf88590ca71caaeac4bd170be282c2a24190bd3611b5645c7e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.62/phosphobot-0.3.62-x86_64.bin"
      sha256 "f816f66c94826c22a5f8554f55a061c9aebcf4048ace8115f83011a43ba520d0"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.62-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
