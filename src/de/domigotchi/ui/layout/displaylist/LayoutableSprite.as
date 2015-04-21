package de.domigotchi.ui.layout.displaylist 
{
	import de.domigotchi.ui.layout.AnchorLayout;
	import de.domigotchi.ui.layout.AnchorTypes;
	import de.domigotchi.ui.layout.ILayout;
	import de.domigotchi.ui.layout.ILayoutable;
	import de.domigotchi.ui.layout.ILayoutableContainer;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Dominik Saur
	 */
	public class LayoutableSprite extends Sprite implements ILayoutableContainer
	{
		private static var DEBUG_DRAW:Boolean = true;
		
		private var _layout:ILayout;
		private var _sizeToContent:Boolean;
		
		protected var _left:Number = 0;
		protected var _top:Number = 0;
		protected var _right:Number = 0;
		protected var _bottom:Number = 0;
		
		
		protected var _width:Number = 0;
		protected var _height:Number = 0;
		
		
		protected var _minWidth:Number = 0;
		protected var _maxWidth:Number = Number.MAX_VALUE;
		protected var _minHeight:Number = 0;
		protected var _maxHeight:Number = Number.MAX_VALUE;
		
		
		public function LayoutableSprite() 
		{
			super();
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutable */
		
		public function get layoutParent():Object 
		{
			return parent;
		}
		
		
		public function doLayout(boundaries:Rectangle = null):void 
		{
			_layout.doLayout();
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutable */
		
		public function setPadding(left:Number, top:Number, right:Number, bottom:Number):void 
		{
			_left = left;
			_top = top;
			_right = right;
			_bottom = bottom;
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutableContainer */
		
		public function getLayoutChildAt(index:uint):ILayoutable 
		{
			return getChildAt(index) as ILayoutable;
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutableContainer */
		
		public function addLayoutChild(child:ILayoutable):void 
		{
			addChild(child as DisplayObject);
		}
		
		public function addLayoutChildAt(child:ILayoutable, index:uint):void 
		{
			addChildAt(child as DisplayObject, index);
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutableContainer */
		
		public function debugDraw(color:uint):void 
		{
			graphics.clear();
			graphics.lineStyle(1, 0);
			graphics.beginFill(color, 0.1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutableContainer */
		
		public function get sizeToContent():Boolean 
		{
			return _sizeToContent;
		}
		
		public function set sizeToContent(value:Boolean):void 
		{
			_sizeToContent = value;
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutable */
		
		public function get minWidth():Number 
		{
			return _minWidth;
		}
		
		public function get maxWidth():Number 
		{
			return _maxWidth;
		}
		
		public function set minWidth(value:Number):void 
		{
			_minWidth = value;
		}
		
		public function set maxWidth(value:Number):void 
		{
			_maxWidth = value;
		}
		
		public function get minHeight():Number 
		{
			return _minHeight;
		}
		
		public function get maxHeight():Number 
		{
			return _maxHeight;
		}
		
		public function set minHeight(value:Number):void 
		{
			_minHeight = value;
		}
		
		public function set maxHeight(value:Number):void 
		{
			_maxHeight = value;
		}
		
		/* INTERFACE de.domigotchi.ui.layout.ILayoutable */
		
		public function get layout():ILayout 
		{
			return _layout;
		}
		
		public function set layout(value:ILayout):void 
		{
			_layout = value;
		}
		
		
		[Inline]
		final private function get stageHeight():uint 
		{
			return ("stage" in parent) ? parent["stage"]["stageHeight"] : ("stageHeight" in parent) ? parent["stageHeight"]  : 0
		}
		
		[Inline]
		final private function get stageWidth():uint 
		{
			return ("stage" in parent) ? parent["stage"]["stageWidth"] : ("stageWidth" in parent) ? parent["stageWidth"] : 0;
		}
	
		[Inline]
		public function get parentWidth():Number 
		{
			return parent ?  parent is ILayoutable ? parent.width : stageWidth : 0;
		}
		
		[Inline]
		public function get parentHeight():Number 
		{
			return parent ?  parent is ILayoutable ? parent.height : stageHeight : 0;
		}
		

		/* INTERFACE de.domigotchi.ui.layout.ILayoutable */
		
		[Inline]
		final public function get left():Number 
		{
			return _left;
		}
		
		[Inline]
		final public function get top():Number 
		{
			return _top;
		}
		
		[Inline]
		final public function get right():Number 
		{
			return _right;
		}
		
		[Inline]
		final public function get bottom():Number 
		{
			return _bottom;
		}
		
		[Inline]
		final public function set left(value:Number):void 
		{
			_left = value;
		}
		
		[Inline]
		final public function set top(value:Number):void 
		{
			_top = value;
		}
		
		[Inline]
		final public function set right(value:Number):void 
		{
			_right = value;
		}
		
		[Inline]
		final public function set bottom(value:Number):void 
		{
			_bottom = value;
		}
		
		[Inline]
		final override public function get width():Number 
		{
			return _width ? _width : super.width;
		}
		
		[Inline]
		final override public function set width(value:Number):void 
		{
			_width = value;
		}
		
		[Inline]
		final override public function get height():Number 
		{
			return _height ? _height : super.height;
		}
		
		[Inline]
		final override public function set height(value:Number):void 
		{
			_height = value;
		}
		
	}

}