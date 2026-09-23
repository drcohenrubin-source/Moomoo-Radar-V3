#!/bin/zsh
set -eu
cd "${0:A:h}"
python3 - <<'REBUILD'
import hashlib,json,os
from pathlib import Path
m=json.loads(Path('PARTES.json').read_text());out=Path(m['output']);tmp=out.with_suffix('.rebuilding');whole=hashlib.sha256()
with tmp.open('wb') as f:
 for r in m['parts']:
  b=Path(r['file']).read_bytes()
  if len(b)!=r['bytes'] or hashlib.sha256(b).hexdigest()!=r['sha256']:raise SystemExit('Parte ausente ou corrompida: '+r['file'])
  f.write(b);whole.update(b)
if whole.hexdigest()!=m['sha256']:raise SystemExit('Falha na integridade do pacote')
os.replace(tmp,out)
print('Pacote completo reconstruído e verificado:',out)
REBUILD
