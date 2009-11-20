package se.gointeractive.layout.linear.specification
{
  import org.asspec.basic.AbstractSuite;
  
  public class LinearSuite extends AbstractSuite
  {
    override protected function populate() : void
    {
      add(RowLayouterSpecification);
      add(ColumnLayouterSpecification);
    }
  }
}
