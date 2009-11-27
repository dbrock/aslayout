package se.gointeractive.layout.linear.specification
{
  import org.asspec.specification.AbstractSpecification;
  import org.asspec.util.sequences.ArraySequenceContainer;
  import org.asspec.util.sequences.Sequence;
  import org.asspec.util.sequences.SequenceContainer;
  
  import se.gointeractive.layout.LayoutPositioner;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.LayoutRequest;
  import se.gointeractive.layout.linear.LinearLayouter;

  public class LinearLayouterSpecification extends AbstractSpecification
  {
    [Embed(source="linear-layout-examples",
      mimeType="application/octet-stream")]
    private const ExampleFile : Class;
    
    override protected function execute() : void
    { examples.forEach(checkExample); }
    
    private function get examples() : Sequence
    { return ExampleFileParser.getExamples(exampleFileText); }
    
    private function get exampleFileText() : String
    { return new ExampleFile().toString(); }
    
    // ----------------------------------------------------
    
    private function checkExample(example : String) : void
    {
      const parts : Array = example.split(" => ");
      const input : String = parts[0];
      const expected : String = parts[1];
      
      $checkExample(input, expected);
    }
    
    private function $checkExample(input : String, expected : String) : void
    {
      const parts : Array = input.split(" :: ");
      const layout : String = parts[0];
      const elements : String = parts[1];
      
      $$checkExample(layout, elements, expected);
    }
      
    private function $$checkExample
      (layout : String, elements : String, expected : String) : void
    {
      const parts : Array = layout.split(" ");
      const size : String = parts[0];
      const flavor : String = parts[1];
      
      if (flavor == "row" || flavor == "col")
        $$$checkExample(size, flavor, elements, expected);
      else if (flavor == "any")
        {
          $$$checkExample(size, "row", elements, expected);
          $$$checkExample(size, "col", elements, expected);
        }
    }
    
    private function $$$checkExample
      (size : String, flavor : String,
       elements : String, expected : String) : void
    {
      requirement(size + " " + flavor + " :: " + elements, function () : void {
        new ExampleChecker(size, flavor, elements, expected).execute(); });
    }
  }
}
