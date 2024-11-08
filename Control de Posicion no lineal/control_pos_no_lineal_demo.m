%% Control de posici�n no lineal de un manipulador rob�tico %%%%%%%%%%%%%%%
%               Nombre                  Legajo
%   Grupo:     -Lin, Xi                 59780
%              -Muscariello, Gianfranco 60361
%              -Figueroa, Alejo         60412
%              -Molina, Facundo         60526
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Introducci�n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Se desarrollar� un controlador Cartesiano de posici�n para desplazar
% el efector final desde el punto (x0, y0) hasta el punto (x1, y1) 
% Adem�s, se insertar� un obst�culo en la forma de una pared en el plano
% XY, conteniendo los puntos (2,0) y (0,2)
% Finalmente, se repetiran las pruebas con una perturbaci�n del 80%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preparaci�n del espacio de trabajo
clc
%% Inicializaci�n de variables de trabajo
% Luego de inicializar, se cargan al espacio de trabajo:
%   -Robot y RobotPlanta: Robot es el robot completo
%   -RobotPlanta = Robot.links (para Simulink)
%   -pos: posiciones x,y,z en funcion del tiempo para la trayectoria deseada
%   -vel: velocidades x,y,x en funcion del tiempo para la trayectoria
%   -acc: aceleraciones x,y,x en funcion del tiempo para la trayectoria
%   -Kv, Kp: par�metros del control PD

init_control_cartesiano;

%Correr Simulaci�n en Simulink
control_pos_no_lineal;

%Graficar espacio cartesiano y espacio de joints, desado y real
graficar_control_cartesiano;