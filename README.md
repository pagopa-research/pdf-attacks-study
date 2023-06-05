# Analisi attacchi tramite documenti PDF
Questo repository contiene l'analisi da parte di PagoPA sullo studio dell'arte relativamente ad attacchi perpetrati utilizzando documenti in formato PDF. 
L'attività è stata condotta in collaborazione con [SecSI](https://secsi.io), uno spin-off universitario dell' Università degli Studi di Napoli [Federico II](https://www.unina.it/); 

## Struttura del repository
I risultati dell'analisi sono riportati nei seguenti documenti presenti nella cartella **Deliverables**: 

* **Analisi attacchi tramite documenti PDF:** riporta le l'analisi effettuata dalle diverse fonti accademiche e tecniche utilizzate, a cui segue un'analisi effettuata su un noto dataset di documenti PDF malevoli;
* **Appendice: Analisi sul 7% dei documenti malevoli senza JS:** apporta alcuni chiarimenti su alcuni dei risultati ottenuti dall'analisi dei PDF del dataset.

Nel repository sono inoltre presenti degli scripts che sono stati utilizzati per:
* Effettuare attività di canonicalizzazione dei nomi e rimozione dei duplicati dai documenti del dataset;
* Eseguire gli strumenti peepdf e verapdf su tali documenti al fine di calcolare le statistiche riportate nei risultati dell'analisi.

## Informazioni per la riproducibilità dell'analisi effettuata

Il dataset utilizzato è il CICEvasivePDFMal2022, scaricabile al seguente link: http://205.174.165.80/CICDataset/CICEvasivePDFMal2022/Dataset/PDFs/

Per eseguire gli script successivi, basta estrarre gli archivi scaricati e salvare i documenti PDF malevoli nella cartella `Malicious/pdfs` e quelli benigni nella cartella `Benign/pdfs`.

### Filtraggio

A partire dai documenti PDF scaricati, è stata applicata una procedura di canonicalizzazione dei nomi e rimozione dei duplicati utilizzando il seguente script:
* `filter.sh`

Tale script creerà una cartella chiamata `uniq_pdfs` nelle cartelle di entrambe le classificazioni.

### Calcolo delle statistiche

Una volta normalizzato il dataset si è proceduto a lanciare gli strumenti [`peepdf`](https://github.com/jesparza/peepdf) e [`verapdf`](https://verapdf.org/) per verificare il contenuto di codice JS e la conformità allo standard PDF/A utilizzando il seguente script:
* `calculate_statistics.sh`

Tale script prende i PDF del dataset filtrato ed esegue peepdf e verapdf su di essi, salvandone l'output. Tale output viene sottoposto a parsing per ottenere le percentuali mostrate nel deliverable all'interno del file `stats.txt` per entrambe le classificazioni.


## Contributors ✨
Il progetto è stato realizzato grazie una collaborazione tra il team SecSI della Federico II e di PagoPA. Di seguito le persone che hanno contribuito ai risultati.

### SecSI Team (Federico II)
<table>
  <tr>
    <td align="center">
    <a href="https://github.com/emalderson"><img src="https://avatars.githubusercontent.com/u/49370319?v=4" width="100px;" alt=""/><br /><sub><b>Emanuele Galdi</b></sub></a><br /> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Code">💻</a> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Documentation">📖</a>
</td>
<td align="center"><a href="https://github.com/giper45"><img src="https://avatars2.githubusercontent.com/u/18548727?v=4" width="100px;" alt=""/><br /><sub><b>gx1</b></sub></a><br /> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Code">💻</a> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Project Management">📆</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Documentation">📖</a>
</td>
<td align="center"><a href="https://github.com/spromano"><img src="https://avatars1.githubusercontent.com/u/4959718?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Simon Pietro Romano</b></sub></a><br />
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Project Management">📆</a>
</td>
</table> 

### PagoPA 
<table>
<tr>
<td align="center"><a href="https://github.com/pp-ps"><img src="https://avatars.githubusercontent.com/u/63303456?v=4" width="100px;" alt=""/><br /><sub><b>Pietro Stroia</b></sub></a><br /> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Project Management">📆</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Review">📢</a> 
</td>

<td align="center"><a href="https://github.com/federicofatica-pagopa"><img src="https://avatars.githubusercontent.com/u/117305538?v=4" width="100px;" alt=""/><br /><sub><b>Federico Fatica</b></sub></a><br /> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Review">📢</a> 
</td>

<td align="center"><a href="https://github.com/grausof"><img src="https://avatars.githubusercontent.com/u/442709?v=4" width="100px;" alt=""/><br /><sub><b>Francesco Grauso</b></sub></a><br />
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Review">📢</a> 
</td>

<td align="center"><a href="https://github.com/nhoya"><img src="https://avatars.githubusercontent.com/u/7293260?v=4" width="100px;" alt=""/><br /><sub><b>Francesco Giordano</b></sub></a><br /> 
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Design">🎨</a>
<a href="https://github.com/pagopa-research/pdf-attacks-study.git" title="Review">📢</a> 
</td>
</tr>
</table>

## Licenza  
Il progetto è rilasciato sotto licenza [BSD-3-Clause](LICENSE.md).
Per informazioni circa le note di copyright è possibile consultare il file
[AUTHORS](AUTHORS). 
