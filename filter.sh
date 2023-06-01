#!/bin/bash

paths=("Malicious" "Benign")
for basepath in "${paths[@]}"
do
    src_dir=${basepath}/pdfs
    dst_dir=${basepath}/uniq_pdfs

    # Rinomina i files con il loro md5 e li copia in una nuova cartella, senza duplicati
    mkdir $dst_dir
    rm $src_dir/.keep
    find "$src_dir" -type f -print0 | while IFS= read -r -d '' file; do
        md5=$(md5sum "$file" | cut -d' ' -f1)
        cp "$file" "${dst_dir}/${md5}"
    done
done