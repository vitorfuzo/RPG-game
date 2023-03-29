/// @description Inserir descrição aqui
var _escala = 3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(sHud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = oPlayer.vida;
var _maxvida = oPlayer.max_vida;

var _estamina = oPlayer.estamina;
var _maxestamina = oPlayer.max_estamina;


//Barra de vida
draw_sprite_ext(sHud_barra_vida, 0, 0, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1);

//Barra de Estamina
draw_sprite_ext(sHud_barra_estamina, 0, 0, _huda + 24, (_estamina / _maxestamina) * _escala, _escala, 0, c_white, 1);

//HUD
draw_sprite_ext(sHud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1);
