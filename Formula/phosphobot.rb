class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  url "https://github.com/phospho-app/phospho-app/homebrew-phosphobot/releases/download/0.2.49/phosphobot.bin"
  sha256 "ccf3aa2460edb0b31232825735f62c52dd38f2b353f27d001abd40af213287c6"
  license "MIT"

  def install
    chmod "+x", "phosphobot.bin"
    bin.install "phosphobot.bin" => "phosphobot"
  end

  test do
    system "#{bin}/phosphobot", "--version"
  end
end
