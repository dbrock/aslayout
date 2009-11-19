package se.gointeractive.layout.demo
{
  import se.gointeractive.layout.Dimensions;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.Rectangle;
  
  public class DemoBox implements LayoutElement
  {
    public var canvas : Canvas;
    private var dimensions : Dimensions;
    private var color : uint;
    
    public function DemoBox
      (canvas : Canvas, dimensions : Dimensions, color : uint)
    {
      this.canvas = canvas;
      this.dimensions = dimensions;
      this.color = color;
      
      canvas.drawRectangle(dimensions.asRectangle, color);
    }
    
    public function get preferredDimensions() : Dimensions
    { return dimensions; }
  }
}
