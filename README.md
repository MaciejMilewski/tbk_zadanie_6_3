# Przed odpaleniem run.ps1
W windows przed uruchomieniem należy dodać mapowanie localhosta (tutaj na test.com):
w pliku C:\Windows\System32\Drivers\etc\hosts dodać wpis: ```127.0.0.1 test.com```

# Instrukcja

Skrypty uruchamiające oraz czyszczące są napisane w PowerShell, działają na Windows 10.

- Uruchomienie - w katalogu z plikiem run.ps1
```sh
.\run.ps1
```
- Czyszczenie - w katalogu z plikiem clean.ps1
```sh
.\clean.ps1
```

# Zapytania:
- http://test.com/cars
- http://test.com/cars?year=2020
- http://test.com/addCar 
# Przykładowe body JSON przy dodawaniu nowego car:

```
{
  "model": "Scania R450",
  "year": 2010,
  "details": "Very good condition"
}
```