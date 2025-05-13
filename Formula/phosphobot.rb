class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.210"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.210/phosphobot-0.2.210-arm64.bin"
      sha256 "792a4dc34c7ca222f261814ba9e172e3a1ede3a28626ce7a42281d5e2ea4b40a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.210/phosphobot-0.2.210-x86_64.bin"
      sha256 "6adfc331bad93f6bd3ae0df96a4fe4e869461aa7c37465173b295a275fd1b332"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.210-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
