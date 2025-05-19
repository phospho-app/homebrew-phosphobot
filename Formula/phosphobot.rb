class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.6"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.6/phosphobot-0.3.6-arm64.bin"
      sha256 "a143caf644d6eb0dfed9b9ee154237b70ff20c90db725c83311c3bf3252ae152"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.6/phosphobot-0.3.6-x86_64.bin"
      sha256 "89eebf4cd2c8a676544bbade505c73178a8919e6d1ef016a8a0feb1e1f7de640"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.6-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
