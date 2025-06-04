class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.31"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.31/phosphobot-0.3.31-arm64.bin"
      sha256 "2aba5df7eb3ed41777662fecaa9d84b3ce494d60b26196dfc192252759688bf3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.31/phosphobot-0.3.31-x86_64.bin"
      sha256 "3cab54defeb3818d57b43d35fb917f0a424a1d500d1f97e15767cb68025eed82"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.31-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
