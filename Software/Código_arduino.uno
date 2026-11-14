#include <FastLED.h>

// CONFIGURACAO DA FITA
#define NUM_LEDS 300
#define DATA_PIN 3

// SENSOR PIR HC-SR501
#define SENSOR_PIR 2

// FITA LED
CRGB leds[NUM_LEDS];

// CORES
const CRGB cores[] = {
  CRGB::Blue,
  CRGB::Red,
  CRGB::Green,
  CRGB::Purple,
  CRGB::Cyan,
  CRGB::White,
  CRGB(255, 80, 150)
};

const int TOTAL_CORES = 7;

// TEMPOS
const unsigned long TEMPO_AUSENCIA = 4000;
const unsigned long INTERVALO_CORES = 3000;

// CONTROLE
bool iluminacaoLigada = false;

unsigned long ultimaPresenca = 0;
unsigned long ultimaTrocaCor = 0;

int corAtual = 0;

void setup() {

  Serial.begin(9600);

  pinMode(SENSOR_PIR, INPUT);

  FastLED.addLeds<WS2812B, DATA_PIN, GRB>(
    leds, NUM_LEDS
  );

  FastLED.setBrightness(80);

  FastLED.clear();
  FastLED.show();

  Serial.println("NEXUS SMART HOME");
  Serial.println("Inicializando PIR...");

  // ESTABILIZACAO DO SENSOR
  delay(10000);

  Serial.println("SISTEMA PRONTO!");
  Serial.println("AGUARDANDO PRESENCA...");
}

void loop() {

  unsigned long agora = millis();

  int presenca = digitalRead(SENSOR_PIR);

  // DETECCAO DE PRESENCA
  if (presenca == HIGH) {

    // REGISTRA A ULTIMA DETECCAO
    ultimaPresenca = agora;

    // LIGA A ILUMINACAO
    if (!iluminacaoLigada) {

      iluminacaoLigada = true;

      corAtual = 0;

      ultimaTrocaCor = agora;

      fill_solid(
        leds,
        NUM_LEDS,
        cores[corAtual]
      );

      FastLED.show();

      Serial.println("PRESENCA DETECTADA!");
      Serial.println("ILUMINACAO LIGADA!");
    }
  }

  // VERIFICA TEMPO SEM PRESENCA
  if (iluminacaoLigada &&
      presenca == LOW &&
      agora - ultimaPresenca >= TEMPO_AUSENCIA) {

    iluminacaoLigada = false;

    FastLED.clear();
    FastLED.show();

    Serial.println("AUSENCIA DETECTADA!");
    Serial.println("ILUMINACAO DESLIGADA!");
  }

  // TROCA DE CORES
  if (iluminacaoLigada &&
      agora - ultimaTrocaCor >= INTERVALO_CORES) {

    ultimaTrocaCor = agora;

    corAtual++;

    if (corAtual >= TOTAL_CORES) {
      corAtual = 0;
    }

    fill_solid(
      leds,
      NUM_LEDS,
      cores[corAtual]
    );

    FastLED.show();
  }
}
