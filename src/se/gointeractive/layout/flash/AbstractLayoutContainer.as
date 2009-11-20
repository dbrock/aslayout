package se.gointeractive.layout.flash
{
  import flash.display.DisplayObject;
  import flash.display.Sprite;
  
  import se.gointeractive.layout.RigidLayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;

  public class AbstractLayoutContainer extends Sprite implements RigidLayoutElement
  {
    private var layout : AbstractLayout;
    
    public function AbstractLayoutContainer(layout : AbstractLayout)
    { this.layout = layout; }
    
    public function addElement(element : DisplayObject) : void
    {
      layout.addElement(element);
      addChild(element);
    }
    
    public function relayout() : void
    { layout.execute(); }
    
    public function set dimensions(value : Dimensions) : void
    { layout.dimensions = value; }
    
    public function get rigidDimensions() : Dimensions
    { return layout.dimensions; }
  }
}
