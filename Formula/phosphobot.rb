class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.128"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.128/phosphobot-0.3.128-arm64.bin"
      sha256 "d248f78ccd00f5693d5a70358a71f392ce6731440375f8accdb6dbd8b68e4cce"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.128/phosphobot-0.3.128-x86_64.bin"
      sha256 "06cece9fd1a89297f39edb542f6695b2e232f5293d95647efacc62223de15022"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.128-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
