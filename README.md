# P2_Probstat_F_5025201041
#### Nama  : Khairuddin Nasty
#### NRP   : 5025201041
#### Kelas : Probstat F

## Soal 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴  

Responden | X | Y
-------   | - | -
1         | 78 | 100
2         | 75 | 95
3         | 67 | 70  
4         | 77 | 90
5         | 70 | 90
6         | 72 | 90
7         | 78 | 89
8         | 74 | 90
9         | 77 | 100  

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari
responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah
melakukan aktivitas 𝐴 sebanyak 70.

### 1A
Mencari Standar Deviasi dari data selisih pasangan pengamatan tabel
diatas
```R
x <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
sd(x-y)
```
#### Screenshot
![1a](https://user-images.githubusercontent.com/56571284/170868831-6085be95-9041-4079-aa30-e4b982bb7656.jpg)

### 1B
Mencari nilai t (p-value)
```R
t.test(x, y, alternative = "greater", var.equal = FALSE)
```
#### Screenshot
![1b](https://user-images.githubusercontent.com/56571284/170869871-702d238d-e642-428d-99e8-889ffc8b3d70.jpg)

### 1C
Menentukan  apakah terdapat pengaruh yang signifikan secara statistika
dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada
pengaruh yang signifikan secara statistika dalam hal kadar saturasi
oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”
```R
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)
```
#### Screenshot
![1c-1](https://user-images.githubusercontent.com/56571284/170870175-adbd20e1-46f3-4d48-89f0-7b1ac0ff14ff.jpg)
![1c-2](https://user-images.githubusercontent.com/56571284/170870176-04578e80-f75c-47af-b28e-2a224cd75ff5.jpg)

## Soal 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.
Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk
mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata
23.500 kilometer dan standar deviasi 3900 kilometer.

### 2A
Apakah Anda setuju dengan klaim tersebut? 
> Setuju

### 2B
Jelaskan maksud dari output yang dihasilkan!
```R
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "less", mu = 20000,
          conf.level = 0.95)
```
#### Screenshot
![2](https://user-images.githubusercontent.com/56571284/170872835-2970f9a0-1dc0-4314-8d67-37f499fed049.jpg)

### 2C
Kesimpulan berdasarkan P-Value yang dihasilkan

> Nilai dari P adalah 1
P(Z > 8.9744) = 1 - P(Z < 8.977)
= 1 - 1
= 0
Oleh karena itu, Hipotesis awal (H0) bahwa "Mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun" dapat diterima.


## Soal 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan
permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya
didapatkanlah data berikut dari perusahaan saham tersebut.

Nama Kota/Atribut      | Bandung | Bali
--------------------   | ------- | --
Jumlah Saham           | 19      | 27
Sampel Mean            | 3.64    | 2.79
Sampel Standar Deviasi | 1.67    | 1.32  

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil
diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada
rata-ratanya (α= 0.05)?

### 3A
> H0 = Rata - rata saham di Bandung sama dengan rata - rata saham di Bali 
H1 = Rata - rata saham di Bandung tidak sama dengan rata - rata saham di Bali

### 3B
Hitung Sampel Statistik
```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```
#### Screenshot
![3b](https://user-images.githubusercontent.com/56571284/170874101-c4416590-2f1c-4e22-b370-778e02c95bcd.jpg)

### 3C
Uji Statistik (df =2)
```R
n1 <- 19
n2 <- 27
mean1 <- 3.64
mean2 <- 2.79
sd1 <- 1.67
sd2 <- 1.32
alpha <- 0.05
df <- 2

t_tabel <- qt(p=alpha/2,df=df,lower.tail = FALSE)
```
#### Screenshot
![3c](https://user-images.githubusercontent.com/56571284/170874246-fbef1ae3-78cc-4358-b1bb-b1841d5d704e.jpg)

### 3D
Nilai Kritikal
```R
sp <- sqrt(((n1-1)*sd1^2 + (n2-1)*sd2^2)/(df))
T_value <- (mean1-mean2)/(sp*sqrt((1/n1)+(1/n2)))
```
#### Screenshot
![3d](https://user-images.githubusercontent.com/56571284/170874434-4261874d-e3d8-43b6-9343-7927f79af480.jpg)
 
### 3E
>Nilai dari T_value adalah 0.41 masih berada di antara t_tabel (-4.303 < T_value < 4.303).
 
### 3F
>Hipotesis Awal (H0), yaitu "Rata-rata saham di bandung sama dengan rata - rata saham di Bali" dapat diterima
 
## Soal 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan
kucing putih dengan panjangnya masing-masing.
Jika :
diketahui dataset https://intip.in/datasetprobstat1
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

### 4A
### 4B
### 4C
### 4D
### 4E
### 4F

## Soal 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil
Eksperimen.

### 5A
### 5B
### 5C
### 5D
### 5E
