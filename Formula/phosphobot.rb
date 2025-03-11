class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.82/phosphobot-arm64.bin"
      sha256 "ee92e2a39997ef23973d2e3468ba54c5a834b4ab3bbbc7775e4d982e54892a99"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.82/phosphobot-x86_64.bin"
      sha256 "25cddcf65b3b9e44edc40be9e226c463ce6a6863964b91b6522d7488aa70c972"
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
