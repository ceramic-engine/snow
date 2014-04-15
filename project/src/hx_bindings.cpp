#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
// Include neko glue....
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>

#ifdef ANDROID
#include <android/log.h>
#endif

#include "hx_bindings.h"
#include "lumen_core.h"
#include "lumen_window.h"
#include "ByteArray.h"
#include "libs/lzma/lzma.h"

namespace lumen {

        //has id's etc been inited?
    static int global_lumen_init = false;
        //a "kind" type for native wrapped objects
    vkind global_lumen_object_kind;
        //core event haxe callback handler
        //a core system event handler implementation (defined in hx_bindings.h)
    AutoGCRoot *system_event_handler = 0;

    int id_id;
    int id_type;
    int id_width;
    int id_height;

    int id_window;
    int id_window_id;
    int id_title;
    int id_fullscreen;
    int id_resizable;
    int id_borderless;
    int id_antialiasing;
    int id_depth_buffer;
    int id_stencil_buffer;
    int id_vsync;
    int id_fps;

    extern "C" void lumen_entry_point() {

        if (global_lumen_init){
            return;
        }

       global_lumen_init = true;

       lumen_init_ids();

    } //lumen_entry_point

    DEFINE_ENTRY_POINT(lumen_entry_point)

    value lumen_init( value _on_event ) {

            //fetch the callback for system events
        system_event_handler = new AutoGCRoot(_on_event);

            //now init the core
        lumen_core_init();

        return alloc_null();
    
    } DEFINE_PRIM(lumen_init, 1);

    value lumen_shutdown() {

            //now shutdown the core
        lumen_core_shutdown();

        return alloc_null();
    
    } DEFINE_PRIM(lumen_shutdown, 0);





//Window





    value lumen_window_create( value _in_config, value _on_created ) {

            //fetch the callback for when it's done opening the window
        AutoGCRoot *on_created = new AutoGCRoot( _on_created );
            
            //fetch window config from the haxe side
        window_config config = window_config_from_hx(_in_config);
            //create the actual window
        create_window( config, on_created );

        return alloc_null();
    
    } DEFINE_PRIM(lumen_window_create, 2);


    value lumen_window_update( value _window ) {

        LumenWindow* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->update();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(lumen_window_update, 1);

    value lumen_window_render( value _window ) {

        LumenWindow* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->render();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(lumen_window_render, 1);

    value lumen_window_swap( value _window ) {

        LumenWindow* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->swap();

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(lumen_window_swap, 1);


    value lumen_window_simple_message( value _window, value _message, value _title ) {

        LumenWindow* window = NULL;

        if( Object_from_hx(_window, window) ) {

            window->simple_message( val_string(_message), val_string(_title) );

        } //fetch window

        return alloc_null();

    } DEFINE_PRIM(lumen_window_simple_message, 3);










// LZMA

    value lumen_lzma_encode(value input_value)
    {
       buffer input_buffer = val_to_buffer(input_value);
       buffer output_buffer = alloc_buffer_len(0);
       Lzma::Encode(input_buffer, output_buffer);
       return buffer_val(output_buffer);
    } DEFINE_PRIM(lumen_lzma_encode,1);

    value lumen_lzma_decode(value input_value)
    {
       buffer input_buffer = val_to_buffer(input_value);
       buffer output_buffer = alloc_buffer_len(0);
       Lzma::Decode(input_buffer, output_buffer);
       return buffer_val(output_buffer);
    } DEFINE_PRIM(lumen_lzma_decode,1);


// --- ByteArray -----------------------------------------------------

AutoGCRoot *gByteArrayCreate = 0;
AutoGCRoot *gByteArrayLen = 0;
AutoGCRoot *gByteArrayResize = 0;
AutoGCRoot *gByteArrayBytes = 0;

value lumen_byte_array_init(value inFactory, value inLen, value inResize, value inBytes)
{
   gByteArrayCreate = new AutoGCRoot(inFactory);
   gByteArrayLen = new AutoGCRoot(inLen);
   gByteArrayResize = new AutoGCRoot(inResize);
   gByteArrayBytes = new AutoGCRoot(inBytes);
   return alloc_null();
}
DEFINE_PRIM(lumen_byte_array_init,4);

ByteArray::ByteArray(int inSize)
{
   mValue = val_call1(gByteArrayCreate->get(), alloc_int(inSize) );
}

ByteArray::ByteArray() : mValue(0) { }

ByteArray::ByteArray(const QuickVec<uint8> &inData)
{
   mValue = val_call1(gByteArrayCreate->get(), alloc_int(inData.size()) );
   uint8 *bytes = Bytes();
   if (bytes)
     memcpy(bytes, &inData[0], inData.size() );
}

ByteArray::ByteArray(const ByteArray &inRHS) : mValue(inRHS.mValue) { }

ByteArray::ByteArray(value inValue) : mValue(inValue) { }

void ByteArray::Resize(int inSize)
{
   val_call2(gByteArrayResize->get(), mValue, alloc_int(inSize) );
}

int ByteArray::Size() const
{
   return val_int( val_call1(gByteArrayLen->get(), mValue ));
}


const unsigned char *ByteArray::Bytes() const
{
   value bytes = val_call1(gByteArrayBytes->get(),mValue);
   if (val_is_string(bytes))
      return (unsigned char *)val_string(bytes);
   buffer buf = val_to_buffer(bytes);
   if (buf==0)
   {
      val_throw(alloc_string("Bad ByteArray"));
   }
   return (unsigned char *)buffer_data(buf);
}


unsigned char *ByteArray::Bytes()
{
   value bytes = val_call1(gByteArrayBytes->get(),mValue);
   if (val_is_string(bytes))
      return (unsigned char *)val_string(bytes);
   buffer buf = val_to_buffer(bytes);
   if (buf==0)
   {
      val_throw(alloc_string("Bad ByteArray"));
   }
   return (unsigned char *)buffer_data(buf);
}

// --------------------

// [ddc]
value lumen_byte_array_overwrite_file(value inFilename, value inBytes)
{
   // file is created if it doesn't exist,
   // if it exists, it is truncated to zero
   FILE *file = OpenOverwrite(val_os_string(inFilename));
   if (!file)
   {
      #ifdef ANDROID
      // [todo]
      #endif
      return alloc_null();
   }

   ByteArray array(inBytes);

   // The function fwrite() writes nitems objects, each size bytes long, to the
   // stream pointed to by stream, obtaining them from the location given by
   // ptr.
   // fwrite(const void *restrict ptr, size_t size, size_t nitems, FILE *restrict stream);
   fwrite( array.Bytes() , 1, array.Size() , file);

   fclose(file);
   return alloc_null();
}
DEFINE_PRIM(lumen_byte_array_overwrite_file,2);

value lumen_byte_array_read_file(value inFilename)
{
   ByteArray result = ByteArray::FromFile(val_os_string(inFilename));
   return result.mValue;
}
DEFINE_PRIM(lumen_byte_array_read_file,1);


value lumen_byte_array_get_native_pointer(value inByteArray)
{
   ByteArray bytes (inByteArray);
   if (!val_is_null (bytes.mValue))
   {
      return alloc_int((intptr_t)bytes.Bytes ());
   }
   return alloc_null();
}
DEFINE_PRIM(lumen_byte_array_get_native_pointer,1);




ByteArray ByteArray::FromFile(const OSChar *inFilename)
{
   FILE *file = OpenRead(inFilename);
   if (!file)
   {
      #ifdef ANDROID
      return AndroidGetAssetBytes(inFilename);
      #endif
      return ByteArray();
   }

   fseek(file,0,SEEK_END);
   int len = ftell(file);
   fseek(file,0,SEEK_SET);

   ByteArray result(len);
   int status = fread(result.Bytes(),len,1,file);
   fclose(file);

   return result;
}


#ifdef HX_WINDOWS
ByteArray ByteArray::FromFile(const char *inFilename)
{
   FILE *file = fopen(inFilename,"rb");
   if (!file)
      return ByteArray();

   fseek(file,0,SEEK_END);
   int len = ftell(file);
   fseek(file,0,SEEK_SET);

   ByteArray result(len);
   fread(result.Bytes(),len,1,file);
   fclose(file);

   return result;
}
#endif










        // Reference this to bring in all 
        //the symbols for the static library
    #ifdef STATIC_LINK
        extern "C" int lumen_opengl_sdl2_register_prims();
    #endif //STATIC_LINK

    extern "C" int lumen_register_prims() {

       lumen_entry_point();
        
        #ifdef STATIC_LINK
            lumen_opengl_sdl2_register_prims();
        #endif
       
       return 0;

    } //lumen_register_prims

} //namespace lumen