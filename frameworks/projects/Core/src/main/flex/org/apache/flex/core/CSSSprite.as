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
package org.apache.flex.core
{
<<<<<<< HEAD
    import flash.display.DisplayObject;
=======
    COMPILE::SWF
    {
>>>>>>> refactor again so UIHTMLElementWrapper is the base for all exposed components, but CSSShape and friend are simple subclasses of Flash display objects and are directly added to the display list
    import flash.display.Graphics;
    import flash.display.Sprite;
    }
    
    import org.apache.flex.core.IChild;
    import org.apache.flex.events.Event;
    import org.apache.flex.events.IEventDispatcher;
    import org.apache.flex.utils.CSSBorderUtils;
    
    /**
     *  The Border class is a class used internally by many
     *  controls to draw a border.  The border actually drawn
     *  is dictated by the IBeadView in the CSS.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion FlexJS 0.0
     */
    COMPILE::SWF
	public class CSSSprite extends Sprite implements IStyleableObject
	{
        /**
         *  Constructor.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public function CSSSprite()
		{
		}		
        
        private var _id:String;
        
        /**
         *  An id property for MXML documents.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
        public function get id():String
        {
            return _id;
        }
        
        /**
         *  @private
         */
        public function set id(value:String):void
        {
            if (_id != value)
            {
                _id = value;
                dispatchEvent(new Event("idChanged"));
            }
        }

        private var _className:String;
        
        /**
         *  The classname.  Often used for CSS
         *  class selector lookups.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
        public function get className():String
        {
            return _className;
        }
        
        /**
         *  @private
         */
        public function set className(value:String):void
        {
            if (_className != value)
            {
                _className = value;
                dispatchEvent(new Event("classNameChanged"));
            }
        }
        
        private var _styles:Object;
        
        /**
         *  The object that contains
         *  "styles" and other associated
         *  name-value pairs.  You can
         *  also specify a string in
         *  HTML style attribute format.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
        public function get style():Object
        {
            return _styles;
        }
        
        /**
         *  @private
         */
        public function set style(value:Object):void
        {
            if (_styles != value)
            {
                if (value is String)
                {
                    _styles = ValuesManager.valuesImpl.parseStyles(value as String);
                }
                else
                    _styles = value;
                dispatchEvent(new Event("stylesChanged"));
            }
        }

        public var state:String;
        
        /**
         *  Draw the contents based on styles
         * 
         *  @param width The width.
         *  @param height The height.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
        public function draw(w:Number, h:Number):void
        {
<<<<<<< HEAD
            CSSBorderUtils.draw($sprite.graphics, w, h,this, state, true);            
=======
            CSSBorderUtils.draw(graphics, w, h, this, state, true);            
>>>>>>> refactor again so UIHTMLElementWrapper is the base for all exposed components, but CSSShape and friend are simple subclasses of Flash display objects and are directly added to the display list
        }
		
		/**
		 *  @copy org.apache.flex.core.IParent#addElement()
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function addElement(c:Object, dispatchEvent:Boolean = true):void
		{
			if(_elements == null)
				_elements = [];
			_elements[_elements.length] = c;
			$sprite.addChild(c.$displayObject);
			c.parent = this;
			if (c is IUIBase)
			{
				IUIBase(c).addedToParent();
			}
			
		}
		
		/**
		 *  @copy org.apache.flex.core.IParent#addElementAt()
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function addElementAt(c:Object, index:int, dispatchEvent:Boolean = true):void
		{
			if(_elements == null)
				_elements = [];
			_elements.splice(index,0,c);
			
			$sprite.addChildAt(c.$displayObject,index);
			c.parent = this;
			if (c is IUIBase)
			{
				IUIBase(c).addedToParent();
			}
		}
		
		/**
		 *  @copy org.apache.flex.core.IParent#getElementAt()
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function getElementAt(index:int):Object
		{
			if(_elements == null)
				return null;
			return _elements[index];
		}        
		
		private var _elements:Array;
		/**
		 *  @copy org.apache.flex.core.IParent#getElementIndex()
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function getElementIndex(c:Object):int
		{
			if(_elements == null)
				return -1;
			return _elements.indexOf(c);
		}
		
		/**
		 *  @copy org.apache.flex.core.IParent#removeElement()
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function removeElement(c:Object, dispatchEvent:Boolean = true):void
		{
			if(_elements)
			{
				var idx:int = _elements.indexOf(c);
				if(idx>=0)
					_elements.splice(idx,1);
				c.parent = null;
			}
			$sprite.removeChild(c.$displayObject);
		}
		
		/**
		 *  @copy org.apache.flex.core.IParent#numElements
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get numElements():int
		{
			return _elements ? _elements.length : 0;
		}
		
		public function getBeadByType(classOrInterface:Class):IBead
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function removeBead(bead:IBead):IBead
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function addedToParent():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function get topMostEventDispatcher():IEventDispatcher
		{
			// TODO Auto Generated method stub
			return null;
		}
		

	}
}
