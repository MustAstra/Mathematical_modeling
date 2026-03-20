// Параметры
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

// Система уравнений
function dx = syst1(theta, x)
    dx(1) = x(1) - (a1/c1)*x(1)*x(1) - (b/c1)*x(1)*x(2);
    dx(2) = (c2/c1)*x(2) - (a2/c1)*x(2)*x(2) - (b/c1)*x(1)*x(2);
endfunction

// Начальные условия
theta0 = 0;
M1_0 = 2.5;
M2_0 = 1.8;
x0 = [M1_0; M2_0];

// Временной интервал
theta = 0:0.01:30;

// Решение
y = ode(x0, theta0, theta, syst1);

// Построение графиков
clf;
plot(theta, y(1,:), 'r');
plot(theta, y(2,:), 'b');
xtitle('Случай 1: Без социально-психологических факторов', 'θ', 'Объем продаж');
legend(['Фирма 1 (M₁)'; 'Фирма 2 (M₂)']);
xgrid(1);

// Вывод коэффициентов
disp("Коэффициенты:");
disp("a1 = " + string(a1));
disp("a2 = " + string(a2));
disp("b = " + string(b));
disp("c1 = " + string(c1));
disp("c2 = " + string(c2));

// Стационарное состояние
M1_star = (c1 - (b*c2)/(c1*a2)) / (a1/c1);
M2_star = (c2 - b*M1_star/c1) / (a2/c1);
disp("Стационарное состояние:");
disp("M1* = " + string(M1_star));
disp("M2* = " + string(M2_star));
