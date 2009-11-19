package se.gointeractive.layout
{
  import org.asspec.basic.AbstractSuite;
  
  import se.gointeractive.layout.container.ContainerSpecification;

  public class LayoutSuite extends AbstractSuite
  {
    override protected function populate() : void
    {
      add(RowLayouterSpecification);
      add(ColumnLayouterSpecification);
      add(ContainerSpecification);
    }
  }
}
