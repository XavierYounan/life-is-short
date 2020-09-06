///Ball "physics"

/* Create event of water particle to put in oIceCube
var pd = point_direction(mouse_x, mouse_y, x, y);
var dis = point_distance(mouse_x, mouse_y, x, y);

hsp = lengthdir_x(dis / 10, pd);
vsp = lengthdir_y(dis / 10, pd);
*/

//----------Bouncing off walls, friction, and gravity----------

grounded = (place_meeting(x, y + 1, obj_wall));

if (!grounded) {
    vsp += grav;
} else {
    if (abs(0 - hsp) > 0.5) {
        hsp -= hsp / 10;
    } else {
        hsp = 0;
    }
}

//Horizontal collisions
if (place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = -hsp / 2;
}

//Horizontal movement
x += hsp;

//Vertical collisions
if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = -vsp / 1.5;
}

//Vertical movement
if (grounded) && (abs(0 - vsp) < 1) vsp = 0;
y += vsp;

//Rotating
dir += -hsp * 2;