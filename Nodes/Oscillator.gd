extends Node
class_name Oscillator;

signal SetVelocity(amplitude);

@export var _target:Node2D;
@export var _mode:modes

var _velocity:float;
var _spring:float = 918.5;
var _displacement:float;
var _damp:float = 16.3;

#------- ScaleMode

var _baseScale;

enum modes{
	ROTATION,
	SCALE
}

func _ready():
	match _mode:
		modes.SCALE:
			_baseScale = _target.scale;

func _process(delta):
	Oscillator(delta);
	match _mode:
		modes.SCALE:
			ScaleMode();

func Oscillator(delta):
	var force = -_spring * _displacement - _damp * _velocity;
	_velocity += force * delta;
	_displacement += _velocity * delta;
	return _displacement;

func SetValues(velocity,spring,displacement,damp):
	_velocity = velocity;
	_spring = spring;
	_displacement = displacement;
	_damp = damp;

func ScaleMode():
	_target.scale =  _baseScale+ Vector2(_displacement,-_displacement) * 2;

func _on_set_velocity(amplitude):
	print("uiyhuih")
	_velocity = amplitude;
