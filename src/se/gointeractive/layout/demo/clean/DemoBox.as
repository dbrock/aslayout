package se.gointeractive.layout.demo.clean
{
  import se.gointeractive.layout.RigidLayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class DemoBox implements RigidLayoutElement
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
    
    public function get rigidDimensions() : Dimensions
    { return dimensions; }
  }
}
