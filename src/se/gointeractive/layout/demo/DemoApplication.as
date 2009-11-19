package se.gointeractive.layout.demo
{
  import flash.display.Sprite;
  
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.Dimensions;
  import se.gointeractive.layout.Layoutable;
  import se.gointeractive.layout.LayoutableElement;
  import se.gointeractive.layout.Position;
  import se.gointeractive.layout.RowLayouter;
  import se.gointeractive.layout.container.Container;
  
  public class DemoApplication extends Sprite implements Layoutable
  {
    private const box1 : DemoBox = getBox(50, 50);
    private const box2 : DemoBox = getBox(50, 100);
      
    public function DemoApplication()
    {
      const container : Container = new Container;
      
      container.add(box1, box1.canvas);
      container.add(box2, box2.canvas);
      
      addChild(box1.canvas.sprite);
      addChild(box2.canvas.sprite);
      
      new RowLayouter(container, dimensions, elements).execute();
    }
    
    public function get dimensions() : Dimensions
    { return Dimensions.of(stage.stageWidth, stage.stageHeight); }
    
    public function get elements() : Sequence
    { return Sequence.of(box1, box2); }
    
    public function moveElement
      (element : LayoutableElement, position : Position) : void
    { DemoBox(element).canvas.position = position; }
    
    private function getBox(width : Number, height : Number) : DemoBox
    {
      return new DemoBox
        (getCanvas(), Dimensions.of(width, height), getRandomColor());
    }
    
    private function getCanvas() : Canvas
    { return new Canvas(new Sprite); }
    
    private function getRandomColor() : uint
    { return (Math.random() * 0xffffff) | 0x0000ff; }
  }
}
