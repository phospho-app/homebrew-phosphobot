class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.2/phosphobot-0.3.2-arm64.bin"
      sha256 "d65088f8c8c3ed49066f585d5242286f7cb387696854bf079498f2c68ac7a79a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.2/phosphobot-0.3.2-x86_64.bin"
      sha256 "89de1351bd03714a5558816d68cf4147fa1bbd4aa3aa3044367a6bcd1664d864"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.2-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
