#include "rotations.inc"

#include <test-boilerplate>
#include <zcmd>


new vehicle1, object1, object2;
main() {
	vehicle1 = CreateVehicle(400, 302.0, 1800.0, 18.0, 0.0, 0, 0, 0);
	object1 = CreateObject(1337, 302.0, 1806.0, 18.0, 0.0, 0.0, 0.0);
	object2 = CreateObject(1337, 302.0, 1808.0, 18.0, 0.0, 0.0, 0.0);
}

CMD:example1() {
	new
		Float:w,
		Float:x,
		Float:y,
		Float:z,
		Float:rX,
		Float:rY,
		Float:rZ,
		Float:X,
		Float:Y,
		Float:Z;

	GetVehicleRotationQuat(vehicle1, w, x, y, z);
	GetVehiclePos(vehicle1, X, Y, Z);
	// x offset = 0.0, y offset (in front) = 25.0, z offset = 0.0
	// Note!, preload X, Y, Z with the center of the rotation!
	QuatRotate(w, x, y, z, 0.0, 25.0, 0.0, X, Y, Z);
	SetObjectPos(object1, X, Y, Z);
	// Gets the correct euler angles from the quat
	GetEulerFromQuat(w, x, y, z, rX, rY, rZ);
	SetObjectRot(object1, rX, rY, rZ);

	return 1;
}

CMD:example2() {
	new
		Float:rX,
		Float:rY,
		Float:rZ,
		Float:oX,
		Float:oY,
		Float:oZ,
		Float:matrix[4][4];

	GetObjectPos(object2, oX, oY, oZ);
	GetObjectRot(object2, rX, rY, rZ);
	// Get rotation Matrix from Euler
	GetRotationMatrixFromEuler(matrix, rX, rY, rZ);
	// Rotate matrix around relative point of object
	// 0.0, 0.0, 1.0 = relative point = 1.0 above object center
	// 5.0, 0.0, 0.0 = euler rotation = 5.0 degress in rX direction
	RotMatrixEulerAroundRelPoint(matrix, 0.0, 0.0, 1.0, 5.0, 0.0, 0.0);
	// Getting relative point, 0.0, 0.0, 0.0, 1.0 = offsets x, y, z and translation
	// because we only need the translation we set, x, y, z offsets to 0.0
	MatrixRotate(matrix, 0.0, 0.0, 0.0, 1.0, oX, oY, oZ);
	// set new object pos
	SetObjectPos(object2, oX, oY, oZ);
	// get euler from matrix
	GetEulerFromMatrix(matrix, rX, rY, rZ);
	// set new object rot
	SetObjectRot(object2, rX, rY, rZ);

	return 1;
}