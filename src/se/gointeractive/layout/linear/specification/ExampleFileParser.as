package se.gointeractive.layout.linear.specification
{
  import org.asspec.util.inspection.inspect;
  import org.asspec.util.sequences.Sequence;
  
  public class ExampleFileParser
  {
    private var rawInput : String;
    
    public function ExampleFileParser(rawInput : String)
    { this.rawInput = rawInput; }
    
    private function get examples() : Sequence
    { return logicalLines.map(normalize).filter(nonempty); }
    
    private function get logicalLines() : Sequence
    { return Sequence.fromArray(input.split(">>")); }
    
    private function get input() : String
    { return rawInput.replace(/\r/g, ""); }
    
    private function normalize(string : String) : String
    { return trim(collapse(string)); }
    
    private function collapse(string : String) : String
    { return string.replace(/[ \n]+/g, " "); }
    
    private function trim(string : String) : String
    { return string.replace(/^[ \n]+|[ \n]+$/g, ""); }
    
    private function nonempty(string : String) : Boolean
    { return string != ""; }
    
    public static function getExamples(input : String) : Sequence
    { return new ExampleFileParser(input).examples; }
  }
}
