package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  
  public class LayoutRequest
  {
    private var _positioner : LayoutPositioner;
    private var _dimensions : Dimensions;
    private var _elements : Sequence;
    
    public function LayoutRequest
      (positioner : LayoutPositioner,
       dimensions : Dimensions,
       elements : Sequence)
    {
      _positioner = positioner;
      _dimensions = dimensions;
      _elements = elements;
      
      elements.ensureType(LayoutElement);
    }
    
    public function get positioner() : LayoutPositioner
    { return _positioner; }
    
    public function get dimensions() : Dimensions
    { return _dimensions; }
    
    public function get elements() : Sequence
    { return _elements; }
  }
}
