// Smoke Tube
// XXXPARTICLEEFFECTSOURCEXXX setParticleCircle [0, [0, 0, 0]];
// XXXPARTICLEEFFECTSOURCEXXX setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.5, [0, 0, 0, 0], 0, 0];
// XXXPARTICLEEFFECTSOURCEXXX setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 40], [0, 0, 0], 0, 1, -1, 0.1, [2, 10, 4], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
// XXXPARTICLEEFFECTSOURCEXXX setDropInterval 0.05;

// Smoke Ball
// XXXPARTICLEEFFECTSOURCEXXX setParticleCircle [3, [0, 0, 0]];
// XXXPARTICLEEFFECTSOURCEXXX setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
// XXXPARTICLEEFFECTSOURCEXXX setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 200, [0, 0, 0], [0, 0, 0], 0, 6.37, 5, 0.085, [10, 15, 20, 25, 30], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
// XXXPARTICLEEFFECTSOURCEXXX setDropInterval 0.05;

_logic = param[0, objNull, [objNull]];
_activated = param[2, true, [true]];

if (_activated) then
{
	playSound3D [format["A3\Sounds_F\weapons\falling_bomb\fall_0%1%2", str selectRandom [1, 2, 3, 4], ".wss"], _logic];
	_future = time + 6;
	waitUntil {time >= _future};
	playSound3D [format["A3\Sounds_F\weapons\explosion\gr_explosion_%1%2", str selectRandom [1, 2, 3, 4, 5, 6], ".wss"], _logic];
	playSound3D [format["A3\Sounds_F\weapons\smokeshell\smoke_%1%2", str selectRandom [1, 2, 3], ".wss"], _logic];
	_smoke = "#particlesource" createVehicleLocal getPos _logic;
	_smoke setParticleCircle [3, [0, 0, 0]];
	_smoke setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_smoke setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 60, [0, 0, 1], [0, 0, 0], 0, 6.37, 5, 0.085, [3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _logic, 0, true, 0.5]; 
	_smoke setDropInterval 0.05;
	_file = format["A3\Sounds_F\weapons\smokeshell\smoke_loop%1%2", str selectRandom [1, 2], ".wss"];
	_future = time + 300;
	playSound3D [_file, _logic];
	_sound = time + 2;
	waitUntil
	{
		if (time >= _sound) then
		{
			playSound3D [_file, _logic];
			_sound = time + 2;
		};
		time >= _future
	};
	deleteVehicle _logic;
};

true