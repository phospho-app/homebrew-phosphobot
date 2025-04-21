class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.158"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.158/phosphobot-0.2.158-arm64.bin"
      sha256 "827099bd8160b5d13a72590e26a4af32d01ba736ee7c2cf3931269aabe359c53"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.158/phosphobot-0.2.158-x86_64.bin"
      sha256 "89c5b86d6ccbe69bb140efbaef4b7bf795bffd5dea24b3cbdde4266add63fa25"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.158-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
