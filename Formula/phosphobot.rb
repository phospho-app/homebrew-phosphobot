class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.107"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.107/phosphobot-0.2.107-arm64.bin"
      sha256 "db717f4b9f392f0398a367987f6ae13074525fa976489cffc94ffb1a0993553e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.107/phosphobot-0.2.107-x86_64.bin"
      sha256 "be13f2c2a39cc7efc14662e16265ac984c51b4db25695e2c5f93002b149b4716"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.107-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
