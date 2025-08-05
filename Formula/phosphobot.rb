class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.83"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.83/phosphobot-0.3.83-arm64.bin"
      sha256 "34473e493d12a90811503b271d88991dcca69424c0f8dbbd92c47690b7bb4f73"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.83/phosphobot-0.3.83-x86_64.bin"
      sha256 "178a7bb51c8db52e04139495ce70dc4ce4ea0364ccbcfca0a0f679d9e7834a05"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.83-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
