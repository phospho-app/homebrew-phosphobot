class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.113"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.113/phosphobot-0.2.113-arm64.bin"
      sha256 "60c90aa6b0597ae7ea888aaf3a81817d58a27240b1bb18fe73fc4d1cb71f7762"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.113/phosphobot-0.2.113-x86_64.bin"
      sha256 "df749a6db8cb19f13baec8afddd5872db7b411b25f9f3b0bde6cfa7b53acc171"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.113-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
