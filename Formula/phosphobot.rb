class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.109"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.109/phosphobot-0.3.109-arm64.bin"
      sha256 "e177989597d4401572641559d853a9c6b1045fe7431065941287f173db09f41f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.109/phosphobot-0.3.109-x86_64.bin"
      sha256 "387e52f36984898e3629431d9abe18a18331a31dd058d0ed74f35c830263338f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.109-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
