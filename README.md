# Laporan Tugas Besar  
## Desain FPGA dan SoC 2024  
### Desain FPGA dan SoC  

**Kelompok** :  
**Nama–NIM Anggota 1** :  
**Nama–NIM Anggota 2** :  
**Nama–NIM Anggota 3** :  

---

# Judul  
**Sequence Detector Pola 101 Menggunakan Mealy Machine Berbasis FPGA**

[jelaskan judul tugas besar yang akan dibuat]

---

# Deskripsi  
Project ini bertujuan untuk merancang dan mengimplementasikan **sequence detector** berbasis **Mealy Machine** untuk mendeteksi pola bit **101** menggunakan bahasa **Verilog HDL** dan dijalankan pada FPGA **DE1-SoC**.  

Sistem membaca input bit secara serial, kemudian menghasilkan output **HIGH** secara langsung (pada transisi state) ketika pola **101** terdeteksi. Karena menggunakan **Mealy Machine**, output ditentukan oleh kombinasi *state* dan *input*, sehingga respons deteksi lebih cepat dibandingkan Moore machine.

Desain mencakup:  
- Diagram state Mealy Machine  
- Implementasi RTL  
- Testbench & simulasi ModelSim  
- Implementasi hardware pada DE1-SoC  

---

# Fungsi  
- Mendeteksi pola **101** pada aliran data input serial  
- Menghasilkan output HIGH secara langsung saat pola terdeteksi  
- Menunjukkan implementasi Mealy FSM pada FPGA  

---

# Fitur dan Spesifikasi  

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

### **Langkah-langkah**
1. Kompilasi desain di Quartus dan download file `.sof` ke FPGA.  
2. Berikan input bit menggunakan **SW0**.  
3. Tekan **KEY0** untuk memberikan clock (jika digunakan mode step clock).  
4. Output HIGH akan muncul pada **LED0** jika pola **101** muncul dalam urutan input.  

### **Flowchart**
