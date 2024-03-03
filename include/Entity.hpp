#pragma once

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <iostream>

#include "Math.hpp"

class Entity{
public:
	Entity(Vector2f p_pos, SDL_Texture* p_tex, Vector2f p_size);
	Vector2f& getPos(){
		return pos;
	}
	SDL_Texture* getTex();
	SDL_Rect getCurrentFrame();
	void moveRight(){
		pos.x += 15;
	}
	void moveLeft(){
		pos.x -= 15;
	}
	void setPos(Vector2f p_pos){
		pos = p_pos;
	}
	void setxPos(float p_x){
		pos.x = p_x;
	}
	void setyPos(float p_y){
		pos.y = p_y;
	}
	float getxPos(){
		return pos.x;
	}
private:
	Vector2f pos;
	SDL_Texture* tex;
	Vector2f size;
	SDL_Rect currentFrame;
};