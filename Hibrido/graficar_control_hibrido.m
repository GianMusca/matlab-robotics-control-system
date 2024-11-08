%% Grafico de XYZ
tiledlayout(2,2)

nexttile
pos_z_deseado = zeros(length(out.X_deseado.Data(:,1)));
plot3(out.X_deseado.Data(:,1)', out.X_deseado.Data(:,2)', pos_z_deseado');
xlabel('Eje X [m]') 
ylabel('Eje Y [m]')
zlabel('Eje Z [m]') 
hold on
pos_z_real = zeros(length(out.X_real.Data(:,1)));
plot3(out.X_real.Data(:,1)', out.X_real.Data(:,2)', pos_z_real');
axis([0 2 0 2 -1 1])
title('Trayectoria Real');
legend('X_{deseado}','Y_{deseado}','Z_{deseado}', 'X_{real}','Y_{real}','Z_{real}');
grid on;
hold off

% Para graficar cada trayectoria particular

nexttile
plot(out.X_deseado.Data(:,1)',out.X_deseado.Data(:,2)');                %Grafico XY
xlabel('Eje X [m]') 
ylabel('Eje Y [m]')
hold on
plot(out.X_real.Data(:,1)', out.X_real.Data(:,2)'); %Grafico XY_REAL
legend('XY_{deseado}', 'XY_{real}');
axis([0 2 0 2])
title('Plano XY: Deseada vs. Real');
grid on;
hold off

nexttile
plot(out.X_deseado.Time',out.X_deseado.Data(:,1)');
xlabel('Tiempo [seg]') 
ylabel('Eje X [m]')
hold on
plot(out.X_real.Time', out.X_real.Data(:,1)');
title('Eje X: Deseada vs. Real');
legend('X_{d}','X_{real}');
grid on;
hold off

nexttile
plot(out.X_deseado.Time',out.X_deseado.Data(:,2)');
xlabel('Tiempo [seg]') 
ylabel('Eje Y [m]')
hold on
plot(out.X_real.Time', out.X_real.Data(:,2)');
title('Eje Y: Deseada vs. Real');
legend('Y_{d}','Y_{real}');
grid on;
hold off

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
title('Fuerza en Y: Deseada vs. Real');
legend('F_{Y_{d}}','F_{Y_{real}}');
grid on;
hold off