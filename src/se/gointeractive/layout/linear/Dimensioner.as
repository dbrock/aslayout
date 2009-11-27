package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutElement;
  
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
      if (isFlexible(element))
        return flexibleSize;
      else
        return getRigidSize(element);
    }
    
    private function isFlexible(element : LayoutElement) : Boolean
    { return element.preferredDimensions == null; }
    
    private function isRigid(element : LayoutElement) : Boolean
    { return !isFlexible(element); }
    
    private function getRigidSize(element : LayoutElement) : Number
    { return alignment.getPrimaryDimension(element.preferredDimensions); }
    
    private function get flexibleSize() : Number
    { return totalFlexibleSpace / flexibleElementCount; }
    
    private function get totalFlexibleSpace() : Number
    { return totalSpace - totalRigidSpace; }
    
    private function get totalRigidSpace() : Number
    {
      var result : Number = 0;
      
      for each (var element : LayoutElement in elements.filter(isRigid))
        result += getRigidSize(element);
      
      return result; 
    }
    
    private function get flexibleElementCount() : uint
    { return elements.filter(isFlexible).length; }
  }
}
