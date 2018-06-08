# rotations.inc

[![sampctl](https://shields.southcla.ws/badge/sampctl-rotations.inc-2f2f2f.svg?style=for-the-badge)](https://github.com/sampctl/rotations.inc)

Nero_3D's rotations.inc because it doesn't have a definitive GitHub repo for
package management via [sampctl](http://sampctl.com).

Original thread: http://forum.sa-mp.com/showthread.php?t=614857

Original documentation, in Markdown format:

---

Well, nothing new I guess, this include gives you the possibility to convert
rotations, all kind of

## Installation

Simply install to your project:

```bash
sampctl package install sampctl/rotations.inc
```

Include in your code and begin using the library:

```pawn
#include <rotations>
```

## Usage

### Functions

```pawn
// AroundRelPoint
RotMatrixMatrixAroundRelPoint(Float: matrix1[4][4], Float: oX, Float: oY, Float: oZ, Float: matrix2[4][4])
RotMatrixQuatAroundRelPoint(Float: matrix[4][4], Float: oX, Float: oY, Float: oZ, Float: w, Float: x, Float: y, Float: z)
RotMatrixEulerAroundRelPoint(Float: matrix[4][4], Float: oX, Float: oY, Float: oZ, Float: rX, Float: rY, Float: rZ, eulermode: mode = euler_samp)
RotMatrixAxisAroundRelPoint(Float: matrix1[4][4], Float: oX, Float: oY, Float: oZ, Float: angle, Float: aX, Float: aY, Float: aZ)
// AroundPoint
RotMatrixMatrixAroundPoint(Float: matrix1[4][4], Float: x, Float: y, Float: z, Float: matrix2[4][4])
RotMatrixQuatAroundPoint(Float: matrix[4][4], Float: x, Float: y, Float: z, Float: w, Float: qX, Float: qY, Float: qZ)
RotMatrixEulerAroundPoint(Float: matrix[4][4], Float: x, Float: y, Float: z, Float: rX, Float: rY, Float: rZ, eulermode: mode = euler_samp)
RotMatrixAxisAroundPoint(Float: matrix1[4][4], Float: x, Float: y, Float: z, Float: angle, Float: aX, Float: aY, Float: aZ)
// TranslateMatrix
TranslateMatrix(Float: matrix[4][4], Float: x, Float: y, Float: z)
// RotateMatrix
RotateMatrixWithMatrix(Float: matrix1[4][4], Float: matrix2[4][4])
RotateMatrixWithQuat(Float: matrix[4][4], Float: w, Float: x, Float: y, Float: z)
RotateMatrixWithEuler(Float: matrix[4][4], Float: rX, Float: rY, Float: rZ, eulermode: mode = euler_samp)
RotateMatrixWithAxisAngle(Float: matrix[4][4], Float: angle, Float: aX, Float: aY, Float: aZ)
// GetTranslationMatrix
GetTranslationMatrix(Float: matrix[4][4], Float: x, Float: y, Float: z)
// GetRotationMatrix
GetRotationMatrixFromQuat(Float: matrix[4][4], Float: w, Float: x, Float: y, Float: z)
GetRotationMatrixFromEuler(Float: matrix[4][4], Float: rX, Float: rY, Float: rZ, eulermode: mode = euler_samp)
GetRotationMatrixFromAxisAngle(Float: matrix[4][4], Float: angle, Float: aX, Float: aY, Float: aZ)
// GetQuat
GetQuatFromMatrix(Float: matrix[][], & Float: w, & Float: x, & Float: y, & Float: z)
GetQuatFromEuler(Float: rX, Float: rY, Float: rZ, & Float: w, & Float: x, & Float: y, & Float: z, eulermode: mode = euler_samp)
GetQuatFromAxisAngle(Float: angle, Float: aX, Float: aY, Float: aZ, & Float: w, & Float: x, & Float: y, & Float: z)
// GetEuler
GetEulerFromMatrix(Float: matrix[][], & Float: rX, & Float: rY, & Float: rZ, eulermode: mode = euler_samp)
GetEulerFromQuat(Float: w, Float: x, Float: y, Float: z, & Float: rX, & Float: rY, & Float: rZ, eulermode: mode = euler_samp)
GetEulerFromEuler(Float: oX, Float: oY, Float: oZ, eulermode: omode, & Float: rX, & Float: rY, & Float: rZ, eulermode: mode = euler_samp)
GetEulerFromAxisAngle(Float: angle, Float: aX, Float: aY, Float: aZ, & Float: rX, & Float: rY, & Float: rZ, eulermode: mode = euler_samp)
// GetAxisAngle
GetAxisAngleFromMatrix(Float: matrix[][], & Float: angle, & Float: aX, & Float: aY, & Float: aZ)
GetAxisAngleFromQuat(Float: w, Float: x, Float: y, Float: z, & Float: angle, & Float: aX, & Float: aY, & Float: aZ)
GetAxisAngleFromEuler(Float: rX, Float: rY, Float: rZ, & Float: angle, & Float: aX, & Float: aY, & Float: aZ, eulermode: mode = euler_samp)
// Rotate function to get a relative position
// oX, oY, oZ = offsets, oT = Translation (usually only 0.0 or 1.0)
// X, Y, Z = preset these with the center of rotation
MatrixRotate(Float: matrix[4][4], Float: oX, Float: oY, Float: oZ, Float: oT, & Float: X, & Float: Y, & Float: Z)
QuatRotate(Float: w, Float: x, Float: y, Float: z, Float: oX, Float: oY, Float: oZ, & Float: X, & Float: Y, & Float: Z)
EulerRotate(Float: rX, Float: rY, Float: rZ, Float: oX, Float: oY, Float: oZ, & Float: X, & Float: Y, & Float: Z, eulermode: mode = euler_samp)
AxisAngleRotate(Float: angle, Float: aX, Float: aY, Float: aZ, Float: oX, Float: oY, Float: oZ, & Float: X, & Float: Y, & Float: Z)
// Functions for attaching / detaching objects from vehicle
GetVehicleObjectPositionWorld(vehicleid, Float: att_X, Float: att_Y, Float: att_Z, Float: att_rotX, Float: att_rotY, Float: att_rotZ, &Float: X, &Float: Y, &Float: Z, &Float: rotX, &Float: rotY, &Float: rotZ)
GetVehicleObjectPositionOffset(vehicleid, Float: X, Float: Y, Float: Z, Float: rotX, Float: rotY, Float: rotZ, &Float: att_X, &Float: att_Y, &Float: att_Z, &Float: att_rotX, &Float: att_rotY, &Float: att_rotZ)  
```

### Examples

Object in front of vehicle

```pawn
// object is somewhere globally defined
new
   Float: w, Float: x, Float: y, Float: z,
   Float: rX, Float: rY, Float: rZ,
   Float: X, Float: Y, Float: Z;

GetVehicleRotationQuat(vehicleid, w, x, y, z);
GetVehiclePos(vehicleid, X, Y, Z);
// x offset = 0.0, y offset (in front) = 25.0, z offset = 0.0
// Note!, preload X, Y, Z with the center of the rotation!
QuatRotate(w, x, y, z, 0.0, 25.0, 0.0, X, Y, Z);
SetObjectPos(object, X, Y, Z);
// Gets the correct euler angles from the quat
GetEulerFromQuat(w, x, y, z, rX, rY, rZ);
SetObjectRot(object, rX, rY, rZ);
```

Rotation about point of object

```pawn
new
    Float: rX,
    Float: rY,
    Float: rZ,
    Float: oX,
    Float: oY,
    Float: oZ,
    Float: matrix[4][4]
;
GetObjectPos(object, oX, oY, oZ);
GetObjectRot(object, rX, rY, rZ);
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
SetObjectPos(object, oX, oY, oZ);
// get euler from matrix
GetEulerFromMatrix(matrix, rX, rY, rZ);
// set new object rot
SetObjectRot(object, rX, rY, rZ);
```

## Testing

To demonstrate the two above examples, run:

```bash
sampctl package run
```

And connect to `localhost:7777`, you will find two objects and a vehicle.
Executing `/example1` will demonstrate the first example above, the object will
be placed in front of the vehicle regardless of its rotation. Executing
`/example2` will demonstrate the second example which is the object rotating
about a point offset from its origin.
