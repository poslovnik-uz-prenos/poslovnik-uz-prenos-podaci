#!/bin/bash
# Kopira ../objava/<videoId>.json u sednice/ i objavljuje na GitHub Pages.
# Upotreba:  ./objavi.sh <videoId>            (sa AI oznakama)
#            ./objavi.sh <videoId> --bez-ai   (samo pomenuti članovi)
set -e
cd "$(dirname "$0")"
VID="$1"
[ -z "$VID" ] && { echo "Upotreba: ./objavi.sh <videoId> [--bez-ai]"; exit 1; }
IZVOR="../objava/$VID.json"
[ -f "$IZVOR" ] || { echo "Nema fajla $IZVOR. Prvo pokreni obradi_sednicu.py."; exit 1; }
if [ "$2" = "--bez-ai" ]; then
  python3 -c "import json,sys; d=json.load(open(sys.argv[1])); d['dogadjaji']=[e for e in d['dogadjaji'] if e['tip']=='clan']; json.dump(d,open(sys.argv[2],'w'),ensure_ascii=False,indent=1)" "$IZVOR" "sednice/$VID.json"
else
  cp "$IZVOR" "sednice/$VID.json"
fi
python3 -c "import json,sys; d=json.load(open(sys.argv[1])); c=sum(e['tip']=='clan' for e in d['dogadjaji']); print(f'{sys.argv[1]}: {c} pomena/povreda, {len(d[\"dogadjaji\"])-c} AI oznaka')" "sednice/$VID.json"
read -p "Objaviti javno na GitHub? (da/ne) " ODG
[ "$ODG" = "da" ] || { echo "Nije objavljeno."; exit 0; }
git add "sednice/$VID.json"
git commit -m "Sednica $VID"
git push
echo "Objavljeno. Proširenje vidi promenu za oko minut."
