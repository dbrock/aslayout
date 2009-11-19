package se.gointeractive.layout.demo
{
  import flash.display.Graphics;
  import flash.display.Sprite;
  
  import se.gointeractive.layout.container.Positionable;
  import se.gointeractive.layout.geometry.Position;
  import se.gointeractive.layout.geometry.Rectangle;
  
  public class Canvas implements Positionable
  {
    public var sprite : Sprite;
    
    public function Canvas(sprite : Sprite)
    { this.sprite = sprite; }
    
    public function drawRectangle(rectangle : Rectangle, color : uint) : void
    {
      graphics.beginFill(color);
      graphics.drawRect
        (rectangle.position.x,
         rectangle.position.y,
         rectangle.dimensions.width,
         rectangle.dimensions.height);
      graphics.endFill();
    }
    
    private function get graphics() : Graphics
    { return sprite.graphics; }
    
    public function set position(value : Position) : void
    {
      sprite.x = value.x;
      sprite.y = value.y
    }
  }
}
