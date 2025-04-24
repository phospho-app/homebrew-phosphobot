class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.170"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.170/phosphobot-0.2.170-arm64.bin"
      sha256 "5b3ec624beb64834be1b7558be025001d705eeddadbff516f3e9b147eec68ea5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.170/phosphobot-0.2.170-x86_64.bin"
      sha256 "d011e450542be8337b3f0afc4ca45201ec8f7d2f2cd6d784f63b8b43269ba910"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.170-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
