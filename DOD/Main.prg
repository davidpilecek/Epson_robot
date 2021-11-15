
   
   
Function main
   Reset
   Motor On
   Power High
   Speed 60
   Accel 30, 30
   
   
   Integer i, c, v, u, j
 
 
'c = pocet desticek, tudiz pocet cyklu

c = 3

'v = vyska desticky v mm
v = 5
'u = uhel otoceni
u = 10
   
'v programu pouzivam jako pocatecni index 0, takze tomu prizpusobim i pocet cyklu
c = c - 1

'Bod_1 je bod, kde stoji na zacatku nejvyssi desticka
'Bod_1 je nastaveny tak, aby vychozi hodnota Z byla v bode nejvyssi desticky
'v tomto pripade je Bod_1 + 20 v hodnote Z podlozka

Do While True
	
  	For i = 0 To c
    	
      If i = 0 Then
      
      Print "Skladani do spiraly"
        
      EndIf
      
      Print "Zacatek ", i + 1, ". cyklu"
'     Dojde na pozici desticky
      Go Bod_1 + XY(0, 0, i * v, 0)
'     Prisaje desticku
   	  On 14
'  	  Pocka 500 ms pro radne zachyceni
   	  Wait 0.5
'  	  Zvedne se do bodu P2
   	  Pass Bod_2
'  	  Posune se nad bod, kde bude pokladat desticku
   	  Pass Bod_2 + XY(100, 0, 0, 0)
'  	  Spusti se do bodu, kde se budou skladat desticky do spiraly
      Go Bod_1 + XY(100, 0, (-i * v) + 15, i * u)
'  	  Vypne savku, tedy upusti desticku
   	  Off 14
'  	  Pocka 500 ms pro radne upusteni
   	  Wait 0.5
'     Pokud neni v poslednim cyklu
   	  If i < c Then
'     Zvedne se nad uloziste desticek
  	  Pass Bod_2 + XY(100, 0, 0, 0)
'     Presune se nad zasobnik desticek
   	  Pass Bod_2
   	  
   	  EndIf
   	   	
   	   	
   	   	
   Next i
	
	
    For j = c To 0 Step -1
   	
     If j = c Then
   	
     Print "Skladani ze spiraly"
   	
     EndIf
   	
   	 Print "Zacatek ", c - j + 1, ". cyklu"
'    Spusti se pod uhlem na nejvyssi desticku
     Go Bod_1 + XY(100, 0, (c - j) * v, j * u)
'    Prisaje desticku
   	 On 14
'    Pocka 500 ms pro radne zachyceni
   	 Wait 0.5
'    Zvedne se nad uloziste desticek
   	 Pass Bod_2 + XY(100, 0, 0, 0)
'    Presune se nad zasobnik desticek
   	 Pass Bod_2
'    Posune se na misto dalsi desticky v zasobniku
   	 Go Bod_1 + XY(0, 0, ((j - c) * v) + 15, 0)
'  	 Vypne savku, tedy upusti desticku
     Off 14
'    Pocka 500 ms pro radne upusteni
     Wait 0.5
'    Presune se nad zasobnik desticek 
   	 Pass Bod_2
   	 If j > 0 Then
'    Zvedne se nad uloziste desticek
     Pass Bod_2 + XY(100, 0, 0, 0)
   	 EndIf
   	 
   Next j

Loop


Fend


