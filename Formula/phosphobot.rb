class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.184"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.184/phosphobot-0.2.184-arm64.bin"
      sha256 "9c12d7e112b734f5fd5ef1f1bf4894f54c0f762ca0ed1bfe7b864526cd95e927"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.184/phosphobot-0.2.184-x86_64.bin"
      sha256 "eb1808adbdfd4e14f6319433a4a52124f751207512b1e7f34653c93e8bcdfa5b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.184-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
