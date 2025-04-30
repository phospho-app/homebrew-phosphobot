class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.186"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.186/phosphobot-0.2.186-arm64.bin"
      sha256 "7ef3f339db64b06a3281c23d794321994157171837dd975739f8821ec33a4443"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.186/phosphobot-0.2.186-x86_64.bin"
      sha256 "a71381277bced7eb1a9beea2de6504208186445bd22ded380c62f162ddbbeb21"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.186-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
