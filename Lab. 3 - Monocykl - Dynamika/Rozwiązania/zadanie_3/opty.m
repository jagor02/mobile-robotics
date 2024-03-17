function J = opty(x)
    %{
    OPIS FUNKCJI
    Funckja wykorzystywana jest do optymalizacji parametrów Kp_dyn, Ki_dyn,
    układu regulacji stabilizujący prędkość v_Q. Na podstawie wyników
    symulacji (końcowej wartości wskaźnika jakości)
    można dokonać optymalizacji.
    %}

    assignin('base', 'Kp_dyn', x(1));
    assignin('base', 'Ki_dyn', x(2));

    simulation = sim("model_dynamiki_v.slx"); % symulacja
    
    J = sum(simulation.J_dyn.signals.values(end));
end