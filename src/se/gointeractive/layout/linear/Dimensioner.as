package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.FlexibleLayoutElement;
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.RigidLayoutElement;
  
  internal class Dimensioner
  {
    private var totalSpace : Number;
    private var elements : Sequence;
    private var alignment : Alignment;
    
    public function Dimensioner
      (totalSpace : Number,
       elements : Sequence,
       alignment : Alignment)
    {
      this.totalSpace = totalSpace;
      this.elements = elements;
      this.alignment = alignment;
      
      if (totalRigidSpace > totalSpace)
        throw new Error;
    }
    
    public function getPrimarySize(element : LayoutElement) : Number
    {
      if (element is RigidLayoutElement)
        return getRigidSize(RigidLayoutElement(element));
      else if (element is FlexibleLayoutElement)
        return flexibleSize;
      else
        throw new Error;
    }
    
    private function getRigidSize(element : RigidLayoutElement) : Number
    { return alignment.getPrimaryDimension(element.rigidDimensions); }
    
    private function get flexibleSize() : Number
    { return totalFlexibleSpace / flexibleElementCount; }
    
    private function get totalFlexibleSpace() : Number
    { return totalSpace - totalRigidSpace; }
    
    private function get totalRigidSpace() : Number
    {
      var result : Number = 0;
      
      for each (var element : LayoutElement in elements)
        if (element is RigidLayoutElement)
          result += getRigidSize(RigidLayoutElement(element));
      
      return result; 
    }
    
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
