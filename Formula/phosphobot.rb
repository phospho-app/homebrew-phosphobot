class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.191"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.191/phosphobot-0.2.191-arm64.bin"
      sha256 "ada0beaa9096a3de45d5922585d0921fbc5d0d742e320f076febe6d8fbe5cd0a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.191/phosphobot-0.2.191-x86_64.bin"
      sha256 "7d2d5ea4929866f1bcb7bc5decccee68ba11e3d5d4726b6678aa5d9a142959b4"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.191-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
