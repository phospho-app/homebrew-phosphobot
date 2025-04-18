class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.148"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.148/phosphobot-0.2.148-arm64.bin"
      sha256 "4031e01b4941bc34abd19e1497e6a4d492ddbf9f1b54f69b36678eb9e01e4556"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.148/phosphobot-0.2.148-x86_64.bin"
      sha256 "31639b2a1a59def91bc3cd7ca4d940a227b37c33f7aabfcdde5371f4469d912d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.148-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
