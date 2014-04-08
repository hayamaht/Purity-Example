package {

	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import cc.hayama.purity.PurityAppLoader;

	[SWF(width = "800", height = "600", frameRate = "60", backgroundColor = "#333333")]
	public class AppLoader extends PurityAppLoader {

		//--------------------------------------
		//   Constructor 
		//--------------------------------------

		public function AppLoader() {
			super();
		}

		//--------------------------------------
		//   Property 
		//--------------------------------------

		private var percent:TextField;

		//--------------------------------------
		//   Function 
		//--------------------------------------

		override protected function initLoadingScreen():void {
			percent = new TextField;

			percent.defaultTextFormat = new TextFormat("Arial", 50, 0xFFFFFF, true);
			percent.defaultTextFormat.align = TextFormatAlign.CENTER;
			percent.autoSize = TextFieldAutoSize.CENTER;
			percent.text = "0";
			percent.x = (stage.stageWidth - percent.width) * 0.5;
			percent.y = (stage.stageHeight - percent.height) * 0.5;

			addChild(percent);
		}

		override protected function removeLoadingScreen():void {
			removeChild(percent);
			percent = null;
		}

		override protected function onProgress(progress:Number):void {
			percent.text = Math.round(progress * 100).toString();
		}
	}
}
