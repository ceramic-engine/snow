package lumen;

import lumen.Lumen;
import lumen.utils.ByteArray;

typedef LumenConfig = {

    ? host                  : App,
    ? window_config         : WindowConfig

} //LumenConfig

typedef ImageInfo = {

    bpp : Int,          //used bits per pixel
    width : Int,        //image width
    height : Int,       //image height
    bpp_source : Int,   //source bits per pixel
    data : ByteArray    //image data

}

typedef WindowConfig = {

    ? fullscreen            : Bool,
    ? resizable             : Bool,
    ? borderless            : Bool,
    ? antialiasing          : Int,
    ? stencil_buffer        : Bool,
    ? depth_buffer          : Bool,
    ? vsync                 : Bool,
    ? fps                   : Int,
    ? x                     : Int,
    ? y                     : Int,
    ? width                 : Int,
    ? height                : Int,
    ? title                 : String,

    ? orientation           : String,
    ? multitouch_supported  : Bool,
    ? multitouch            : Bool

} //WindowConfig

typedef SystemEvent = {

    ? type : SystemEventType,

        //certain events have data structures passed in
        //which are null if that event is not of the right type
        //so, if this event.type == se_window, window should be non-null
        //and populated with the specifics to that event
    ? window : WindowEvent,
    ? input : InputEvent

} //SystemEvent

typedef WindowEvent = {

    ? type : WindowEventType,
    ? timestamp : Int,
    ? window_id : Int,
    ? event : Dynamic

} //WindowEvent

typedef InputEvent = {

    ? type : InputEventType,
    ? timestamp : Int,
    ? window_id : Int,
    ? event : Dynamic

} //InputEvent


enum SystemEventType {

    unknown;

    ready;    
    update;
    shutdown;
    window;
    input;

    quit;
    app_terminating;
    app_lowmemory;
    app_willenterbackground;
    app_didenterbackground;
    app_willenterforeground;
    app_didenterforeground;

} //SystemEventType

//Window stuff

enum WindowEventType {

    unknown;

    window_created;
    window_shown;
    window_hidden;
    window_exposed;
    window_moved;
    window_resized;
    window_size_changed;
    window_minimized;
    window_maximized;
    window_restored;
    window_enter;
    window_leave;
    window_focus_gained;
    window_focus_lost;
    window_close;
    
} //WindowEventType


enum InputEventType {

    unknown;

    key;
    mouse;
    touch;
    joystick;
    controller;

} //InputEventType

class SystemEvents {
        
        //lumen core events

    public static var se_unknown                    = 0;
    public static var se_ready                      = 1;
    public static var se_update                     = 2;
    public static var se_shutdown                   = 3;
    public static var se_window                     = 4;
    public static var se_input                      = 5;

        //lumen application events

    public static var se_quit                       = 6;
    public static var se_app_terminating            = 7;
    public static var se_app_lowmemory              = 8;
    public static var se_app_willenterbackground    = 9;
    public static var se_app_didenterbackground     = 10;
    public static var se_app_willenterforeground    = 11;
    public static var se_app_didenterforeground     = 12;

//Helpers

    public static function typed(type:Int) : SystemEventType {
        
            if(type == se_ready)                        return SystemEventType.ready;
            if(type == se_update)                       return SystemEventType.update;
            if(type == se_shutdown)                     return SystemEventType.shutdown;
            if(type == se_window)                       return SystemEventType.window;
            if(type == se_input)                        return SystemEventType.input;

            if(type == se_quit)                         return SystemEventType.quit;
            if(type == se_app_terminating)              return SystemEventType.app_terminating;
            if(type == se_app_lowmemory)                return SystemEventType.app_lowmemory;
            if(type == se_app_willenterbackground)      return SystemEventType.app_willenterbackground;
            if(type == se_app_didenterbackground)       return SystemEventType.app_didenterbackground;
            if(type == se_app_willenterforeground)      return SystemEventType.app_willenterforeground;
            if(type == se_app_didenterforeground)       return SystemEventType.app_didenterforeground;

        return SystemEventType.unknown;

    } //typed

} //SystemEvents

class WindowEvents {
    
//window events

    public static var we_unknown          = 0;
    public static var we_created          = 1;
    public static var we_shown            = 2;
    public static var we_hidden           = 3;
    public static var we_exposed          = 4;
    public static var we_moved            = 5;
    public static var we_resized          = 6;
    public static var we_size_changed     = 7;
    public static var we_minimized        = 8;
    public static var we_maximized        = 9;
    public static var we_restored         = 10;
    public static var we_enter            = 11;
    public static var we_leave            = 12;
    public static var we_focus_gained     = 13;
    public static var we_focus_lost       = 14;
    public static var we_close            = 15;

//Helpers

    public static function typed(type:Int) : WindowEventType {
        
            if(type == we_created)        return WindowEventType.window_created;
            if(type == we_shown)          return WindowEventType.window_shown;
            if(type == we_hidden)         return WindowEventType.window_hidden;
            if(type == we_exposed)        return WindowEventType.window_exposed;
            if(type == we_moved)          return WindowEventType.window_moved;
            if(type == we_resized)        return WindowEventType.window_resized;
            if(type == we_size_changed)   return WindowEventType.window_size_changed;
            if(type == we_minimized)      return WindowEventType.window_minimized;
            if(type == we_maximized)      return WindowEventType.window_maximized;
            if(type == we_restored)       return WindowEventType.window_restored;
            if(type == we_enter)          return WindowEventType.window_enter;
            if(type == we_leave)          return WindowEventType.window_leave;
            if(type == we_focus_gained)   return WindowEventType.window_focus_gained;
            if(type == we_focus_lost)     return WindowEventType.window_focus_lost;
            if(type == we_close)          return WindowEventType.window_close;
            
        return WindowEventType.unknown;

    } //typed

} //WindowEvents

class InputEvents {
    
//Input events

        public static var ie_unknown                    = 0;

        public static var ie_key                        = 1;
        public static var ie_mouse                      = 2;
        public static var ie_touch                      = 3;
        public static var ie_joystick                   = 4;
        public static var ie_controller                 = 5;

//Helpers

    public static function typed(type:Int) : InputEventType {
        
            if(type == ie_unknown)      return InputEventType.unknown;
            if(type == ie_key)          return InputEventType.key;
            if(type == ie_mouse)        return InputEventType.mouse;
            if(type == ie_touch)        return InputEventType.touch;
            if(type == ie_joystick)     return InputEventType.joystick;
            if(type == ie_controller)   return InputEventType.controller;
            
        return InputEventType.unknown;

    } //typed

} //InputEvents
