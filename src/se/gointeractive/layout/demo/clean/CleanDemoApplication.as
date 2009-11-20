package se.gointeractive.layout.demo.clean
{
  import flash.display.Sprite;
  
  import org.asspec.util.sequences.Sequence;
  
  import se.gointeractive.layout.container.Container;
  import se.gointeractive.layout.geometry.Dimensions;
  import se.gointeractive.layout.linear.RowLayouter;
  
  public class CleanDemoApplication extends Sprite
  {
    private const spriteRepository : SpriteRepository = new SpriteRepository;
    
    private const box1 : DemoBox = getBox(50, 50);
    private const box2 : DemoBox = getBox(50, 100);
    
    public function CleanDemoApplication()
    {
      const container : Container = new Container;
      
      container.add(box1, spriteRepository.get(box1));
      container.add(box2, spriteRepository.get(box2));
      
      addChild(spriteRepository.get(box1).sprite);
      addChild(spriteRepository.get(box2).sprite);
      
      new RowLayouter(container, dimensions, elements).execute();
    }
    
    public function get dimensions() : Dimensions
    { return Dimensions.of(stage.stageWidth, stage.stageHeight); }
    
    public function get elements() : Sequence
    { return Sequence.of(box1, box2); }
    
    private function getBox(width : Number, height : Number) : DemoBox
    {
      const sprite : FlashSprite = getSprite();
      const result : DemoBox = new DemoBox
        (sprite, Dimensions.of(width, height), getRandomColor());
      
      spriteRepository.set(result, sprite);
      
      return result;
    }
    
    private function getSprite() : FlashSprite
    { return new FlashSprite(new Sprite); }
    
    private function getRandomColor() : uint
    { return (Math.random() * 0xffffff) | 0x0000ff; }
  }
}
