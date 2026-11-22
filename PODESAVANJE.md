# GitHub Pages za podatke „Poslovnik uz prenos“

Ovaj folder (`govori/poslovnik-uz-prenos-podaci`) postaje javni GitHub repo. GitHub Pages ga objavljuje kao sajt, a proširenje čita `sednice/<videoId>.json`.

Sve što se ovde objavi je **javno**. Ovo uključuje i AI oznake „moguća povreda“, osim ako objaviš sa `--bez-ai`.

## Jednom: podešavanje (oko 5 minuta)
1. Na github.com napravi novi **javni** repo `poslovnik-uz-prenos-podaci`, prazan (bez README fajla).
2. U Terminalu:
   ```
   cd ~/Documents/izbori/x/govori/poslovnik-uz-prenos-podaci
   git init
   git add .
   git commit -m "Početak"
   git branch -M main
   git remote add origin https://github.com/hraband/poslovnik-uz-prenos-podaci.git
   git push -u origin main
   ```
3. Na GitHub-u, u repou, otvori **Settings → Pages**. Pod „Build and deployment“ izaberi **Deploy from a branch**, grana `main`, folder `/ (root)`, pa **Save**. Posle minut-dva sajt je na
   `https://hraband.github.io/poslovnik-uz-prenos-podaci/`
4. U proširenju otvori panel, pa **Podešavanja** na dnu. Upiši
   `https://hraband.github.io/poslovnik-uz-prenos-podaci/sednice`
   i klikni **Sačuvaj**. Chrome pita za dozvolu za tu adresu, a ti je dozvoli.

**Proba:** u repou je već jedan probni fajl, za deo III od 17. 11. (samo 5 ukazivanja na povredu, bez AI). Otvori deo III. Na dnu panela treba da piše „Izvor: podaci sa linka“.

## Svaki put: nova sednica
```
cd ~/Documents/izbori/x/govori/poslovnik-uz-prenos/alati
python3 obradi_sednicu.py "YOUTUBE LINK" --naslov "…" --tacka "…"
cd ../../poslovnik-uz-prenos-podaci
bash objavi.sh <videoId>            # sa AI oznakama
bash objavi.sh <videoId> --bez-ai   # samo pomenuti članovi
```
`objavi.sh` prvo pokaže koliko događaja ima. Objavljuje tek kad otkucaš `da`.
