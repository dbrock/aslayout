package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Dimensions;
  
  internal class Dimensioner
  {
    private var totalDimensions : Dimensions;
    private var elements : Sequence;
    private var alignment : Alignment;
    
    public function Dimensioner
      (totalDimensions : Dimensions,
       elements : Sequence,
       alignment : Alignment)
    {
      this.totalDimensions = totalDimensions;
      this.elements = elements;
      this.alignment = alignment;
      
      if (totalRigidSpace > totalPrimarySpace)
        throw new Error;
    }
    
    private function get totalPrimarySpace() : Number
    { return alignment.getPrimaryDimension(totalDimensions); }
    
    private function get totalSecondarySpace() : Number
    { return alignment.getSecondaryDimension(totalDimensions); }
    
    public function getPrimarySize(element : LayoutElement) : Number
    {
      if (isPrimarilyFlexible(element))
        return flexibleSize;
      else
        return getPreferredPrimarySize(element);
    }
    
    public function getSecondarySize(element : LayoutElement) : Number
    {
      if (isSecondarilyFlexible(element))
        return totalSecondarySpace;
      else
        return getPreferredSecondarySize(element);
    }
    
    private function isPrimarilyFlexible(element : LayoutElement) : Boolean
    { return isNaN(getPreferredPrimarySize(element)); }
    
    private function isSecondarilyFlexible(element : LayoutElement) : Boolean
    { return isNaN(getPreferredSecondarySize(element)); }
    
    private function getPreferredPrimarySize
      (element : LayoutElement) : Number
    { return alignment.getPrimaryDimension(element.preferredDimensions); }
    
    private function getPreferredSecondarySize
      (element : LayoutElement) : Number
    { return alignment.getSecondaryDimension(element.preferredDimensions); }
    
    private function get flexibleSize() : Number
    { return totalFlexibleSpace / flexibleElementCount; }
    
    private function get totalFlexibleSpace() : Number
    { return totalPrimarySpace - totalRigidSpace; }
    
    private function get totalRigidSpace() : Number
    {
      var result : Number = 0;
      
      for each (var element : LayoutElement in rigidElements)
        result += getPreferredPrimarySize(element);
      
      return result; 
    }
    
    private function get rigidElements() : Sequence
    { return elements.filter(isPrimarilyRigid); }
    
    private function isPrimarilyRigid(element : LayoutElement) : Boolean
    { return !isPrimarilyFlexible(element); }
    
    private function get flexibleElementCount() : uint
    { return elements.filter(isPrimarilyFlexible).length; }
  }
}
