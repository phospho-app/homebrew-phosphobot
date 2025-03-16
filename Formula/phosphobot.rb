class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.87/phosphobot-arm64.bin"
      sha256 "89b3185613c495f2e68aa05a5cc6c85cf0955cd5a8e4433a996c97f8e2f9964b"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.87/phosphobot-x86_64.bin"
      sha256 "0d0407da0591557c7a3d98593053166320021580b3d7087c89babb0c192100bb"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
