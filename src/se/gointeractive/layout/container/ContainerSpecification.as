package se.gointeractive.layout.container
{
  import org.asspec.specification.AbstractSpecification;
  
  import se.gointeractive.layout.LayoutElement;
  import se.gointeractive.layout.geometry.Position;

  public class ContainerSpecification extends AbstractSpecification
  {
    override protected function execute() : void
    {
      it("should forward movements", function () : void {
        const container : Container = new Container;
        const logicalElement : LayoutElement = new FakeElement;
        const physicalElement : FakePositionable = new FakePositionable;
        const position : Position = Position.of(1, 2);
        
        container.add(logicalElement, physicalElement);
        container.moveElement(logicalElement, position);
        
        specify(physicalElement.position).should.equal(position);
      });
    }
  }
}
