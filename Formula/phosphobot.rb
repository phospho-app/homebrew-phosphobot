class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.71/phosphobot.bin"
  sha256 "543f3d08422b4d2a9ed7de173263819f1c11e0751c3ee3e999f6fc2666c5fac6"
  license "MIT"

  def install
    chmod "+x", "phosphobot.bin"
    bin.install "phosphobot.bin" => "phosphobot"
  end

  test do
    system "#{bin}/phosphobot", "--version"
  end
end
