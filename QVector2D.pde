// PVector doesn’t have a rotate method, so I’m subclassing it
// and because I suck at math, I also make it two-dimensional only so
// I won’t have to implement rotation with a z-axis
class QVector2D extends PVector
{
  QVector2D (float x, float y)
  {
    super(x, y, 0);
  }
  
  void rotate (float _angle)
  {
    float angle = (float) Math.toRadians(_angle);

    float xNew = cos(angle) * this.x - sin(angle) * this.y;
    float yNew = cos(angle) * this.y + sin(angle) * this.x;

    this.set(xNew, yNew, 0);
  }
  
  void set (float x, float y)
  {
    this.set(x, y, 0);
  }
}