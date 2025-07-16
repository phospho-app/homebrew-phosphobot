class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.60"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.60/phosphobot-0.3.60-arm64.bin"
      sha256 "3987db815d72004636024f86be751584e89984736e86e9820e73eec236ff1b37"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.60/phosphobot-0.3.60-x86_64.bin"
      sha256 "d794951cae61fb017d72ae5cfce9f5e2c5ddeff91398cfc4c7b91d2d860e94e9"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.60-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
