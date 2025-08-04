class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.81"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.81/phosphobot-0.3.81-arm64.bin"
      sha256 "29fd04d8600a78c9eeaeaceea613a9bacaf43af4353d9ccbb8ceb2dd289e96d0"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.81/phosphobot-0.3.81-x86_64.bin"
      sha256 "e8affe74027685d7fdab8a8c51726716efe066497d7aca877af909a374061e8b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.81-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
