class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.26"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.26/phosphobot-0.3.26-arm64.bin"
      sha256 "18b2efef54c08936faa4bdb9a36856a73ab8ae527681ffb445481985e8eb0a43"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.26/phosphobot-0.3.26-x86_64.bin"
      sha256 "195271360f0b75569b5ab506b960ec6bcdffe8d204c5e8072964d8d79de457e3"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.26-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
