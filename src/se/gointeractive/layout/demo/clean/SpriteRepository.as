package se.gointeractive.layout.demo.clean
{
  import flash.utils.Dictionary;
  
  public class SpriteRepository
  {
    private const container : Dictionary = new Dictionary;
    
    public function set(key : Object, value : FlashSprite) : void
    { container[key] = value; }
    
    public function get(key : Object) : FlashSprite
    { return container[key]; }
  }
}
