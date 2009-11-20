package se.gointeractive.layout.demo.simple
{
  import flash.display.Sprite;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.demo.clean.FlashSprite;
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class DemoBox extends Sprite implements LayoutElement
  {
    private var dimensions : Dimensions;
    private var color : uint;
    
    public function DemoBox
      (dimensions : Dimensions, color : uint)
    {
      this.dimensions = dimensions;
      this.color = color;
      
      new FlashSprite(this).drawRectangle(dimensions.asRectangle, color);
    }
    
    public function get preferredDimensions() : Dimensions
    { return dimensions; }
    
    public static function get(width : Number, height : Number) : DemoBox
    { return new DemoBox(Dimensions.of(width, height), getRandomColor()); }
    
    private static function getRandomColor() : uint
    { return (Math.random() * 0xffffff) | 0x0000ff; }
  }
}
