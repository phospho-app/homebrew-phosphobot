class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.1/phosphobot-0.3.1-arm64.bin"
      sha256 "0a9083f64404a922bfdb5592c18d56e6a0f5078e66b43b4e80325963e372090c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.1/phosphobot-0.3.1-x86_64.bin"
      sha256 "e0c7875bc0058c53fb71503293f28b36e52c0ac628bddfd941ee57a52f85e563"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.1-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
