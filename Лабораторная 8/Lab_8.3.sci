// Общие параметры
p_cr = 20;
N = 23;
q = 1;
tau1 = 16;
tau2 = 19;
p1 = 13;
p2 = 11;

// Расчет коэффициентов
a1 = p_cr/(tau1*tau1*p1*p1*N*q);
a2 = p_cr/(tau2*tau2*p2*p2*N*q);
b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q);
c1 = (p_cr - p1)/(tau1*p1);
c2 = (p_cr - p2)/(tau2*p2);

// Начальные условия и время
theta0 = 0;
x0 = [2.5; 1.8];
theta = 0:0.01:30;

// Случай 1: без социально-психологических факторов
function dx = syst1(theta, x)
    dx(1) = x(1) - (a1/c1)*x(1)*x(1) - (b/c1)*x(1)*x(2);
    dx(2) = (c2/c1)*x(2) - (a2/c1)*x(2)*x(2) - (b/c1)*x(1)*x(2);
endfunction

// Случай 2: с социально-психологическими факторами
function dx = syst2(theta, x)
    dx(1) = x(1) - (a1/c1)*x(1)*x(1) - ((b/c1) + 0.0017)*x(1)*x(2);
    dx(2) = (c2/c1)*x(2) - (a2/c1)*x(2)*x(2) - (b/c1)*x(1)*x(2);
endfunction

// Решения
y1 = ode(x0, theta0, theta, syst1);
y2 = ode(x0, theta0, theta, syst2);

// Построение графиков
clf;
subplot(2,1,1);
plot(theta, y1(1,:), 'r', theta, y1(2,:), 'b');
xtitle('Случай 1: Без социально-психологических факторов', '\theta', 'Объем продаж');
legend(['Фирма 1 (M_1)'; 'Фирма 2 (M_2)']);
xgrid(1);

subplot(2,1,2);
plot(theta, y2(1,:), 'r', theta, y2(2,:), 'b');
xtitle('Случай 2: С социально-психологическими факторами', '\theta', 'Объем продаж');
legend(['Фирма 1 (M_1)'; 'Фирма 2 (M_2)']);
xgrid(1);
