class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.178"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.178/phosphobot-0.2.178-arm64.bin"
      sha256 "bd0901606bebebff77225b50e4b642cca61c04c741b1768118d1e76475758f55"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.178/phosphobot-0.2.178-x86_64.bin"
      sha256 "126d93f26c7b284fd1366cf19aa74b832b1ba42bb855cad9a69ff89672e6056c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.178-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
