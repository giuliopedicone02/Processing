class GreenBall extends Ball
{
  GreenBall(float x, float y, float size, float sx, float sy)
  {
    super(x, y, size, sx, sy);
  }

  GreenBall(float x, float y, float size)
  {
    super(x, y, size, 0, 0);
  }

  void display()
  {
    fill(0, 255, 0);
    stroke(128, 0, 255);
    strokeWeight(5);
    ellipse(super.x, super.y, super.size, super.size);
  }
}
