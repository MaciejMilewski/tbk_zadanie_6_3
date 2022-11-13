# Instrukcja

Skrypty uruchamiające oraz czyszczące są napisane w PowerShell, działają na Windows 10.

- Uruchomienie - w katalogu z plikiem run.ps1
```sh
.\run.ps1
```
- Czyszczenie - w katalogu z plikiem clean_after_run.ps1
```sh
.\clean_after_run.ps1
```

Przykładowe zapytanie:
- http://localhost:5000/cars (Wysłać GET do pobrania wszystkich samochodów)
- http://localhost:5000/cars?year=2018 (Wysłać GET - pobierze jednen samochód z 2018)
