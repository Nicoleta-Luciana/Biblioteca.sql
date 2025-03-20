Acest proiect reprezintă un sistem de gestiune a unei biblioteci creat în Oracle SQL. 
Proiectul include tabele pentru autori, cărți, membri și împrumuturi, împreună cu diverse operațiuni pentru gestionarea și interogarea datelor.

Proiectul este structurat în mai multe fișiere:
creare_tabele.sql – conține scriptul pentru crearea tabelelor și a relațiilor dintre ele (chei primare și străine).
inserare_data.sql – include date de test pentru a verifica funcționarea corectă a tabelelor.
operatiuni.sql – conține interogări pentru gestionarea împrumuturilor, modificarea statusului cărților și rapoarte;
               - definește view-uri pentru a simplifica interogările și trigger-e pentru automatizarea actualizării statusului cărților în funcție de împrumuturi.

Funcționalități principale:
-> Adăugare, actualizare și ștergere de autori, cărți și membri
-> Gestionare împrumuturi și returnări
-> Actualizare automată a statusului cărților prin trigger-e
-> Interogări complexe pentru generarea de rapoarte
