package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.RigidLayoutElement;
  
  public class LinearDimensionsPlan
  {
    private var totalSpace : Number;
    private var elements : Sequence;
    private var picker : DimensionPicker;
    
    public function LinearDimensionsPlan
      (totalSpace : Number,
       elements : Sequence,
       picker : DimensionPicker)
    {
      this.totalSpace = totalSpace;
      this.elements = elements;
      this.picker = picker;
      
      if (rigidSpace > totalSpace)
        throw new Error;
    }
    
    public function getSize(element : LayoutElement) : Number
    {
      if (element is RigidLayoutElement)
        return getRigidSize(element);
      else if (element is FlexibleLayoutElement)
        return flexibleSpace / flexibleElementCount;
      else
        throw new Error;
    }
    
    private function get flexibleSpace() : Number
    { return totalSpace - rigidSpace; }
    
    private function get rigidSpace() : Number
    {
      var result : Number = 0;
      
      for each (var element : LayoutElement in elements)
        if (element is RigidLayoutElement)
          result += getRigidSize(element);
      
      return result; 
    }
    
    private function getRigidSize(element : LayoutElement) : Number
    { return picker.getPrimaryDimension(RigidLayoutElement(element).preferredDimensions); }
    
    private function get flexibleElementCount() : uint
    {
      var result : uint = 0;
      
      for each (var element : LayoutElement in elements)
        if (element is FlexibleLayoutElement)
          ++result;
      
      return result; 
    }
  }
}
