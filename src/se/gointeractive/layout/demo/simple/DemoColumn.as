package se.gointeractive.layout.demo.simple
{
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class DemoColumn extends VBox
  {
    private const box1 : DemoBox = DemoBox.get(50, 50);
    private const box2 : DemoBox = DemoBox.get(50, 100);
    
    public function DemoColumn()
    {
      addElement(box1);
      addElement(box2);
      
      dimensions = Dimensions.of(50, 200);
      
      relayout();
    }
  }
}
