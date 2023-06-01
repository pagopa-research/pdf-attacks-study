#!/bin/bash

paths=("Malicious" "Benign")
for basepath in "${paths[@]}"
do

    # Execute peepdf on the filtered dataset and save the output for each pdf
    mkdir ${basepath}/peepdf_output
    for filename in $(ls -1 ${basepath}/uniq_pdfs)
    do
        peepdf -g -l -f ${basepath}/uniq_pdfs/${filename} > ${basepath}/peepdf_output/${filename}.txt
    done

    mkdir ${basepath}/verapdf_output
    # Execute verapdf on the filtered dataset and save the output for each pdf
    for filename in $(ls -1 ${basepath}/uniq_pdfs)
    do
        verapdf --loglevel 1 --format json --nonpdfext ${basepath}/uniq_pdfs/${filename} > ${basepath}/verapdf_output/${filename}.json
    done

    # Parse the output of peepdf for each file and count the number of files containing JS code
    PDF_FILES=$(( $(ls -1 ${basepath}/peepdf_output | wc -l) ))
    #PDF_FILES=$(ls -1 ${basepath}/uniq_pdfs | wc -l)
    PDF_FILES_JS=0
    true > ${basepath}/js_pdfs.txt
    true > ${basepath}/nojs_pdfs.txt
    for filename in $(ls -1 ${basepath}/peepdf_output)
    do
        JS_NUM=$(cat ${basepath}/peepdf_output/${filename} | grep "Objects with JS code" | cut -d " " -f 5 | grep -o "[0-9]*")
        if [ ! -z "$JS_NUM" ]
        then
            PDF_FILES_JS=$((PDF_FILES_JS + 1))
            echo "$filename,$JS_NUM" >> ${basepath}/js_pdfs.txt
        else
            echo "$filename" >> ${basepath}/nojs_pdfs.txt
        fi
    done
    echo "The total number of PDF files is $PDF_FILES" > ${basepath}/stats.txt
    echo "The number of PDF files containing JS is $PDF_FILES_JS" >> ${basepath}/stats.txt
    echo "The percentage of PDF/A files is: $(($PDF_FILES_JS * 100 / $PDF_FILES))%" >> ${basepath}/stats.txt

    # Parse the output of verapdf for each file and count the number of files compliant with PDF/A standard
    PDF_FILES_PDFA=0
    true > ${basepath}/pdfa_flavours.txt
    true > ${basepath}/pdfa_pdfs.txt
    for filename in $(ls -1 ${basepath}/verapdf_output)
    do 
        PDFA_FLAVOUR=$(cat ${basepath}/verapdf_output/${filename} | grep "PDF file is compliant with Validation Profile requirements" | grep -o "PDF/A[^ ]* ")
        if [ ! -z "$PDFA_FLAVOUR" ]
        then
            PDF_FILES_PDFA=$((PDF_FILES_PDFA + 1))
            echo $PDFA_FLAVOUR >> ${basepath}/pdfa_flavours.txt
            echo "$filename,$PDFA_FLAVOUR" >> ${basepath}/pdfa_pdfs.txt
        fi
    done
    awk '{a[$0]++} END {for (i in a) print i "," a[i]}' "${basepath}/pdfa_flavours.txt" | sort > ${basepath}/pdfa_flavours.csv
    echo "The number of PDF/A files is $PDF_FILES_PDFA" >> ${basepath}/stats.txt
    echo "The percentage of PDF/A files is: $(($PDF_FILES_PDFA * 100 / $PDF_FILES))%" >> ${basepath}/stats.txt
    
done
