////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "Licens"); you may not use this file except in compliance with
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
package org.apache.royale.utils.cssclasslist
{
    COMPILE::JS
    {
        import org.apache.royale.core.WrappedHTMLElement;
    }

    /**
     *  Removes all styles (class selector names) from the component.
     * 
     *  This is a low-level operation and may interfere with proper
     *  operation of the component.
     *  
     *  @param element The HTMLElement that will have selectors added or removed.  
     * 
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.9.3
     */
    COMPILE::JS
    public function removeAllStyles(element:WrappedHTMLElement):void
    {
        var classList:DOMTokenList = element.classList;
        var i:int;
        for( i = classList.length -1; i > 0; i-- )
        {
            classList.remove(classList[i]);
        }
    }

}
