class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.53/phosphobot.bin"
  sha256 "59fccf07d6f457f14fd73a816c6e82b396a4c2ee523d0bfb4024aa4f2c1542b4"
  license "MIT"

  def install
    chmod "+x", "phosphobot.bin"
    bin.install "phosphobot.bin" => "phosphobot"
  end

  test do
    system "#{bin}/phosphobot", "--version"
  end
end
