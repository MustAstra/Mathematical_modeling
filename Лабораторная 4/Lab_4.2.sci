w = sqrt(10);
g = 1;

function f = force(t)
    f = 0;
endfunction

function dx = system(t, x)
    dx(1) = x(2);
    dx(2) = -w*w*x(1) - g*x(2) + force(t);
endfunction

t0 = 0;
x0 = [0; 0];
t = 0:0.05:60;

x = ode(x0, t0, t, system);

n = size(x, "c");
for i = 1:n
    y1(i) = x(1, i);
    y2(i) = x(2, i);
end

clf;
subplot(2,1,1);
plot(t, y1);
xtitle('Решение: x(t) для \ddot{x} + \dot{x} + 10x = 0');
xgrid();

subplot(2,1,2);
plot(y1, y2);
xtitle('Фазовый портрет для \ddot{x} + \dot{x} + 10x = 0');
xgrid();
