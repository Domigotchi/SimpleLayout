package de.domigotchi.ui.layout 
{
	/**
	 * ...
	 * @author Dominik Saur
	 */
	public class AbstractContainerLayout extends AbstractLayout 
	{
		
		protected var _container:ILayoutableContainer;
		protected var _anchorLayout:AnchorLayout;
		
		public function AbstractContainerLayout(container:ILayoutableContainer, anchor:String = AnchorTypes.LEFT_TOP, isRelativeLayout:Boolean = false) 
		{
			_container = container;
			_anchorLayout = new AnchorLayout(container, anchor, isRelativeLayout);
			super(container, isRelativeLayout);	
		}
		
		final public override function doLayout():void 
		{
			if (boundaries)
			{
				_anchorLayout.boundaries = boundaries;
			}
			_anchorLayout.doLayout();
			updateChildren();
			
			super.doLayout();
		}
		
		protected function updateChildren():void
		{
			
		}
		
	}

}