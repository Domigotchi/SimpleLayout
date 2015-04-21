package de.domigotchi.ui.layout 
{
	
	/**
	 * ...
	 * @author Dominik Saur
	 */
	public interface ILayoutableContainer extends ILayoutable
	{
		
		function getLayoutChildAt(index:uint):ILayoutable;
		function addLayoutChild(child:ILayoutable):void;
		function addLayoutChildAt(child:ILayoutable, index:uint):void;
		
		function get numChildren():int;	
		function get sizeToContent():Boolean;
		function set sizeToContent(value:Boolean):void;
	}
	
}