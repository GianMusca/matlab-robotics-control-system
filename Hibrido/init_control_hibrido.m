%% init_control_cartesiano.m
%
%     En este archivo se define la función que creará las variables con las
%     que se trabajará durante la demo
%     A saber:
%       -Robot: robot con las configuraciones necesarias cargadas.
%       -Variables del control PD.
%       -[pos, vel, acc]: Posición, Velocidad y Aceleración generadas a
%       partir de la trayectoria deseada. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init_robot;                 %Llama al robot que se usará durante la demo

RobotPlanta = Robot.links;    %Asignacion de planta sin perturbación
Robot = Robot.perturb(0.8);          %con perturbación

T0=transl(1.9,0.1,0);   % Cerca de la pared
q0 = Robot.ikine(T0,'q0', [0 0], 'mask', [1, 1, 0, 0, 0, 0]);    %Posicion joint inicial

%% Ganancias del sistema de control, se toma criticamente amortiguado
freq = 5;                    %Freq = 5Hz genera una respuesta suficientemente rápida
Kp = (2*pi*freq)^2*eye(2);
Kv = 2*sqrt(Kp)*eye(2);

%% Obtención de trayectorias
t_final = 5;                %Le daremos al robot 5seg para llegar hasta el destino
pos_inicial = [1.9, 0.1, 0];       %Cargamos la posición de destino
pos_final = [0.1, 1.9, 0];       %Cargamos la posición de destino
t_muestreo = 4e-2;          %Tiempo de muestreo

[pos,vel,acc] = generate_trajectory(pos_inicial,pos_final,t_final,t_muestreo);

%% Ganancias fuerza
Kpf = 5000*eye(2);
Kvf = 2*sqrt(Kpf)*eye(2);

%% Rigidez de la pared y fuerza deseada
Ke = 1000; 
fd=10/sqrt(2)*[1 1];