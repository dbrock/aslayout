package se.gointeractive.layout.flash
{
  import flash.display.DisplayObject;
  import flash.display.Sprite;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;

  public class AbstractLayoutContainer extends Sprite implements LayoutElement
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
    
    public function get preferredDimensions() : Dimensions
    { return layout.dimensions; }
    
    public function set allocatedDimensions(value : Dimensions) : void
    {}
  }
}
