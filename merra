#﻿Date of issue: 20.11.2018
#created by	  : Andreas Stumpf

#Anfang Beispiel
#wenn gilt 015 < x <= 045 dann sector1          #wenn gilt 132 < x < 156 dann sector6

#sector1         =  "015-045"                   #sector1          = "012-036"
#sector2         =  "045-075"                   #sector2          = "036-060"
#sector3         =  "075-105"                   #sector3          = "060-084"
#sector4         =  "105-135"                   #sector4          = "084-108"
#sector5         =  "135-165"                   #sector5          = "108-132"
#sector6         =  "165-195"                   #sector6          = "132-156"
#sector7         =  "195-225"                   #sector7          = "156-180"
#sector8         =  "225-255"                   #sector8          = "180-204"
#sector9         =  "255-285"                   #sector9          = "204-228"
#sector10        =  "285-315"                   #sector10         = "228-252"
#sector11        =  "315-345"                   #sector11         = "252-276"
#sector12        =  "345-015"                   #sector12         = "276-300"
                                                #sector13         = "300-324"
                                                #sector14         = "324-348"
                                                #sector15         = "348-012"
#Ende Beispiel


#start Init
lower_limit_wind_speed          = 3                                                                                                               #untere Grenze des Geschwindigkeitsfilters wählen
upper_limit_wind_speed          = 25                                                                                                              #obere  Grenze des Geschwindigkeitsfilters wählen

count_wind_speed_sector         = 20                                                                                                              #In wie viel Sektoren soll die Wind-geschwindigkeit eingeteilt werden?
count_wind_direction_sector     = 12                                                                                                              #In wie viel Sektoren soll die Wind-richtung        eingeteilt werden?

column_wind_speed               = 2                                                                                                               #in welcher Spalte stehen die Wind-geschwindigkeiten
column_wind_direction           = 3                                                                                                               #in welcher Spalte stehen die Wind-richtungen
column_power                    = 4                                                                                                               #in welcher Spalte stehen die Leistungsdaten

count_per_hour_load             = 6                                                                                                               #wie viele Messungen werden pro Stunde getätigt

input_filename                  = 'Rohdaten_Verarbeitung_20+.csv'                                                                                 #Input -Dateinamen angeben
output_filename                 = 'Output.csv'                                                                                                    #Output-Dateinamen angeben

seperator                       = ';'                                                                                                             #Trennzeichen wählen
#end   Init


#start CSV  --> wind_input_list
require 'csv'
wind_input_list                 =  []
file                            =  File.new(input_filename, 'r')                                                                                  #Inputdatei laden
file.each_line("\n") do |row|                                                                                                                     #jedes Zeilenend als neue "Row" interpretieren

    columns                     =  row.split(seperator)                                                                                           #"Row" wird an jedem seperator gesplitted
    wind_input_list             << columns                                                                                                        #Input einer Liste zuweisen

end

for i in 0 .. wind_input_list.length - 1 do

    wind_input_list[i][column_wind_speed - 1] = wind_input_list[i][column_wind_speed - 1].gsub(",",".").to_f                                      #Jedes "," durch "." ersetzen und alle Einträge in Fließkommazahlen umwandeln

end
#end   CSV   --> wind_input_list


#start init filter
                  zähler    = Array.new(upper_limit_wind_speed + 1 , 0)
       data_array_list_P    = Array.new(upper_limit_wind_speed + 1 , 0)

       data_array_list_V    = Array.new((upper_limit_wind_speed - lower_limit_wind_speed) + 1 , 0)                                                #Liste erstellen in der die Windgeschwindigkeits  Daten gesammelt werden
data_output_array_list_V    = Array.new((upper_limit_wind_speed - lower_limit_wind_speed) + 1 , 0)
       text_array_list_V    = Array.new((upper_limit_wind_speed - lower_limit_wind_speed) + 1 , 0)                                                #Headerliste erstellen
          headers_list_V    = Array.new(count_wind_speed_sector                           + 1 ,"")                                                #Headerliste erstellen

       data_array_list_D    = Array.new(count_wind_direction_sector                           , 0)                                                #Liste erstellen in der die Windrichtungs         Daten gesammelt werden
data_output_array_list_D    = Array.new(count_wind_direction_sector                           , 0)
       text_array_list_D    = Array.new(count_wind_direction_sector                           , 0)                                                #Headerliste erstellen
          headers_list_D    = Array.new(count_wind_direction_sector                       + 1 ,"")                                                #Headerliste erstellen


for i in 0 .. count_wind_direction_sector do

    text_array_list_D[i] = (i * (360 / count_wind_direction_sector))                                                                              #Text Array füllen mit Sektorenbezeichnung nach Mitte der Sektoren z.B. 0,30,60,90,...

end

for i in lower_limit_wind_speed .. upper_limit_wind_speed do

    text_array_list_V[i - lower_limit_wind_speed] = i.to_s                                                                                        #Text Array füllen mit Sektorenbezeichnung z.B.1,2,3,4,5,...

end
#end   init filter


#start filter windspeed
for element_counter in 1 .. wind_input_list.length - 1 do                                                                                         #Schleife durchläuft jeden Datensatz
  if      wind_input_list[element_counter][(column_wind_speed - 1)]   != 0 then                                                                   #leere und Werte die 0 sind vom Abgleich ausschließen
      if  wind_input_list[element_counter][(column_wind_speed - 1)]   >   upper_limit_wind_speed then                                             #obere  Grenze checken für Grenzbereich
              data_array_list_V[data_array_list_V.length - 1] = data_array_list_V[data_array_list_V.length - 1] + 1                               #Bereichscounter um 1 erhöhen, da Bedingung erfüllt
            if wind_input_list[element_counter][column_power - 1].to_f >= 0 then
                data_array_list_P[data_array_list_V.length - 1] = data_array_list_P[data_array_list_V.length - 1].to_f + wind_input_list[element_counter][column_power - 1].to_f
                if wind_input_list[element_counter][column_power - 1] != "" then
                  zähler[data_array_list_V.length - 1] = zähler[data_array_list_V.length - 1].to_f + 1
                end
              end
      end

      if      wind_input_list[element_counter][(column_wind_speed - 1)]   <=  lower_limit_wind_speed then                                         #untere Grenze checken für Grenzbereich
                data_array_list_V[0]                        = data_array_list_V[0] + 1                                                            #Bereichscounter um 1 erhöhen, da Bedingung erfüllt
              if wind_input_list[element_counter][column_power - 1].to_f >= 0 then
                data_array_list_P[0]                        = data_array_list_P[0].to_f + wind_input_list[element_counter][column_power - 1].to_f
                if wind_input_list[element_counter][column_power - 1] != "" then
                  zähler[0] = zähler[0].to_f + 1
                end
              end
      end

      range = lower_limit_wind_speed + 1 .. (upper_limit_wind_speed)                                                                              #Bereichsliste erstellen, die abgearbeitet wird
      for counter in range do                                                                                                                     #Schleife durchläuft jeden Bereich

            min_speed = (counter.to_f - (0.5)).to_f                                                                                               #untere Grenze erstellen
            max_speed = (counter.to_f + (0.5)).to_f                                                                                               #obere  Grenze erstellen

            if      wind_input_list[element_counter][(column_wind_speed - 1)]   >   min_speed then                                                #untere Grenze checken für Grenzbereich
                if  wind_input_list[element_counter][(column_wind_speed - 1)]   <=  max_speed then                                                #obere  Grenze checken für Grenzbereich
                    data_array_list_V[counter-lower_limit_wind_speed] = data_array_list_V[counter-lower_limit_wind_speed] + 1                     #Bereichscounter um 1 erhöhen, da Bedingung erfüllt
                    if wind_input_list[element_counter][column_power - 1].to_f >= 0 then
                      data_array_list_P[counter-lower_limit_wind_speed] = data_array_list_P[counter-lower_limit_wind_speed].to_f + wind_input_list[element_counter][column_power - 1].to_f
                      if wind_input_list[element_counter][column_power - 1] != "" then
                        zähler[counter-lower_limit_wind_speed] = zähler[counter-lower_limit_wind_speed].to_f + 1
                      end
                    end
                end
            end

      end
  end

end
#end   filter windspeed


#start filter winddirection
for element_counter in 1 .. wind_input_list.length-1 do                                                                                           #Schleife durchläuft jeden Datensatz

    range = 0 .. (count_wind_direction_sector)                                                                                                    #Bereichsliste erstellen, die abgearbeitet wird
    for counter in range do                                                                                                                       #Schleife durchläuft jeden Bereich

        min_direction =       (0.5) * (360 / count_wind_direction_sector)                                                                         #untere Grenze erstellen
        max_direction = 360 - (0.5) * (360 / count_wind_direction_sector)                                                                         #obere  Grenze erstellen
        if      wind_input_list[element_counter][(column_wind_direction - 1)].to_i != 0 then                                                      #leere und Werte die 0 sind vom Abgleich ausschließen
            if      wind_input_list[element_counter][(column_wind_direction - 1)].to_i  <=  min_direction                                         #untere Grenze checken für Grenzbereich
              if    wind_input_list[element_counter][(column_wind_direction - 1)].to_i  >   max_direction then                                    #obere  Grenze checken für Grenzbereich
                    data_array_list_D[0] = data_array_list_D[0] + 1                                                                               #Bereichscounter um 1 erhöhen, da Bedingung erfüllt
              end
            end

            min_direction = (((counter)*(360/count_wind_direction_sector))-(0.5 * (360 / count_wind_direction_sector)))                           #untere Grenze erstellen
            max_direction = (((counter)*(360/count_wind_direction_sector))+(0.5 * (360 / count_wind_direction_sector)))                           #obere  Grenze erstellen
            if      wind_input_list[element_counter][(column_wind_direction - 1)].to_i  >   min_direction then                                    #untere Grenze checken für Grenzbereich
                if  wind_input_list[element_counter][(column_wind_direction - 1)].to_i  <=  max_direction then                                    #obere  Grenze checken für Grenzbereich
                    data_array_list_D[counter - 1] = data_array_list_D[counter - 1] + 1                                                           #Bereichscounter um 1 erhöhen, da Bedingung erfüllt
                end
            end
      end
    end

end
#end   filter winddirection


#start interpret data_array_list_V
counter_speed = 0                                                                                                                                 #Zähler initialisieren
for i in 0 .. data_array_list_V.length - 1 do                                                                                                     #Alle Einträge der Liste zählen

    counter_speed = counter_speed + data_array_list_V[i]                                                                                          #ist ein Eintrag vorhanden wird er zum bisherigen dazuaddiert

end

for i in 0 .. data_array_list_V.length - 1 do                                                                                                     #Die gesamte Datenliste durchlaufen

    if    data_array_list_V[i]  !=  0 then                                                                                                        #Einträge die schon 0 sind vor Div0 schützen
          data_output_array_list_V[i]  =   (((data_array_list_V[i] * 10000 / (counter_speed)).to_f) / 100)                                        #Anteil ausrechnen und in Fließkommazahl umwandeln
    end

end
#end   interpret data_array_list_V


#start interpret power
for i in 0 .. data_array_list_P.length - 1 do
  if zähler[i] != 0 then
    data_array_list_P[i] = (data_array_list_P[i].to_f) / (zähler[i].to_f)
  end
end
#end   interpret power


#start interpret data_array_list_D
counter_direction = 0                                                                                                                             #Zähler initialisieren
for i in 0 .. data_array_list_D.length - 1  do                                                                                                    #Alle Einträge der Liste zählen

    counter_direction = counter_direction + data_array_list_D[i]                                                                                  #ist ein Eintrag vorhanden wird er zum bisherigen dazuaddiert

end

for i in 0 .. data_array_list_D.length - 1 do

    if    data_array_list_D[i]  !=  0 then                                                                                                        #Einträge die schon 0 sind vor Div0 schützen
          data_output_array_list_D[i]  =   (((data_array_list_D[i] * 10000 / (counter_direction)).to_f) / 100)                                    #Anteil ausrechnen und in Fließkommazahl umwandeln
    end

end
#end   interpret data_array_list_D


#start check sum
counter_speed     = 0                                                                                                                             #Zähler initialisieren
for i in 0 .. data_array_list_V.length - 1 do                                                                                                     #Alle Einträge der Liste zählen

    counter_speed = counter_speed + data_array_list_V[i]                                                                                          #Summe bilden über die Anteile der Windgeschwindigkeitssektoren

end

counter_direction = 0                                                                                                                             #Zähler initialisieren
for i in 0 .. data_array_list_D.length - 1 do                                                                                                     #Alle Einträge der Liste zählen

    counter_direction = counter_direction + data_array_list_D[i]                                                                                  #Summe bilden über die Anteile der Windrichtungssektoren

end
#end   check sum


#start output
for i in 0 .. count_wind_direction_sector- 1 do                                                                                                   #Schleife durchläuft jeden Datensatz

    a_help  = (((i+1) * (360 / count_wind_direction_sector)) - (0.5 * (360 / count_wind_direction_sector))).to_s                                  #String erstellen um Zeilenlänge zu sparen
    b_help  = (((i+1) * (360 / count_wind_direction_sector)) + (0.5 * (360 / count_wind_direction_sector))).to_s                                  #String erstellen um Zeilenlänge zu sparen
    headers_list_D[i] = a_help + "-" + b_help                                                                                                     #Header erstellen Hilfsstrings vereinen
  if i == count_wind_direction_sector - 1 then                                                                                                    #überprüfen ob es sich um den letzten Eintrag handelt
    a_help  = ((i     * (360 / count_wind_direction_sector)) + (0.5 * (360 / count_wind_direction_sector))).to_s                                  #String erstellen um Zeilenlänge zu sparen
    b_help  = ((0.5)  * (360 / count_wind_direction_sector)).to_s                                                                                 #String erstellen um Zeilenlänge zu sparen
    headers_list_D[i] = a_help + "-" + b_help                                                                                                     #Header der Sonderkategorie erstellen
  end

end

for i in lower_limit_wind_speed .. upper_limit_wind_speed  do                                                                                     #Schleife durchläuft jeden Datensatz

  if i == lower_limit_wind_speed then                                                                                                             #überprüfen ob es sich um den ersten Eintrag handelt
        headers_list_V[i - lower_limit_wind_speed] = "x <" + (lower_limit_wind_speed + 0.5).to_s                                                  #Header für ersten  Eintrag erstellen
    else
    if i == upper_limit_wind_speed then                                                                                                           #überprüfen ob es sich um den letzten Eintrag handelt
        headers_list_V[i - lower_limit_wind_speed] = "x >" + (upper_limit_wind_speed - 0.5).to_s                                                  #Header für letzten Eintrag erstellen
        else
        headers_list_V[i - lower_limit_wind_speed] = (i - (0.5)).to_s + "-" + (i + (0.5)).to_s                                                    #allgemeine Header erstellen
    end
  end

end


output                  = File.new(output_filename, "w+")                                                                                         #Dateinamen für neu erstellte Outputdatei wählen
output_list             = Array.new(13,"")                                                                                                        #neue Outputliste erstellen
File.open(output, "a") do |file|                                                                                                                  #Datei öffnen

    for i in 0 .. count_wind_direction_sector do                                                                                                  #Schleife durchläuft jeden Datensatz

        output_list[0]  = output_list[0] +           headers_list_D[i].to_s                  + ";"                                                #genaue Header      in die erste   Zeile
        output_list[1]  = output_list[1] +        text_array_list_D[i + 1].to_s              + ";"                                                #kurze Header       in die zweite  Zeile
        output_list[2]  = output_list[2] +        data_array_list_D[i].to_s                  + ";"
        output_list[3]  = output_list[3] + data_output_array_list_D[i].to_s.gsub("." , ",")  + ";"                                                #dazugehörige Daten in die dritte  Zeile
        output_list[4]  = ""                                                                                                                      #Leerzeile          in die vierte  Zeile

    end

    for i in 0 .. upper_limit_wind_speed do                                                                                                       #Schleife durchläuft jeden Datensatz

        output_list[5]  = output_list[5]  +           headers_list_V[i].to_s                 + ";"                                                #genaue Header      in die fünfte  Zeile
        output_list[6]  = output_list[6]  +        text_array_list_V[i].to_s                 + ";"                                                #kurze Header       in die sechste Zeile
        output_list[7]  = output_list[7]  +        data_array_list_V[i].to_s                 + ";"
        output_list[8]  = output_list[8]  + data_output_array_list_V[i].to_s.gsub("." , ",") + ";"                                                #dazugehörige Daten in die siebte  Zeile
        output_list[9]  = ""                                                                                                                      #Leerzeile          in die achte   Zeile
        output_list[10] = output_list[10] +        data_array_list_P[i].round(2).to_s        + ";"
        output_list[11] = ""

    end

    output_list[0]  = "Bereichsgrenzen"       + ";" + output_list[0]
    output_list[1]  = "Bereichsmitten"        + ";" + output_list[1]
    output_list[2]  = "Anzahl Werte / 1"      + ";" + output_list[2]
    output_list[3]  = "Anteil / %"            + ";" + output_list[3]
    output_list[5]  = "Bereichsgrenzen"       + ";" + output_list[5]
    output_list[6]  = "Bereichsmitten"        + ";" + output_list[6]
    output_list[7]  = "Anzahl Werte / 1"      + ";" + output_list[7]
    output_list[8]  = "Anteil / %"            + ";" + output_list[8]
    output_list[10] = "Leistung / kW"         + ";" + output_list[10]

    output_list[12] = "Check Speed Sum:"      + ";" + counter_speed.round(2).to_s                                                                 #Checksum Speed     in die neunte  Zeile
    output_list[13] = "Check Direction Sum:"  + ";" + counter_direction.round(2).to_s                                                             #Checksum Direction in die zehnte  Zeile

    file.puts output_list                                                                                                                         #erstellte Zeilen in die Datei schreiben

end

puts "fertig"
exit()                                                                                                                                            #Programm schließen
#end   output
