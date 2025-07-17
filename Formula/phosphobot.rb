class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.64"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.64/phosphobot-0.3.64-arm64.bin"
      sha256 "a74c7bb25e90994fdabcc2a062e452cb1564a0c006d4e399d65f668cd00bb97d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.64/phosphobot-0.3.64-x86_64.bin"
      sha256 "64da8d872ee382e7ff39332476747c753820fa881b907987a15d20d1fe0ad9f9"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.64-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
