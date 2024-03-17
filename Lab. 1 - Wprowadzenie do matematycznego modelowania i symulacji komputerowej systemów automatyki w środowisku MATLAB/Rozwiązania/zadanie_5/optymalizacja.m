function J = optymalizacja(x)
    %{
    OPIS FUNKCJI
    Funckja wykorzystywana jest do optymalizacji parametrów alfa, beta, K
    modelu mat. uk. fizycznego. Na podstawie wyników symulacji (końcowej
    wartości wskaźnika jakości) można dokonać optymalizacji.
    %}

    assignin('base', 'alfa', x(1));
    assignin('base', 'beta', x(2));
    assignin('base', 'K', x(3));

    %simulation = sim("model_u2.slx"); % symulacja
    simulation = sim("model_u2_x2.slx"); % symulacja
    
    J = simulation.J.signals.values(end);
end