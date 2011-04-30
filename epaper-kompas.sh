#!/bin/bash

# Downloader untuk Kompas ePaper
# Dibuat oleh Sugeng Doyle, dimodifikasi oleh Utian Ayuba dan dimodifikasi lagi oleh Nikko Haendratnio

echo "Masukan Tanggal Terbit Koran KOMPAS ePaper (01-31): "
read TGLTERBIT

echo "Masukan Bulan Terbit Koran KOMPAS ePaper (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec): "
read BLNTERBIT

echo "Masukan Tahun Terbit Koran KOMPAS ePaper (0000-9999): "
read THNTERBIT

TGL=""$TGLTERBIT"-"$BLNTERBIT"-"$THNTERBIT""

echo "Tanggal Terbit Koran KOMPAS ePaper Yang Anda Masukan adalah "$TGL""

# Membuat folder berdasarkan tanggal yang dibuat
mkdir -p $TGL

# URL Utama
URL="http://images.cdn.realviewdigital.com/rvimageserver/Kompas/Kompas/"

# Mendownload halaman pertama
echo "Sedang Mendownload Koran KOMPAS ePaper Halaman Pertama Tanggal "$TGL"..."
wget -nvc -P $TGL $URL$TGL"/page0000001.jpg"

# Masukan jumlah halaman koran terbit
echo -n "Silahkan Cek Jumlah Halaman Koran KOMPAS ePaper, Terletak Dipojok Kanan Atas Pada Halaman Pertama Koran KOMPAS ePaper Kemudian Anda Masukan Disini (0-9999): "
read PAGE

# Mendownload halaman selanjutnya
echo "Sedang Mendownload Koran KOMPAS ePaper Tanggal "$TGL" Dari Halaman #2 Sampai Halaman #"$PAGE".... "
CHAP=2

until [ $CHAP -gt $PAGE ]; do

if [ ${#CHAP} == 1 ]; then
CH="00"$CHAP
else if [ ${#CHAP} == 2 ]; then
CH="0"$CHAP
else CH=$CHAP
fi
fi

wget -nvc -P $TGL $URL$TGL"/""page0000"$CH".jpg"

let CHAP+=1
done

echo "Download Koran KOMPAS ePaper Telah Selesai. Koran KOMPAS ePaper Telah Disimpan Pada Folder "$TGL"."

exit;