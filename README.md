# Parse delim string

### Caché RULE & class used to parse delimited strings.

---

		  Author: Micky Hulse		 Created: 02/05/09		Modified: 2011/02/09		   About: ...		Examples:		          set string = "count.0122:Description: 01 goes: here|paperwhite.121808:Description 02 goes here|french_confection:Description 03 goes here"		          set parent = "|"		          set child = ":"		          <h1>Parsing delimited string with two delimeters:</h1>		          <custom:rg:parse:delim:string string="#(string)#" child="#(child)#" parent="#(parent)#" order="desc" value="foo" key="bar">		          <p>Item #(bar)#/#(total)#</p>		          <ul>		          <li>#(bar)#</li>		          <csp:while counter="i" condition=(i<foo.Count())>		          <li>#(foo.GetAt(i))#</li>		          </csp:while>		          </ul>		          </custom:rg:parse:delim:string>		          <hr>		          <h1>Not specifying child delimiter:</h1>		          <custom:rg:parse:delim:string string="#(string)#" parent="#(parent)#" order="desc" value="foo" key="bar">		          <p>Item #(bar)#/#(total)#</p>		          <ul>		          <li>#(bar)#</li>		          <li>#(foo.GetAt(bar))#</li>		          </ul>		          </custom:rg:parse:delim:string>

---

#### LEGAL

Copyright &copy; 2013 [Micky Hulse](http://hulse.me)/[The Register-Guard](http://registerguard.com)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
