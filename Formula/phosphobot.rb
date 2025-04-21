class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.157"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.157/phosphobot-0.2.157-arm64.bin"
      sha256 "9712dafb447af8e530ba855ec5578bf17b5803967cdde37b3076ae3f76baeaaa"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.157/phosphobot-0.2.157-x86_64.bin"
      sha256 "3e9b9e9cc60c38f1d20e4fedd0715d56214c9ecc8e6dfd6a0ed2e4d296783d61"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.157-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
