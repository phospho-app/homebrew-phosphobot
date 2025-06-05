class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.34"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.34/phosphobot-0.3.34-arm64.bin"
      sha256 "6d1c3374d358cafce44d7f8efc104881abcd567d41fbb7407cf28b6146749d9c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.34/phosphobot-0.3.34-x86_64.bin"
      sha256 "003c6bed3efa3e89373c5855ae6dd30aac19d3fd7fef4d2550a80a3514ccd68a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.34-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
