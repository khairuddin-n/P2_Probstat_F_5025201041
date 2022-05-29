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
![1a](https://user-images.githubusercontent.com/56571284/170868831-6085be95-9041-4079-aa30-e4b982bb7656.jpg)

### 1B
Mencari nilai t (p-value)
```R
t.test(x, y, alternative = "greater", var.equal = FALSE)
```
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
![2](https://user-images.githubusercontent.com/56571284/170872835-2970f9a0-1dc0-4314-8d67-37f499fed049.jpg)

### 2C
Kesimpulan berdasarkan P-Value yang dihasilkan

> Nilai dari P adalah 1
P(Z > 8.9744) = 1 - P(Z < 8.977) <br>
= 1 - 1 <br>
= 0 <br>
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
![3c](https://user-images.githubusercontent.com/56571284/170874246-fbef1ae3-78cc-4358-b1bb-b1841d5d704e.jpg)

### 3D
Nilai Kritikal
```R
sp <- sqrt(((n1-1)*sd1^2 + (n2-1)*sd2^2)/(df))
T_value <- (mean1-mean2)/(sp*sqrt((1/n1)+(1/n2)))
```
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
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
```R
df4 <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")

library(ggpubr)
ggboxplot(df4, x = "Group", y = "Length", 
          color = "Group",
          ylab = "Length", xlab = "Group")
```
![4a](https://user-images.githubusercontent.com/56571284/170879320-5bf9d8ff-a9ee-47ea-bb60-81ff26af6c88.jpeg)<br>
Tidak ada outlier

### 4B
Carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
```R
library(onewaytests)
bartlett.test(Length ~ Group, data = df4)
```
![4b](https://user-images.githubusercontent.com/56571284/170879381-4a91070d-d1d8-4f44-8254-87975b9f6c4f.jpg)

### 4C
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
```R
Model1 <- lm(formula = Group ~ Length, data = df4)
print(Model1)
```
![4c](https://user-images.githubusercontent.com/56571284/170879470-6a2b69ee-2972-4c2a-aef4-2ffba88b1c61.jpg)

### 4D
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
```R
summary(Model1)$coefficients[2,4]
```
![4d](https://user-images.githubusercontent.com/56571284/170879511-7e23bff8-465b-46b2-b951-9a637230d481.jpg)

## Soal 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk
mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan
dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil
Eksperimen.

### 5A
Buatlah plot sederhana untuk visualisasi data
```R
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

# membaca dan mengecek data
GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GTL)
str(GTL)

# membuat plot sederhana
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```
![5a](https://user-images.githubusercontent.com/56571284/170879954-6101dd90-594d-4879-a66d-c7450fba4787.jpeg)

### 5B
Lakukan uji ANOVA dua arah
```R
# membuat variabel sebagai faktor untuk ANOVA
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

# menghitung varians
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
![5b-1](https://user-images.githubusercontent.com/56571284/170879956-f2fc9a74-9546-4318-b75a-a779a908e3b1.jpg)
![5b-2](https://user-images.githubusercontent.com/56571284/170879959-c3744c07-821c-4b68-8fe6-42ace293a95b.jpg)

### 5C
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![5c](https://user-images.githubusercontent.com/56571284/170880107-c40c8220-a059-4cc0-b265-e8592d87be52.jpg)

### 5D
Lakukan uji Tukey
```R
tukey <- TukeyHSD(anova)
print(tukey)
```
![5d](https://user-images.githubusercontent.com/56571284/170880301-e33c8454-3888-40ab-b169-a4b7c2bd060e.jpg)

### 5E
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
![5e-1](https://user-images.githubusercontent.com/56571284/170880402-5be050e8-0127-49d8-82f9-7e3a033cb7b0.jpg)
![5e-2](https://user-images.githubusercontent.com/56571284/170880404-10977fc6-7abf-49a2-9db1-14c9ac421d04.jpg)
