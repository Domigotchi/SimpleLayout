package de.domigotchi.ui.layout 
{
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Dominik Saur
	 */
	public interface ILayout 
	{	
		function get boundaries():Rectangle;
		function set boundaries(value:Rectangle):void
		function doLayout():void;
		function get target():ILayoutable;
	}
	
}