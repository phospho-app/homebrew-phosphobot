class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.98"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.98/phosphobot-0.3.98-arm64.bin"
      sha256 "dc4193dbdc99a879039f2f27f492116af61cdb8b76ab25d87090da98e843c38e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.98/phosphobot-0.3.98-x86_64.bin"
      sha256 "c4c2e918312370baceffd6461c78914287f8bd418c92636151596d6e7a8329ea"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.98-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
