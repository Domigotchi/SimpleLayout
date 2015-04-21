package de.domigotchi.ui.layout 
{
	import de.domigotchi.ui.layout.AbstractLayout;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Dominik Saur
	 */
	public class AnchorLayout extends AbstractLayout
	{
		private var _anchorType:String;
		private var _boundaries:Rectangle;
		
		public function AnchorLayout(target:ILayoutable, anchorType:String, isRelativeLayout:Boolean = false)
		{
			
			super(target, isRelativeLayout);
			if (target == null)
				throw new Error("null is not a valid target");
			_anchorType = anchorType;
			_isRelativeLayout = isRelativeLayout;
		}
		
		override public function doLayout():void
		{
			switch(_anchorType)
			{
				case AnchorTypes.FILL: fillVectical(_target, boundaries); fillHorizontal(_target, boundaries); break;
					
				case AnchorTypes.LEFT_VERTICAL_FILL: 
				case AnchorTypes.RIGHT_VERTICAL_FILL:
				case AnchorTypes.CENTER_VERTICAL_FILL: fillVectical(_target, boundaries); break;
				
				case AnchorTypes.TOP_HORIZONTAL_FILL:
				case AnchorTypes.MIDDLE_HORIZONTAL_FILL:
				case AnchorTypes.BOTTOM_HORIZONTAL_FILL: fillHorizontal(_target, boundaries); break;
				
				default: setWidth(target, target.width); setHeight(target, target.height);
			}
			
			var parentWidth:Number = boundaries ? boundaries.width : _target.parentWidth;
			var parentHeight:Number = boundaries ? boundaries.height : _target.parentHeight;
			var parentOffsetX:Number = boundaries ? boundaries.x : 0;
			var parentOffsetY:Number = boundaries ? boundaries.y : 0;
			
			
			
			switch(_anchorType)
			{
				
				case AnchorTypes.LEFT_TOP:
				case AnchorTypes.LEFT_MIDDLE:
				case AnchorTypes.LEFT_VERTICAL_FILL: 
				case AnchorTypes.LEFT_BOTTOM: setX(_target, parentOffsetX + _target.left, boundaries); break;
				
				case AnchorTypes.RIGHT_TOP:
				case AnchorTypes.RIGHT_MIDDLE:
				case AnchorTypes.RIGHT_VERTICAL_FILL:
				case AnchorTypes.RIGHT_BOTTOM: setX(_target, parentOffsetX + parentWidth - _target.width, boundaries); break;
				
				case AnchorTypes.FILL:
				case AnchorTypes.CENTER_TOP:
				case AnchorTypes.CENTER_MIDDLE:
				case AnchorTypes.CENTER_VERTICAL_FILL:
				case AnchorTypes.TOP_HORIZONTAL_FILL:
				case AnchorTypes.CENTER_BOTTOM: setX(_target, parentOffsetX + parentWidth/2 - _target.width/2, boundaries); break;	
			}
			
			switch(_anchorType)
			{
				
				case AnchorTypes.LEFT_TOP: 
				case AnchorTypes.RIGHT_TOP:
				case AnchorTypes.TOP_HORIZONTAL_FILL:
				case AnchorTypes.CENTER_TOP: setY(_target, _target.top, boundaries); break;
				
				case AnchorTypes.FILL:
				case AnchorTypes.LEFT_MIDDLE:
				case AnchorTypes.RIGHT_MIDDLE:
				case AnchorTypes.MIDDLE_HORIZONTAL_FILL:
				case AnchorTypes.CENTER_MIDDLE: setY(_target, parentOffsetY + parentHeight/ 2 - _target.height / 2, boundaries); break;
				
				case AnchorTypes.LEFT_BOTTOM:
				case AnchorTypes.RIGHT_BOTTOM:
				case AnchorTypes.BOTTOM_HORIZONTAL_FILL:
				case AnchorTypes.CENTER_BOTTOM: setY(_target, parentOffsetY + parentHeight - _target.height - _target.bottom, boundaries); break;	
				
			}
			
			var container:ILayoutableContainer = _target as ILayoutableContainer;
			if (container)
			{
				for (var i:int; i < container.numChildren; i++)
				{
					var child:ILayoutable = container.getLayoutChildAt(i);
					if (child && child.layout)
					{
						child.layout.doLayout();
					}
				}
			}
			super.doLayout();
			
		}
	
		
	private function fillHorizontal(target:ILayoutable, boundaries:Rectangle):void 
		{
			var parentWidth:int = boundaries ? boundaries.width : target.parentWidth;

			setWidth(target, parentWidth - target.left - target.right);
		}
		
		private function fillVectical(target:ILayoutable, boundaries:Rectangle):void 
		{
			var parentHeight:int = boundaries ? boundaries.height : target.parentHeight;
			var offset:int = _isRelativeLayout ? (target.top + target.bottom) * parentHeight : (target.top + target.bottom);
			setHeight(_target, parentHeight - offset);
		}
		
		
		
		

		
	}

}