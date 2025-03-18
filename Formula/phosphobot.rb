class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.93/phosphobot-arm64.bin"
      sha256 "34d2714edd211bc54765b2c07f9b9a08a0f627c73d8370e19e04607e42284be5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.93/phosphobot-x86_64.bin"
      sha256 "586c32e46ee33de9ac25679f18d9a959e9f60c37c256a7d34cc652939885722c"
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
