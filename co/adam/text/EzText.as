package co.adam.text
{
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class EzText extends TextField
    {

		public var textFormat = new TextFormat();
        public function EzText ( options:Object = null ) 
        {
			var defaults = {autoSize:"left",embedFonts:true,selectable:false,multiline:true,wordWrap:true}
			if(options.width && options.wordWrap!=false){ defaults.wordWrap = true; }
			setText(defaults);
			setText(options);
        }

		public function setText( options:Object = null ){
			for(var key:String in options){
				if(key=='align' || key=='blockIndent' || key=='font' || key=='bold' || key=='bullet' || key=='color' || key=='indent' || key=='italic' || key=='kerning' || key=='leading' || key=='leftMargin' || key=='letterSpacing' || key=='' || key=='rightMargin' || key=='size' || key=='tabStops' || key=='target' || key=='underline' || key=='url'){
					
					if(key=='font'){
						if(options[key] is String){
							textFormat[key] = options[key];
						} else {
							textFormat[key] = options[key].fontName;
						}
						
					}else{
						textFormat[key] = options[key];
					}
				} else {
					this[key] = options[key];
				}
			}		
			this.setTextFormat(textFormat);
		}

    }
}