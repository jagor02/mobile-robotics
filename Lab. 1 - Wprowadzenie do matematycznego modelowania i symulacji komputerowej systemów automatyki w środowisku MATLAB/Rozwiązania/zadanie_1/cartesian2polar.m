function [] = cartesian2polar(x1, y1, a, b)
    %{
    OPIS FUNKCJI
    Funkcja na podstawie dostarczonych danych określających strukturę
    geometryczną (prostokąt) określonych w układzie wpółrzędnych
    kartezjańskich wyznacza jej współrzędne biegunowe oraz ilustuje obiekt
    w danych układach współrzędnych (współrzędne kartezjańskie
    w uk. kartezjańksim; współrzędne biegunowe w uk. kartezjańskim;
    współrzędne biegunowe w uk. biegunowym)
    %}
    
    %{
    OPIS PARAMETRÓW WEJŚCIOWYCH FUNKCJI
    x1 - wsp. x-owa lewego dolnego wierzchołka prostokąta
    y1 - wps. y-owa lewego dolnego wierzchołka prosotkąta
    a - długość boku poziomego prostokąta
    b - długość boku pionowego prostokąta
    %}
    
    x2 = x1 + a; % wsp. x-owa prawego górnego wierzchołka prostokąta 
    y2 = y1 + b; % wsp. y-owa prawego górnego wierzchołka prostokąta 
    
    figure();
    title("Współrzędne kartezjańskie w uk. kartezjańskim");
    hold on;
    x11 = linspace(x1, x2, 1000);
    y11 = y1*ones(1, 1000);
    plot(x11, y11, 'k'); % pierwszy bok prostokąta
    x22 = x1*ones(1, 1000);
    y22 = linspace(y1, y2, 1000);
    plot(x22, y22, 'k'); % drugi bok prostokąta
    x33 = linspace(x1, x2, 1000);
    y33 = y2*ones(1, 1000);
    plot(x33, y33, 'k'); % trzeci bok prostokąta
    x44 = x2*ones(1, 1000);
    y44 = linspace(y1, y2, 1000);
    plot(x44, y44, 'k'); % czwarty bok prostokąta
    axis([x1 - 1, x2 + 1, y1 - 1, y2 + 1]);
    xlabel("x");
    ylabel("y");
    grid on;
    hold off;
    
    figure();
    title("Współrzędne biegunowe w uk. kartezjańskim");
    hold on;
    [theta1, rho1] = cart2pol(x11, y11); % wsp. biegunowe pierwszego boku prostokąta
    plot(theta1, rho1, 'k');
    [theta2, rho2] = cart2pol(x22, y22); % wsp. biegunowe drugiego boku prostokąta
    plot(theta2, rho2, 'k');
    [theta3, rho3] = cart2pol(x33, y33); % wsp. biegunowe trzeciego boku prostokąta
    plot(theta3, rho3, 'k');
    [theta4, rho4] = cart2pol(x44, y44); % wsp. biegunowe czwartego boku prostokąta
    plot(theta4, rho4, 'k');
    xlabel("theta");
    ylabel("rho");
    grid on;
    hold off;

    figure();
    % Współrzędne biegunowe w uk. biegunowym
    polarplot(theta1, rho1, 'k', theta2, rho2, 'k', theta3, rho3, 'k', theta4, rho4, 'k');
end