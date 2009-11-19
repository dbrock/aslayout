package se.gointeractive.layout
{
  import org.asspec.basic.AbstractSuite;
  
  import se.gointeractive.layout.container.ContainerSpecification;
  import se.gointeractive.layout.linear.ColumnLayouterSpecification;
  import se.gointeractive.layout.linear.RowLayouterSpecification;

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
