package de.domigotchi.ui.layout 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Dominik Saur
	 */
	public class HorizontalLayout extends AbstractContainerLayout 
	{
		public function HorizontalLayout(target:ILayoutable, anchor:String = AnchorTypes.LEFT_TOP, useAutoSize:Boolean = true, isRelativeLayout:Boolean = false)
		{
			super(target, anchor, isRelativeLayout);
		}
		
		
		/* INTERFACE de.domigotchi.ui.layout.ILayout */
		
		protected override function updateChildren():void 
		{
			var numChildren:uint = _container.numChildren;
			var child:ILayoutable;
			var widthSpace:uint = _container.width / numChildren;
			
			for (var i:int; i < numChildren; i++)
			{
				child = _container.getLayoutChildAt(i);
				
				
				
				if (child)
				{
					if (child.layout)
					{
						var tmpBoundaries:Rectangle = child.layout.boundaries;
						if (!child.layout.boundaries)
						{
							child.layout.boundaries = tmpBoundaries = new Rectangle();
						}
						tmpBoundaries.setTo( (i * widthSpace), 0, widthSpace, _container.height);
						child.layout.doLayout();
					}
					else
					{
						child.x = i * widthSpace;
						child.y = 0;
						child.width = widthSpace;
						child.height = _container.height;
					}
				}
			}

		}

		
	}

}