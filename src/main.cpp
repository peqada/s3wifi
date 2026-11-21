#include <Arduino.h>
#include <WiFi.h>

extern const char *ssid;
extern const char *password;

void setup()
{
    Serial0.begin(115200);

    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid, password);
    Serial0.print("Connecting");
    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial0.print(".");
    }
    Serial0.println();
    Serial0.print("IP: ");
    Serial0.println(WiFi.localIP());
}

void loop()
{
    static int n = 0;
    Serial0.println(WiFi.localIP());
    Serial0.println(n++);
    delay(1000);
}