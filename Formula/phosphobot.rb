class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.166"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.166/phosphobot-0.2.166-arm64.bin"
      sha256 "a49bdd7c74a73e4e2947babbaa4f31f2c6996a6ad452f41b4887d177b650da50"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.166/phosphobot-0.2.166-x86_64.bin"
      sha256 "d449b899ad526009fcaccba6919621214444e356c9244651ebfc6cc960b14385"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.166-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
