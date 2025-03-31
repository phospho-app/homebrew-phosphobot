class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.108"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.108/phosphobot-0.2.108-arm64.bin"
      sha256 "b0048518464b1ec8dcec5c895dbc4aa2b242939bd3f3df2da29c36a2b6fb5047"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.108/phosphobot-0.2.108-x86_64.bin"
      sha256 "9a5d39c90213ba1b77fa1cfa5c2471e5b6084304989a7f4fdf96ede1571d7fe3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.108-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
