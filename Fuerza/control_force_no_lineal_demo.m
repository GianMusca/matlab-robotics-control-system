%% Control de fuerza no lineal de un manipulador rob�tico %%%%%%%%%%%%%%%
%               Nombre                  Legajo
%   Grupo:     -Lin, Xi                 59780
%              -Muscariello, Gianfranco 60361
%              -Figueroa, Alejo         60412
%              -Molina, Facundo         60526
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Introducci�n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Se insertar� un obst�culo en la forma de una pared en el plano
% XY, conteniendo los puntos (2,0) y (0,2)
% Luego se desarrollara un controlador de fuerza que haga que el
% manipulador mantenga una fuerza Fd contra la pared. 
% Finalmente, se repetiran las pruebas con una perturbaci�n del 80%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preparaci�n del espacio de trabajo
clc
%% Inicializaci�n de variables de trabajo
% Luego de inicializar, se cargan al espacio de trabajo:
%   -Robot y RobotPlanta: Robot es el robot completo
%   -RobotPlanta = Robot.links (para Simulink)
%   -Kvf, Kpf: par�metros del control PD
%   -Ke: rigidez de la pared
%   -fd: Fuerza deseada

init_control_fuerza;

%Correr Simulaci�n en Simulink
fuerza;

%Graficar espacio cartesiano y espacio de joints, desado y real; y fuerzas
graficar_control_fuerza;


