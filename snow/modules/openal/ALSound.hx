package snow.modules.openal;

import snow.api.Debug.*;
import snow.systems.audio.AudioSource;
import snow.systems.audio.AudioInstance;
import snow.types.Types.AudioHandle;

import snow.modules.openal.AL;
import snow.modules.openal.Audio;

@:log_as('AL sound')
@:allow(snow.modules.openal.Audio)
class ALSound {

    public var instance : AudioInstance;
    public var source : AudioSource;
    public var module : Audio;

    public var alsource : Int;
    public var alformat : Int;

        /** The current pan in -1,1 range */
    var pan : Float = 0.0;
    var looping : Bool = false;
    var current_time = 0.0;

    public function new(_module:Audio, _source:snow.systems.audio.AudioSource, _instance:AudioInstance) {
                
        module = _module;
        source = _source;
        instance = _instance;

        alsource = new_source();
        alformat = source_format();

    } //new

    public function init() {

        var _buffer:ALuint = module.buffers.get(source);

        if(_buffer == AL.NONE) {

            var _data = source.info.data;

            log(' > new buffer ${source.info.id} / ${alformat}');

            _buffer = AL.genBuffer();

            if(_data.samples != null) {
                AL.bufferData(_buffer, alformat, _data.rate, _data.samples.toBytes().getData(), _data.samples.byteOffset, _data.samples.byteLength); 
            } else {
                _buffer = AL.NONE;
                log(' > new buffer ${source.info.id} / created with AL.NONE buffer!');
            }

            err('new buffer');

            module.buffers.set(source, _buffer);

        } //_buffer == 0

        AL.sourcei(alsource, AL.BUFFER, _buffer);

        err('attach buffer');

    } //init

    function position(_time:Float) {
    
        AL.sourcef(alsource, AL.SEC_OFFSET, _time);
    
    } //position

    function position_of() {
        
        return AL.getSourcef(alsource, AL.SEC_OFFSET);

    } //position_of

    public function destroy() {

        AL.sourceStop(alsource);
        AL.deleteSource(alsource);

    } //destroy

    public function tick() : Void {
        
        instance.tick();
        current_time += module.app.host.tick_delta;

    } //tick

//internal

    inline function new_source() : Int {
        var _source = AL.genSource();
            AL.sourcef(_source, AL.GAIN, 1.0);
            AL.sourcei(_source, AL.LOOPING, AL.FALSE);
            AL.sourcef(_source, AL.PITCH, 1.0);
            AL.source3f(_source, AL.POSITION, 0.0, 0.0, 0.0);
            AL.source3f(_source, AL.VELOCITY, 0.0, 0.0, 0.0);
        return _source;
    }

    function err(reason:String) {
        var _err = AL.getError();
        if(_err != AL.NO_ERROR) {
            var _s = '$_err / $reason: failed with ' + ALError.desc(_err);
            trace(_s);
            throw _s;
        } else {
            _debug('$reason / no error');
        }
    }

    function source_format() {

        var _data = source.info.data;
        var _format = AL.FORMAT_MONO16;

        if(_data.channels > 1) {
            if(_data.bits_per_sample == 8) {
                _format = AL.FORMAT_STEREO8;
                _debug('source format: stereo 8');
            } else {
                _format = AL.FORMAT_STEREO16;
                _debug('source format: stereo 16');
            }
        } else { //mono
            if(_data.bits_per_sample == 8) {
                _format = AL.FORMAT_MONO8;
                _debug('source format: mono 8');
            } else {
                _format = AL.FORMAT_MONO16;
                _debug('source format: mono 16');
            }
        }


        return _format;

    } //source_format

} //ALAudioSource
