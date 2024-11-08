%% Control de posición no lineal de un manipulador robótico %%%%%%%%%%%%%%%
%               Nombre                  Legajo
%   Grupo:     -Lin, Xi                 59780
%              -Muscariello, Gianfranco 60361
%              -Figueroa, Alejo         60412
%              -Molina, Facundo         60526
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Introducción %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Se desarrollará un controlador Cartesiano de posición para desplazar
% el efector final desde el punto (x0, y0) hasta el punto (x1, y1) 
% Además, se insertará un obstáculo en la forma de una pared en el plano
% XY, conteniendo los puntos (2,0) y (0,2)
% Finalmente, se repetiran las pruebas con una perturbación del 80%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preparación del espacio de trabajo
clc
%% Inicialización de variables de trabajo
% Luego de inicializar, se cargan al espacio de trabajo:
%   -Robot y RobotPlanta: Robot es el robot completo
%   -RobotPlanta = Robot.links (para Simulink)
%   -pos: posiciones x,y,z en funcion del tiempo para la trayectoria deseada
%   -vel: velocidades x,y,x en funcion del tiempo para la trayectoria
%   -acc: aceleraciones x,y,x en funcion del tiempo para la trayectoria
%   -Kv, Kp: parámetros del control PD

init_control_cartesiano;

%Correr Simulación en Simulink
control_pos_no_lineal;

%Graficar espacio cartesiano y espacio de joints, desado y real
graficar_control_cartesiano;