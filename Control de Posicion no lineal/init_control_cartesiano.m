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

%RobotPlanta = Robot.links;    %Asignacion de planta sin perturbación
Robot = Robot.perturb(0.8);          %con perturbación

%% Ganancias del sistema de control, se toma criticamente amortiguado
freq = 4.5;                    %Freq = 4.5Hz genera una respuesta suficientemente rápida y con menor sobrepico
Kp = (2*pi*freq)^2*eye(2);
Kv = 2*sqrt(Kp)*eye(2);

%% Obtención de trayectorias
t_final = 5;                %Le daremos al robot 5seg para llegar hasta el destino
pos_inicial = [1, -1, 0];       %Cargamos la posición de destino
pos_final = [1, 1, 0];       %Cargamos la posición de destino
t_muestreo = 4e-2;          %Tiempo de muestreo

q0 = [0, -pi/2];
[pos,vel,acc] = generate_trajectory(pos_inicial,pos_final,t_final,t_muestreo);

%% Trayectorias en espacio joint

T_traj=transl(pos.Data);
q_traj = Robot.ikine(T_traj, 'q0', q0, 'mask',[1, 1, 0, 0, 0, 0]);

N = ceil(t_final/t_muestreo);      %Equiespaciamos los puntos en la trayectoria
t = 0:t_muestreo:((N-1)*t_muestreo);    %Generamos los N instantes de tiempo
q_traj = timeseries(q_traj,t);