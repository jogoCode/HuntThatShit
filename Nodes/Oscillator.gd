extends Node
class_name Oscillator;

signal SetVelocity(amplitude);

@export var _target:Node2D;
@export var _mode:modes

var _velocity:float;
var _spring:float = 918.5;
var _displacement:float;
var _damp:float = 16.3;

enum modes{
	ROTATION,
	SCALE
}

func _process(delta):
	Oscillator(delta);
	match _mode:
		modes.ROTATION:
			pass;
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
	_target.scale =  Vector2(3,3)+ Vector2(_displacement,-_displacement) * 2;

func _on_set_velocity(amplitude):
	_velocity = amplitude;
