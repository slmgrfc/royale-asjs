////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package
{

	/**
	 *  The AlternatingBackgroundColorHashAnchorItemRenderer class displays data in string form using the data's toString()
	 *  function and alternates between two background colors.  This is the most simple implementation for immutable lists
	 *  and will not handle adding/removing renderers.
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.0
	 */
	public class AlternatingBackgroundColorHashAnchorStringItemRenderer extends HashAnchorStringItemRenderer
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.0
		 */
		public function AlternatingBackgroundColorHashAnchorStringItemRenderer()
		{
		}

		private var _color0:String;
		
		public function get backgroundColor0():String
		{
			return _color0;
		}
		public function set backgroundColor0(value:String):void
		{
			_color0 = value;
		}
		
		private var _color1:String;
		
		public function get backgroundColor1():String
		{
			return _color1;
		}
		public function set backgroundColor1(value:String):void
		{
			_color1 = value;
		}
		
		private var oddIndex:Boolean;
		
		override public function addedToParent():void
		{
			super.addedToParent();

			var index:int = parent.getElementIndex(this);
			oddIndex = ((index % 2) == 1)
			COMPILE::JS
			{
				element.style.backgroundColor = oddIndex ? _color1 : _color0;
			}
		}

		/**
		 * @private
		 */
		override public function updateRenderer():void
		{
			super.updateRenderer();
			COMPILE::JS
			{
				if (element.style.backgroundColor == null || element.style.backgroundColor == "")
					element.style.backgroundColor = oddIndex ? _color1 : _color0;
			}
		}

	}
}
