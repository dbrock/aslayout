package se.gointeractive.layout.linear.specification
{
  import org.asspec.specify;
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;
  
  public class ExampleChecker
  {
    private var dimensions : Dimensions;
    private var flavor : String;
    private var elements : Sequence;
    private var expected : String;
    
    public function ExampleChecker
      (sizeString : String,
       flavor : String,
       elementsString : String,
       expected : String) : void
    {
      this.dimensions = getDimensions(sizeString);
      this.flavor = flavor;
      this.elements = getElements(elementsString);
      this.expected = expected;
    }
    
    private function getElements(elementsString : String) : Sequence
    { return getElementsStrings(elementsString).map(getElement); }
    
    private function getElementsStrings(elementsString : String) : Sequence
    {
      return Sequence.fromArray(elementsString.split(" "))
        .filter(isElementString);
    }
    
    private function isElementString(string : String) : Boolean
    { return string != "nothing"; }
    
    private function getElement(string : String) : FakeElement
    { return new FakeElement(getDimensions(string)); }
    
    private function getDimensions(string : String) : Dimensions
    { return Dimensions.parse(string); }

    // ----------------------------------------------------
    
    public function execute() : void
    {
      if (expected == "error")
        specify(exercise).should.throw_error;
      else
        {
          exercise();
          verify();
        }
    }
    
    private function verify() : void
    { specify(actual).should.equal(expected); }
    
    private function get actual() : String
    { return elements.empty ? "nothing" : elements.join(" "); }
    
    // ----------------------------------------------------
    
    private function exercise() : void
    {
      if (flavor == "row")
        LinearLayouter.layoutHorizontally(request);
      else if (flavor == "col")
        LinearLayouter.layoutVertically(request);
      else
        throw new Error;
    }
    
    private function get request() : LayoutRequest
    { return new LayoutRequest(positioner, dimensions, elements); }
    
    private function get positioner() : LayoutPositioner
    { return new FakePositioner; }
  }
}