class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.49"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.49/phosphobot-0.3.49-arm64.bin"
      sha256 "62743fda935e2cf2e4115c74857dbe514665acc85c71e7a30871f8907f2335c9"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.49/phosphobot-0.3.49-x86_64.bin"
      sha256 "198bf367345d71f0dab1736dc59d24d6a3b877bcdd8d02332157979fe3f2d825"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.49-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
