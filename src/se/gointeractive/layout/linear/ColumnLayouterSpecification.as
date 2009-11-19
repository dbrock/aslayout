package se.gointeractive.layout.linear
{
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.LayoutParent;
  import se.gointeractive.layout.geometry.Dimensions;

  public class ColumnLayouterSpecification
    extends AbstractLayouterSpecification
  {
    override protected function execute() : void
    {
      it("should layout two elements correctly", function () : void {
        const element1 : FakeElement = add_element(100, 100);
        const element2 : FakeElement = add_element(100, 100);
        
        execute_layout(200, 200);
        
        specify(element1.position).should.look_like("(0, 0)");
        specify(element2.position).should.look_like("(0, 100)");
      });
    }
    
    override protected function getLayouter
      (container : LayoutParent,
       dimensions : Dimensions,
       elements : Sequence) : Layouter
    { return new ColumnLayouter(container, dimensions, elements); }
  }
}
