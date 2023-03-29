function scr_personagem_colisao(){
	if place_meeting(x + hveloc, y, oParede){
	while !place_meeting(x + sign(hveloc), y, oParede){
		x += sign(hveloc);
	}
	
	hveloc = 0
}

x += hveloc;


if place_meeting(x, y + vveloc, oParede){
	while !place_meeting(x, y + sign(vveloc), oParede){
		y += sign(vveloc);
		
	}
	
	vveloc = 0;
	
}


y += vveloc
}

function scr_personagem_andando(){
	 //Movientação
direita = keyboard_check(ord("D"));
cima = keyboard_check(ord("W"));
esquerda = keyboard_check(ord("A"));
baixo = keyboard_check(ord("S"));

hveloc = (direita - esquerda);
vveloc = (baixo - cima);

veloc_dir = point_direction(x, y, x + hveloc, y + vveloc);

if hveloc != 0 or vveloc != 0{
	veloc = 2;
	}else{
		veloc = 0;
	}

hveloc = lengthdir_x(veloc, veloc_dir);
vveloc = lengthdir_y(veloc, veloc_dir);

scr_personagem_colisao();

//Mudar as sprites
dir = floor((point_direction(x, y, mouse_x, mouse_y)+ 45)/90);

if hveloc == 0 and vveloc == 0{
    switch dir{
	    default:
	        sprite_index = sPersonagem_parado_direita;
	    break;
	    case 1:
	        sprite_index = sPersonagem_parado_cima;
	    break;
	    case 2:
	        sprite_index = sPersonagem_parado_esquerda;
	    break;
	    case 3:
	        sprite_index = sPersonagem_parado_baixo;
	    break;
    }
}else{
	 switch dir{
	    default:
	        sprite_index = sPersonagem_correndo_direita;
	    break;
	    case 1:
	        sprite_index = sPersonagem_correndo_cima;
	    break;
	    case 2:
	        sprite_index = sPersonagem_correndo_esquerda;
	    break;
	    case 3:
	        sprite_index = sPersonagem_correndo_baixo;
	    break;
    }

}

#region Dash
if estamina >= 10{
if mouse_check_button_pressed(mb_right){
	estamina -= 10;
	alarm[1] = 100;
	alarm[0] = 8;
	dash_dir = point_direction(x, y, mouse_x, mouse_y);
	estado = scr_personagem_dash;
	        }
	    }
		#endregion

    if mouse_check_button_pressed(mb_left){
		image_index = 0;
		
		switch dir{
			//Direita
			default:
			    sprite_index = sPersonagem_atacando_direita;
			break;
			//Cima
			case 1:
			    sprite_index = sPersonagem_atacando_cima;
			break;
			//Esquerda
			case 2:
			    sprite_index = sPersonagem_atacando_esquerda
			break;
			//Baixo
			case 3:
			    sprite_index = sPersonagem_atacando_baixo
			break;
		}
		
		estado = scr_personagem_atacando;
	}
}

function scr_personagem_dash(){
	tomardano = false;
	
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
	scr_personagem_colisao();
	
	var _inst = instance_create_layer(x, y, "Instances", oDash);
	_inst.sprite_index = sprite_index;
}

function scr_personagem_atacando(){
	if image_index >= 1{
	    if atacar == false{
	        switch dir{
		        //Direita
		        default:
			        instance_create_layer(x + 10, y, "Instances", oPlayer_hitbox);
		        break;
		        //Cima
		        case 1:
			        instance_create_layer(x, y - 10, "Instances", oPlayer_hitbox);
		        break;
		        //Esquerda
		        case 2:
			        instance_create_layer(x - 10, y, "Instances", oPlayer_hitbox);
		        break;
		        //Baixo
		        case 3:
			        instance_create_layer(x, y + 10, "Instances", oPlayer_hitbox);
		        break;
	        }
		
		    atacar = true;
	    }
	}
	
	if fim_da_animacao(){
		estado = scr_personagem_andando;
		atacar = false;
	}
}
	
function scr_personagem_hit(){
	if alarm[2] > 0{
	    hveloc = lengthdir_x(3, empurrar_dir);
	    vveloc = lengthdir_y(3, empurrar_dir);
	
	    scr_personagem_colisao();
    }else{
	    estado = scr_personagem_andando;
	}
}	