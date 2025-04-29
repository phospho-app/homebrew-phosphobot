class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.185"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.185/phosphobot-0.2.185-arm64.bin"
      sha256 "9d78fd1753f702d86f16664b88d8fbf981d050d2e716169650f89465e2fde091"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.185/phosphobot-0.2.185-x86_64.bin"
      sha256 "36fe0f17dac890ea5675b1f7de114f33eb1c3bad64e9f02ab2893713b2dbcc71"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.185-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
