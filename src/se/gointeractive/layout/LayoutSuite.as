package se.gointeractive.layout
{
  import org.asspec.basic.AbstractSuite;

  public class LayoutSuite extends AbstractSuite
  {
    override protected function populate() : void
    {
      add(RowLayouterSpecification);
      add(ColumnLayouterSpecification);
    }
  }
}
