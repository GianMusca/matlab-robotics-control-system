%% init_control_cartesiano.m
%
%     En este archivo se define la funci�n que generar� la trayectoria 
%     (posici�n, velocidad y aceleraci�n) para una trayectoria deseada,
%     indicada por su configuraci�n inicial y final.
% 
%   Recibe:
%       -robot: clase robot previamente inicializada y creada.
%       -q0: configuraci�n inicial en espacio joint
%       -pos_final: posici�n final del EE en espacio cartesiano
%       -t_final: tiempo permitido para realizar la trayectoria
%       -t_muestreo: tiempo de muestreo para la trayectoria
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ pos,vel,acc ] = generate_trajectory(pos_inicial,pos_final,t_final,t_muestreo)

[ pos,vel,acc ] = jtraj(pos_inicial, pos_final, ceil(t_final/t_muestreo));

N = ceil(t_final/t_muestreo);      %Equiespaciamos los puntos en la trayectoria
t = 0:t_muestreo:((N-1)*t_muestreo);    %Generamos los N instantes de tiempo

pos = timeseries(pos,t);                %Transformamos los datos en series temporales
vel = timeseries(vel,t);
acc = timeseries(acc,t);

end
