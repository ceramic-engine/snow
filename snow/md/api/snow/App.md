
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>App</h1>
<small>`snow.App`</small>

The default type of application, with variable delta time, or fixed delta time, or a fixed frame rate. See the {App Guide} for complete details.

---

`class`
<span class="meta">
<br/>meta: @:test1(&quot;value1&quot;), @:test2(&quot;value2&quot;)
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="app"><a class="lift" href="#app">app</a></a><code class="signature apipage">app : [snow.Snow](#)</code><br/></span>
            <span class="small_desc_flat">use this to access the api features. *i.e* `app.assets.get_text(_id)`</span><span class="member apipage">
                <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><code class="signature apipage">timescale : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the scale of time</span><span class="member apipage">
                <a name="fixed_delta"><a class="lift" href="#fixed_delta">fixed\_delta</a></a><code class="signature apipage">fixed\_delta : [Float](#)</code><br/></span>
            <span class="small_desc_flat">if this is non zero this will be passed in</span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><code class="signature apipage">fixed\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat">if this is non zero, updates will be forced to this rate</span><span class="member apipage">
                <a name="max_frame_time"><a class="lift" href="#max_frame_time">max\_frame\_time</a></a><code class="signature apipage">max\_frame\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the maximum frame time</span><span class="member apipage">
                <a name="delta_time"><a class="lift" href="#delta_time">delta\_time</a></a><code class="signature apipage">delta\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the time the last frame took to run</span><span class="member apipage">
                <a name="delta_sim"><a class="lift" href="#delta_sim">delta\_sim</a></a><code class="signature apipage">delta\_sim : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the simulated time the last frame took to run, relative to scale etc</span><span class="member apipage">
                <a name="last_frame_start"><a class="lift" href="#last_frame_start">last\_frame\_start</a></a><code class="signature apipage">last\_frame\_start : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the start time of the last frame</span><span class="member apipage">
                <a name="current_time"><a class="lift" href="#current_time">current\_time</a></a><code class="signature apipage">current\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the current simulation time</span><span class="member apipage">
                <a name="cur_frame_start"><a class="lift" href="#cur_frame_start">cur\_frame\_start</a></a><code class="signature apipage">cur\_frame\_start : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the start time of this frame</span><span class="member apipage">
                <a name="alpha"><a class="lift" href="#alpha">alpha</a></a><code class="signature apipage">alpha : [Float](#)</code><br/></span>
            <span class="small_desc_flat">the alpha time for a render between frame updates</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><code class="signature apipage">ready() : Void</code><br/><span class="small_desc_flat">Your entry point. Called for you when you can initialize your application</span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><code class="signature apipage">update(dt:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide})</span>
        </span>
    <span class="method apipage">
            <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a><code class="signature apipage">destroyed() : Void</code><br/><span class="small_desc_flat">Your exit point. Called for you when you should shut down your application</span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><code class="signature apipage">onkeydown(keycode:Int<span></span>, scancode:Int<span></span>, repeat:Bool<span></span>, mod:snow.types.ModState<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a key is pressed down</span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><code class="signature apipage">onkeyup(keycode:Int<span></span>, scancode:Int<span></span>, repeat:Bool<span></span>, mod:snow.types.ModState<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a key is released</span>
        </span>
    <span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><code class="signature apipage">ontextinput(text:String<span></span>, start:Int<span></span>, length:Int<span></span>, type:snow.types.TextEventType<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc.</span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><code class="signature apipage">onmousedown(x:Int<span></span>, y:Int<span></span>, button:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a mouse button is pressed</span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><code class="signature apipage">onmouseup(x:Int<span></span>, y:Int<span></span>, button:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a mouse button is released</span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><code class="signature apipage">onmousewheel(x:Int<span></span>, y:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when the mouse wheel moves</span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><code class="signature apipage">onmousemove(x:Int<span></span>, y:Int<span></span>, xrel:Int<span></span>, yrel:Int<span></span>, timestamp:Float<span></span>, window\_id:Int<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when the mouse moves</span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><code class="signature apipage">ontouchdown(x:Float<span></span>, y:Float<span></span>, touch\_id:Int<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a touch is released, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><code class="signature apipage">ontouchup(x:Float<span></span>, y:Float<span></span>, touch\_id:Int<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a touch is first pressed, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><code class="signature apipage">ontouchmove(x:Float<span></span>, y:Float<span></span>, dx:Float<span></span>, dy:Float<span></span>, touch\_id:Int<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a touch is moved, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><code class="signature apipage">ongamepadaxis(gamepad:Int<span></span>, axis:Int<span></span>, value:Float<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a connected gamepad axis moves, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttondown"><a class="lift" href="#ongamepadbuttondown">ongamepadbuttondown</a></a><code class="signature apipage">ongamepadbuttondown(gamepad:Int<span></span>, button:Int<span></span>, value:Float<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is pressed, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttonup"><a class="lift" href="#ongamepadbuttonup">ongamepadbuttonup</a></a><code class="signature apipage">ongamepadbuttonup(gamepad:Int<span></span>, button:Int<span></span>, value:Float<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is released, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><code class="signature apipage">ongamepaddevice(gamepad:Int<span></span>, type:snow.types.GamepadDeviceEventType<span></span>, timestamp:Float<span></span>) : Void</code><br/><span class="small_desc_flat">Called for you when a gamepad is connected or disconnected, use `which` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="get_runtime_config"><a class="lift" href="#get_runtime_config">get\_runtime\_config</a></a><code class="signature apipage">get\_runtime\_config() : Dynamic</code><br/><span class="small_desc_flat">override this if you want to change how the runtime config is loaded/handled</span>
        </span>
    <span class="method apipage">
            <a name="get_default_window_config"><a class="lift" href="#get_default_window_config">get\_default\_window\_config</a></a><code class="signature apipage">get\_default\_window\_config() : snow.types.WindowConfig</code><br/><span class="small_desc_flat">returns a already configured default value window config to set only specific values against in your get_window_config function</span>
        </span>
    <span class="method apipage">
            <a name="get_window_config"><a class="lift" href="#get_window_config">get\_window\_config</a></a><code class="signature apipage">get\_window\_config() : snow.types.WindowConfig</code><br/><span class="small_desc_flat">override this with your own function to change window flags, only used by specifying that snow must create a default window</span>
        </span>
    <span class="method apipage">
            <a name="get_asset_list"><a class="lift" href="#get_asset_list">get\_asset\_list</a></a><code class="signature apipage">get\_asset\_list() : Array</code><br/><span class="small_desc_flat">override this if you want to change how the asset list is loaded/handled. By default it uses the asset manifest generated by the build tools.</span>
        </span>
    <span class="method apipage">
            <a name="on_internal_init"><a class="lift" href="#on_internal_init">on\_internal\_init</a></a><code class="signature apipage">on\_internal\_init() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_internal_update"><a class="lift" href="#on_internal_update">on\_internal\_update</a></a><code class="signature apipage">on\_internal\_update() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : Void</code><br/><span class="small_desc_flat">The default constructor of an App is empty, so you can override it if you want, but take note that this happens way before snow is ready for use. Use [ready](#ready) for entry point.</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;