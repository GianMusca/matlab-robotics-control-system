% Grafico todas las trayectorias en 3D
%% Grafico de XYZ
tiledlayout(2,2)

t_final= 2.5;

pos_z_real = zeros(length(out.X_real.Data(:,1)));
plot3(out.X_real.Data(:,1)', out.Y_real.Data(:,1)', pos_z_real');
xlabel('Eje X [m]') 
ylabel('Eje Y [m]')
zlabel('Eje Z [m]') 

axis([0.5 1.5 -1 1 -1 1])
title('Trayectoria Real');
legend('X_{real}','Y_{real}','Z_{real}');
grid on;

% Para graficar cada trayectoria particular

nexttile
plot(out.X_real.Data(:,1)', out.Y_real.Data(:,1)'); %Grafico XY_REAL
xlabel('Eje X [m]') 
ylabel('Eje Y [m]')
legend('XY_{real}');
axis([0 2 -1 1])
title('Plano XY Real');
grid on;

nexttile
plot(out.X_real.Time', out.X_real.Data(:,1)');
xlabel('Tiempo [seg]') 
ylabel('Eje X [m]')
title('Eje X: Real');
legend('X_{real}');
grid on;

nexttile
plot(out.Y_real.Time', out.Y_real.Data(:,1)');
xlabel('Tiempo [seg]') 
ylabel('Eje Y [m]')
title('Eje Y: Real');
legend('Y_{real}');
grid on;

%% Gráfico de espacio Joint

figure
plot(out.Q_joints);
xlabel('Tiempo [seg]');
ylabel('$\theta_{1}, \theta_{2} [rad]$','interpreter','latex');
title('Espacio de Joints');
legend('\theta_{1_{real}}', '\theta_{2_{real}}');
grid on;

%% Gráfico de Fuerzas


figure
tiledlayout(1,2)

nexttile
t = out.F_ejercida.Time';
const = @(x)(fd(1)).*x.^(0);
plot(t, const(t))
xlabel('Tiempo [seg]') 
ylabel('Fuerza en X [N]')
hold on
plot(out.F_ejercida.Time', out.F_ejercida.Data(:,1)');
title('Fuerza en Y: Deseada vs. Real');
legend('F_{X_{d}}','F_{X_{real}}');
grid on;
hold off


nexttile
t = out.F_ejercida.Time';
const = @(x)(fd(2)).*x.^(0);
plot(t, const(t))
xlabel('Tiempo [seg]') 
ylabel('Fuerza en Y [N]')
hold on
plot(out.F_ejercida.Time', out.F_ejercida.Data(:,2)');
title('Fuerza en X: Deseada vs. Real');
legend('F_{X_{d}}','F_{X_{real}}');
grid on;