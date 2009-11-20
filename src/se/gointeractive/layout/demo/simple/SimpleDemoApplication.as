package se.gointeractive.layout.demo.simple
{
  import flash.display.Sprite;
  
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class SimpleDemoApplication extends HBox
  {
    private const column1 : Sprite = new DemoColumn;
    private const column2 : Sprite = new DemoColumn;
    
    public function SimpleDemoApplication()
    {
      addElement(column1);
      addElement(column2);
      
      dimensions = stageDimensions;
      
      relayout();
    }
    
    private function get stageDimensions() : Dimensions
    { return Dimensions.of(stage.stageWidth, stage.stageHeight); }
  }
}
