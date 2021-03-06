package se.gointeractive.layout
{
  import org.asspec.basic.AbstractSuite;
  
  import se.gointeractive.layout.container.ContainerSpecification;
  import se.gointeractive.layout.linear.specification.LinearLayouterSpecification;

  public class LayoutSuite extends AbstractSuite
  {
    override protected function populate() : void
    {
      add(LinearLayouterSpecification);
      add(ContainerSpecification);
    }
  }
}
