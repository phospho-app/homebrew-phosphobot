class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.147"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.147/phosphobot-0.2.147-arm64.bin"
      sha256 "68b6d6b160989639a7c9d6448e93a71b2a39b06a5a4475b5b44529bac09ddfc9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.147/phosphobot-0.2.147-x86_64.bin"
      sha256 "3fe89e6b07ced44c4e0d90150394058040e3070b2a17115a1d39798e5886054b"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.147-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
