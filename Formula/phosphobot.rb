class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.29"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.29/phosphobot-0.3.29-arm64.bin"
      sha256 "be84ace07916ec12aa789c2e29aeb700bb5dde939e09cebed41bcea91add7b55"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.29/phosphobot-0.3.29-x86_64.bin"
      sha256 "a0b848f4444413628bbfd58aaf001fd1706c876cea85d97a2b9e8935e2be9fdc"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.29-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
