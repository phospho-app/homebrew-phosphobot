class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.175"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.175/phosphobot-0.2.175-arm64.bin"
      sha256 "c1f737d0e05d834f928645e986ed98761fc2327e956d23e9fe87cb8a7b99bb6d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.175/phosphobot-0.2.175-x86_64.bin"
      sha256 "952617edfc4775564ce016156b6b6f21cf5c5991f49c49702dd6883ffea0005c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.175-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
