**1. Apresentação**

Esta seção apresenta o desenvolvimento do sistema de automação da Nexus Smart Home, utilizando a plataforma Arduino para controlar a iluminação RGB da residência e realizar o acionamento automático por meio de um sensor de presença.

**2. Código-fonte**

O arquivo codigo_arduino.uno contém a programação responsável pelo funcionamento dos componentes eletrônicos da casa inteligente.

**3. Tecnologias utilizadas**

Arduino;
Fita LED RGB endereçável WS2812B 5V;
Sensor de presença PIR HC-SR501;
Biblioteca Adafruit NeoPixel;
Programação em linguagem C/C++.

**4. Sistema de iluminação RGB**

A iluminação RGB permite controlar as cores da fita LED instalada na estrutura interna da residência. A programação possibilita selecionar diferentes cores e criar efeitos luminosos, contribuindo para a funcionalidade e personalização dos ambientes.

**5. Sensor de presença**

O sensor PIR HC-SR501 identifica a movimentação de pessoas por meio da variação da radiação infravermelha no ambiente. Quando uma presença é detectada, o sistema envia um sinal ao Arduino, que realiza o acionamento automático da iluminação. Após a ausência de movimentação durante o período programado, os LEDs são desligados.

**6. Funcionamento da automação**

O funcionamento do sistema ocorre por meio da integração entre o Arduino, a fita LED RGB e o sensor de presença.

A sequência operacional é:

O sensor PIR monitora continuamente o ambiente;

Ao detectar movimento, envia um sinal ao Arduino;

O Arduino processa a informação recebida;

A fita LED RGB é acionada;

Na ausência de movimento pelo tempo determinado, a iluminação é desligada.

**7. Objetivo do sistema**

O sistema foi desenvolvido para demonstrar a aplicação da automação residencial em uma estrutura física de MDF, proporcionando iluminação inteligente, praticidade e melhor aproveitamento energético.

**8. Arquivo de programação**

O código completo utilizado no projeto está disponível no arquivo codigo_arduino.uno desta pasta.
