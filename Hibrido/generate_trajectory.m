%% init_control_cartesiano.m
%
%     En este archivo se define la función que generará la trayectoria 
%     (posición, velocidad y aceleración) para una trayectoria deseada,
%     indicada por su configuración inicial y final.
% 
%   Recibe:
%       -robot: clase robot previamente inicializada y creada.
%       -q0: configuración inicial en espacio joint
%       -pos_final: posición final del EE en espacio cartesiano
%       -t_final: tiempo permitido para realizar la trayectoria
%       -t_muestreo: tiempo de muestreo para la trayectoria
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ pos,vel,acc ] = generate_trajectory(pos_inicial,pos_final,t_final,t_muestreo)

Ri = eye(3);                %Orientacion posicion inicial, la dejamos neutra
Rf = eye(3);                %Orientacion posicion final

Ti = [Ri pos_inicial'; [0 0 0 1]];   %Matriz transformación homogenea inicial
Tf = [Rf pos_final'; [0 0 0 1]];   %Matriz transformación homogenea final

N = ceil(t_final/t_muestreo);      %Equiespaciamos los puntos en la trayectoria
traj = ctraj(Ti, Tf, N);    %Generamos una trayectoria cartesiana con velocidad trapezoidal

%---Obtención de posición y sus derivadas---%
pos = traj(1:3,4,:);            %Extraemos las posiciones de la trayectoria
vel = diff(pos,1,3)/t_muestreo;        %Derivacion
vel = cat(3,vel,zeros(3,1));    
acc = diff(vel,1,3)/t_muestreo;        %Derivacion
acc = cat(3,acc, zeros(3,1));

t = 0:t_muestreo:((N-1)*t_muestreo);    %Generamos los N instantes de tiempo

pos = timeseries(pos,t);                %Transformamos los datos en series temporales
vel = timeseries(vel,t);
acc = timeseries(acc,t);
end
