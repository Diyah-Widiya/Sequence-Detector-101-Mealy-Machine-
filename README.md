# Laporan Tugas Besar  
### Kuliah Desain FPGA dan SoC  

**Kelompok** :  
**Nama–NIM Anggota 1** :  
**Nama–NIM Anggota 2** :  
**Nama–NIM Anggota 3** :  

---

# Judul  
**Sequence Detector Pola 101 Menggunakan Mealy Machine Berbasis FPGA**
---

# Deskripsi 
[jelaskan deskripsi umum tugas besar yang akan dibuat]

Project ini bertujuan untuk merancang dan mengimplementasikan **sequence detector** berbasis **Mealy Machine** untuk mendeteksi pola bit **101** menggunakan bahasa **Verilog HDL** dan dijalankan pada FPGA **DE1-SoC**.  

Sistem membaca input bit secara serial, kemudian menghasilkan output **HIGH** secara langsung (pada transisi state) ketika pola **101** terdeteksi. Karena menggunakan **Mealy Machine**, output ditentukan oleh kombinasi *state* dan *input*, sehingga respons deteksi lebih cepat dibandingkan Moore machine.

Desain mencakup:  
- Diagram state Mealy Machine  
- Implementasi RTL  
- Testbench & simulasi ModelSim  
- Implementasi hardware pada DE1-SoC  

---

# Fungsi 
[jelaskan fungsi dari tugas besar yang akan dibuat secara singkat]

// ini contoh 
- Mendeteksi pola **101** pada aliran data input serial  
- Menghasilkan output HIGH secara langsung saat pola terdeteksi  
- Menunjukkan implementasi Mealy FSM pada FPGA  

---

# Fitur dan Spesifikasi  
[jelaskan fitur yang dimiliki oleh tugas besar yang akan dibuat]

## **Fitur**
- Mendeteksi pola biner **101**  
- Respons deteksi lebih cepat karena Mealy Machine  
- Mendukung *overlapping detection*, contoh:  
  - Input `10101` menghasilkan dua kali deteksi  
- Input dari switch FPGA  
- Output berupa LED indikator  

## **Spesifikasi**
- Input bit dari **SW0**  
- Clock 50 MHz internal FPGA  
- Output deteksi pada **LED0**  
- FSM terdiri dari 3 state (untuk pola 101)  
- Implementasi Verilog HDL  
- Simulasi menggunakan ModelSim  
- FPGA: DE1-SoC (Cyclone V)  

---

# Cara Penggunaan  
[Bisa dalam bentuk flowchart agar lebih mudah dimengerti, bisa dalam bentuk poin – poin penjelasan]

### **Langkah-langkah**
1. Kompilasi desain di Quartus dan download file `.sof` ke FPGA.  
2. Berikan input bit menggunakan **SW0**.  
3. Tekan **KEY0** untuk memberikan clock (jika digunakan mode step clock).  
4. Output HIGH akan muncul pada **LED0** jika pola **101** muncul dalam urutan input.  

### **Flowchart**

# Blok Diagram  
[Menggambarkan blok-blok yang digunakan, diberi paragraf penjelasan kegunaan dan input output setiap blok]
// ini contoh 
<img width="629" height="250" alt="image" src="https://github.com/user-attachments/assets/7992a6ba-355d-429f-aa73-e2f0b3810c51" />


# FSM 
[Menjelaskan cara kerja dan transisi dalam FSM]

### Penjelasan Blok  
- **Input Handler**: Mengambil bit dari switch dan mengirimkan ke FSM.  
- **Mealy FSM Detector**: Memproses input & state, menghasilkan output langsung jika pola ditemukan.  
- **Output Driver**: Mengatur LED indikator deteksi pola.

---

# FSM (Mealy Machine)

FSM dirancang untuk mendeteksi pola **101**.

### **State (3 state Mealy)**
- **S0** – Belum menerima bagian pola  
- **S1** – Menerima ‘1’  
- **S2** – Menerima ‘10’  

<img width="303" height="181" alt="image" src="https://github.com/user-attachments/assets/104a3f8d-a7dc-47b0-80a0-106e2b8adeb8" />

### **Tabel Transisi FSM Mealy (Pola 101)**

<img width="762" height="200" alt="image" src="https://github.com/user-attachments/assets/a1bb5e9f-f80b-4ba2-b9f5-dbbbe2acc1b9" />


**Output terjadi saat transisi dari S2 dengan input = 1.**

---


