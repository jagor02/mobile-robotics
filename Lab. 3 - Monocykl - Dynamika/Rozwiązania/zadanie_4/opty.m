function J = opty(x)
    %{
    OPIS FUNKCJI
    Funckja wykorzystywana jest do optymalizacji parametrów Kp_v, Kp_w,
    Kp_dyn, Ki_dyn układu regulacji umożliwiającego monocyklowi podążanie za zadaną ścieżką.
    Na podstawie wyników symulacji (końcowej wartości wskaźnika jakości)
    można dokonać optymalizacji.
    %}

    assignin('base', 'Kp_v', x(1));
    assignin('base', 'Kp_w', x(2));
    assignin('base', 'Kp_dyn', x(3));
    assignin('base', 'Ki_dyn', x(4));

    simulation = sim("model.slx"); % symulacja
    
    J = sum(simulation.J.signals.values(end));
end