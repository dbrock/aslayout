package
{
  import flash.display.Sprite;
  
  import org.asspec.ui.SimpleRunner;

  public class specification extends Sprite
  {
    public function specification()
    { new SimpleRunner(new LayoutSuite); }
  }
}