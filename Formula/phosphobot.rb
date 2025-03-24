class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.99"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-0.2.99-arm64.bin"
      sha256 "547105555a608735ddd4038ea99a49d68cafa26cc4e39519c1e251b09dea5d1e"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.99/phosphobot-0.2.99-x86_64.bin"
      sha256 "468108fc01a41848f36afdf6d8b06393dcb3c922dcb62e72ab7e2a8454c1ebaa"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.99-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
