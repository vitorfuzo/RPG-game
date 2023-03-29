/// @description Inserir descrição aqui
other.vida -= oPlayer.dano;

var _dir = point_direction(oPlayer.x, oPlayer.y, other.x, other.y);
other.empurrar_dir = _dir;
other.empurrar_veloc = 6;
other.estado = scr_slime_hit;

other.alarm[1] = 5;
other.hit = true;

var _inst = instance_create_layer(x, y, "Instances", oDano);
_inst.alvo = other;
_inst.dano = oPlayer.dano;